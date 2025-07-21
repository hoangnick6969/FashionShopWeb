package util;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.*;

public class GeminiClient {
    private static final String API_KEY = "AIzaSyDNKJSJJ-vtp709DS4sB77GpjtRDMs5yfY"; // 🔁 Thay bằng key thật

    public static String sendPrompt(String prompt) throws IOException {
        // ✅ Dùng endpoint v1beta + model đúng
        URL url = new URL("https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=" + API_KEY);

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        conn.setDoOutput(true);

        // 🔧 Tạo JSON body gửi lên Gemini
        String body = new JSONObject()
            .put("contents", new JSONArray().put(
                new JSONObject().put("parts", new JSONArray().put(
                    new JSONObject().put("text", prompt)
                ))
            ))
            .toString();

        // Gửi request
        try (OutputStream os = conn.getOutputStream()) {
            os.write(body.getBytes("UTF-8"));
        }

        int code = conn.getResponseCode();
        InputStream input = (code >= 200 && code < 300) ? conn.getInputStream() : conn.getErrorStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(input));
        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) response.append(line);
        reader.close();

        // ✅ Phân tích response
        JSONObject json = new JSONObject(response.toString());

        // 🛑 Nếu có lỗi từ server
        if (json.has("error")) {
            return "⚠️ API Error: " + json.get("error").toString();
        }

        // ✅ Lấy nội dung trả lời từ candidates
        JSONArray parts = json.getJSONArray("candidates")
                              .getJSONObject(0)
                              .getJSONObject("content")
                              .getJSONArray("parts");

        return parts.getJSONObject(0).getString("text").replace("\\n", "\n");
    }
}
