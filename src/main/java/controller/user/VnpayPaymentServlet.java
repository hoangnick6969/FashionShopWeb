package controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.VnpayConfig;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@WebServlet("/vnpay")
public class VnpayPaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // Lấy và kiểm tra tham số số tiền
        String amountRaw = req.getParameter("amount");
        System.out.println(">>> VNPay amountRaw = " + amountRaw); // Debug

        if (amountRaw == null || amountRaw.trim().isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu số tiền thanh toán.");
            return;
        }

        long amount;
        try {
            // Chuyển từ chuỗi sang số thập phân, rồi nhân 100 theo chuẩn VNPay
            double amountDouble = Double.parseDouble(amountRaw.trim());
            amount = (long) (amountDouble * 100);
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Số tiền không hợp lệ.");
            return;
        }

        // Tạo thông tin giao dịch
        String vnp_TxnRef = String.valueOf(System.currentTimeMillis()); // Mã đơn hàng
        String vnp_OrderInfo = "Thanh toan don hang #" + vnp_TxnRef;
        String vnp_IpAddr = req.getRemoteAddr();

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());

        // Tạo tham số gửi sang VNPay
        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", "2.1.0");
        vnp_Params.put("vnp_Command", "pay");
        vnp_Params.put("vnp_TmnCode", VnpayConfig.vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
        vnp_Params.put("vnp_OrderType", "other");
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_ReturnUrl", VnpayConfig.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        // Sắp xếp và ký dữ liệu
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();

        for (String fieldName : fieldNames) {
            String value = vnp_Params.get(fieldName);
            if (value != null && !value.isEmpty()) {
                hashData.append(fieldName).append('=')
                        .append(URLEncoder.encode(value, StandardCharsets.US_ASCII)).append('&');
                query.append(fieldName).append('=')
                        .append(URLEncoder.encode(value, StandardCharsets.US_ASCII)).append('&');
            }
        }

        // Ký HMAC SHA512
        String rawHash = hashData.substring(0, hashData.length() - 1);
        String queryUrl = query.substring(0, query.length() - 1);
        String secureHash = hmacSHA512(VnpayConfig.vnp_HashSecret, rawHash);
        queryUrl += "&vnp_SecureHash=" + secureHash;

        // Redirect đến VNPay
        String paymentUrl = VnpayConfig.vnp_PayUrl + "?" + queryUrl;
        System.out.println(">>> VNPay URL: " + paymentUrl); // Debug
        resp.sendRedirect(paymentUrl);
    }

    // Hàm ký SHA512
    public static String hmacSHA512(String key, String data) {
        try {
            Mac hmac512 = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            hmac512.init(secretKey);
            byte[] bytes = hmac512.doFinal(data.getBytes(StandardCharsets.UTF_8));
            return bytesToHex(bytes);
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi ký HMAC SHA512", e);
        }
    }

    // Hàm chuyển byte[] → hex
    private static String bytesToHex(byte[] hash) {
        StringBuilder result = new StringBuilder();
        for (byte b : hash) {
            result.append(String.format("%02x", b));
        }
        return result.toString();
    }
}
