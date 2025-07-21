package util;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;

public class VnpayConfig {

    // URL sandbox
    public static final String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    public static final String vnp_ApiUrl = "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction";

    // Merchant credentials
    public static final String vnp_TmnCode = "HXHKGXIC";
    public static final String vnp_HashSecret = "S8KYO9SV4YFOAJAWQ10RZIRK7N8IES71";

    // URL nhận kết quả thanh toán từ VNPay
    public static final String vnp_ReturnUrl = "http://localhost:8080/PRJ301_Assignment/vnpay_return";

    /**
     * Hàm tạo mã hash bảo mật (dùng cho cả thanh toán, truy vấn, refund)
     */
    public static String hmacSHA512(String key, String data) {
        try {
            Mac hmac512 = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            hmac512.init(secretKey);
            byte[] bytes = hmac512.doFinal(data.getBytes(StandardCharsets.UTF_8));
            return bytesToHex(bytes);
        } catch (Exception ex) {
            throw new RuntimeException("Lỗi ký HMAC SHA512", ex);
        }
    }

    /**
     * Hàm chuyển byte[] → hex string
     */
    private static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes)
            sb.append(String.format("%02x", b));
        return sb.toString();
    }

    /**
     * Hàm tạo số ngẫu nhiên có n chữ số (dùng làm requestId)
     */
    public static String getRandomNumber(int length) {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append(random.nextInt(10)); // 0-9
        }
        return sb.toString();
    }
}
