package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.VnpayConfig;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.*;

@WebServlet("/admin/vnpay-query")
public class VnpayQueryServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String txnRef = req.getParameter("txnRef");

        if (txnRef == null || txnRef.trim().isEmpty()) {
            resp.getWriter().write("❌ Thiếu mã giao dịch.");
            return;
        }

        String requestId = UUID.randomUUID().toString();
        String version = "2.1.0";
        String command = "querydr";
        String currCode = "VND";
        String createDate = new java.text.SimpleDateFormat("yyyyMMddHHmmss")
                .format(new Date());

        Map<String, String> params = new HashMap<>();
        params.put("vnp_RequestId", requestId);
        params.put("vnp_Version", version);
        params.put("vnp_Command", command);
        params.put("vnp_TmnCode", VnpayConfig.vnp_TmnCode);
        params.put("vnp_TxnRef", txnRef);
        params.put("vnp_OrderInfo", "Truy van giao dich: " + txnRef);
        params.put("vnp_TransactionDate", createDate);
        params.put("vnp_CreateBy", "admin");
        params.put("vnp_IpAddr", req.getRemoteAddr());

        // Sort params
        List<String> fieldNames = new ArrayList<>(params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder requestData = new StringBuilder();
        for (String name : fieldNames) {
            String value = params.get(name);
            if (value != null && !value.isEmpty()) {
                hashData.append(name).append('=').append(value).append('&');
                requestData.append(name).append('=').append(value).append('&');
            }
        }

        String rawData = hashData.substring(0, hashData.length() - 1);
        String secureHash = hmacSHA512(VnpayConfig.vnp_HashSecret, rawData);
        requestData.append("vnp_SecureHash=").append(secureHash);

        // Send POST to VNPay API
        URL url = new URL("https://sandbox.vnpayment.vn/merchant_webapi/api/transaction");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

        try (OutputStream os = conn.getOutputStream()) {
            os.write(requestData.toString().getBytes(StandardCharsets.UTF_8));
        }

        // Read response
        Scanner scanner = new Scanner(conn.getInputStream());
        StringBuilder response = new StringBuilder();
        while (scanner.hasNext()) {
            response.append(scanner.nextLine());
        }

        resp.setContentType("application/json");
        resp.getWriter().write(response.toString());
    }

    private String hmacSHA512(String key, String data) {
        try {
            Mac hmac = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            hmac.init(secretKey);
            byte[] bytes = hmac.doFinal(data.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (Exception e) {
            throw new RuntimeException("HMAC SHA512 Error", e);
        }
    }
}
