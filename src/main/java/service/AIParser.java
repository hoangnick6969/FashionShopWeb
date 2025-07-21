package service;

import java.util.regex.*;
import java.util.*;
import model.Product;
import dao.ProductDAO;
import org.json.JSONObject;

public class AIParser {

    private ProductDAO productDAO;

    public AIParser(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    public Map<Product, Double> parseRecommendations(String text) {
        Map<Product, Double> result = new LinkedHashMap<>();
        Pattern pattern = Pattern.compile("ID: (\\d+), Rating: (\\d\\.\\d)");
        Matcher matcher = pattern.matcher(text);

        while (matcher.find()) {
            int id = Integer.parseInt(matcher.group(1));
            double rating = Double.parseDouble(matcher.group(2));
            Product product = productDAO.getProductById(id);
            if (product != null) {
                result.put(product, rating);
            }
        }
        return result;
    }

    public List<Product> parseRelatedRecommendations(String text) {
        List<Product> list = new ArrayList<>();
        Pattern pattern = Pattern.compile("ID:\\s*(\\d+)");
        Matcher matcher = pattern.matcher(text);

        while (matcher.find()) {
            int id = Integer.parseInt(matcher.group(1));
            Product product = productDAO.getProductById(id);
            if (product != null) {
                list.add(product);
            }
        }
        return list;
    }

    public Map<Product, Integer> parseBestSellers(String text) {
        Map<Product, Integer> map = new LinkedHashMap<>();
        Pattern pattern = Pattern.compile("\\*\\*.*?\\(ID: (\\d+)\\):\\*\\*\\s*Quantity Sold: (\\d+)");
        Matcher matcher = pattern.matcher(text);

        while (matcher.find()) {
            int id = Integer.parseInt(matcher.group(1));
            int qty = Integer.parseInt(matcher.group(2));
            Product product = productDAO.getProductById(id);
            if (product != null) {
                map.put(product, qty);
            }
        }
        return map;
    }

    public Map<String, Object> extractCartAction(String responseText) {
        try {
            int jsonStart = responseText.indexOf("{\"isCartAction\"");
            if (jsonStart >= 0) {
                int jsonEnd = responseText.indexOf("}", jsonStart);
                if (jsonEnd > jsonStart) {
                    String json = responseText.substring(jsonStart, jsonEnd + 1);
                    JSONObject obj = new JSONObject(json);
                    Map<String, Object> result = new HashMap<>();
                    result.put("productId", obj.getString("productId"));
                    result.put("quantity", obj.getInt("quantity"));
                    result.put("name", obj.getString("name"));
                    return result;
                }
            }
        } catch (Exception e) {
            System.out.println("❌ JSON Parse Error: " + e.getMessage());
        }
        return null;
    }

    public boolean needsConfirmation(String responseText) {
        return responseText.contains("\"needsConfirmation\":true");
    }
}
