package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.VnpayConfig;
import util.JPAUtil;
import model.Order;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import jakarta.persistence.*;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/admin/vnpay-refund")
public class VnpayRefundServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String txnRef = req.getParameter("txnRef");
        String amountRaw = req.getParameter("amount");

        if (txnRef == null || amountRaw == null || txnRef.trim().isEmpty() || amountRaw.trim().isEmpty()) {
            resp.getWriter().write("❌ Thiếu thông tin mã giao dịch hoặc số tiền.");
            return;
        }

        long amount = (long) (Double.parseDouble(amountRaw) * 100);
        String requestId = UUID.randomUUID().toString();
        String version = "2.1.0";
        String command = "refund";
        String transactionType = "02";
        String createDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

        Map<String, String> params = new HashMap<>();
        params.put("vnp_RequestId", requestId);
        params.put("vnp_Version", version);
        params.put("vnp_Command", command);
        params.put("vnp_TmnCode", VnpayConfig.vnp_TmnCode);
        params.put("vnp_TransactionType", transactionType);
        params.put("vnp_TxnRef", txnRef);
        params.put("vnp_Amount", String.valueOf(amount));
        params.put("vnp_OrderInfo", "Hoan tien giao dich #" + txnRef);
        params.put("vnp_TransactionNo", "0");
        params.put("vnp_CreateBy", "admin");
        params.put("vnp_IpAddr", req.getRemoteAddr());
        params.put("vnp_CreateDate", createDate);

        List<String> keys = new ArrayList<>(params.keySet());
        Collections.sort(keys);
        StringBuilder hashData = new StringBuilder();
        StringBuilder requestData = new StringBuilder();
        for (String key : keys) {
            String value = params.get(key);
            hashData.append(key).append('=').append(value).append('&');
            requestData.append(key).append('=').append(value).append('&');
        }

        String rawData = hashData.substring(0, hashData.length() - 1);
        String secureHash = hmacSHA512(VnpayConfig.vnp_HashSecret, rawData);
        requestData.append("vnp_SecureHash=").append(secureHash);

        // Send POST
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

        String jsonResponse = response.toString();
        if (jsonResponse.contains("\"vnp_ResponseCode\":\"00\"")) {
            EntityManager em = JPAUtil.getEntityManager();
            try {
                em.getTransaction().begin();
                Order order = em.find(Order.class, Integer.parseInt(txnRef));
                if (order != null) {
                    order.setStatus("Đã hoàn tiền");
                    em.merge(order);
                }
                em.getTransaction().commit();
            } catch (Exception e) {
                em.getTransaction().rollback();
            } finally {
                em.close();
            }
        }

        resp.setContentType("application/json");
        resp.getWriter().write(jsonResponse);
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