package util;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.*;

public class GeminiClientRecommendForYou {
    private static final String API_KEY = "AIzaSyDNKJSJJ-vtp709DS4sB77GpjtRDMs5yfY";

    public static String sendPrompt(String prompt) throws IOException {
        URL url = new URL("https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=" + API_KEY);


        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        conn.setDoOutput(true);

        String body = new JSONObject()
            .put("contents", new JSONArray().put(
                new JSONObject().put("parts", new JSONArray().put(
                    new JSONObject().put("text", prompt)
                ))
            ))
            .toString();

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

       JSONObject json = new JSONObject(response.toString());
        if (!json.has("candidates")) {
            return "⚠️ API Error: " + json.toString();  // Trả về toàn bộ lỗi nếu không có candidates
        }
        JSONArray parts = json.getJSONArray("candidates")
                              .getJSONObject(0)
                              .getJSONObject("content")
                              .getJSONArray("parts");

        return parts.getJSONObject(0).getString("text").replace("\\n", "\n");
    }
}
