package service;

import dao.CartItemDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import dao.ReviewDAO;
import dao.WishlistDAO;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import model.CartItem;
import model.Customer;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.Review;
import util.GeminiClient;
import util.GeminiClientBestSelling;
import util.GeminiClientForRecommend;
import util.GeminiClientRecommendForYou;

public class AIService {
    private final ProductDAO productDAO = new ProductDAO();
    private final ReviewDAO reviewDAO = new ReviewDAO();
    private final OrderDAO orderDAO = new OrderDAO();
    private final OrderDetailDAO detailDAO = new OrderDetailDAO();
    private final CartItemDAO cartItemDAO = new CartItemDAO();
    private final WishlistDAO wishlistDAO = new WishlistDAO();

    public String askAI(String userInput) {
        String prompt = """
            Bạn là một trợ lý bán hàng thời trang thông minh, thân thiện và chuyên nghiệp. Hãy trò chuyện như một con người thực sự.

            🎯 Nhiệm vụ của bạn:
            - Trả lời tự nhiên, linh hoạt: nếu khách muốn trò chuyện thì trò chuyện thoải mái như một người bạn; nếu khách hỏi về sản phẩm thì tư vấn cụ thể.
            - Tư vấn sản phẩm phù hợp với nhu cầu khách hàng nếu có liên quan.
            - Trả lời ngắn gọn, đúng trọng tâm, không dài dòng, không lặp lại câu hỏi.
            - Gợi ý sản phẩm theo phong cách, mục đích sử dụng, hoặc mùa.
            - Dùng ngôn ngữ tự nhiên, gần gũi, dễ hiểu – như một nhân viên tư vấn chuyên nghiệp.
            - KHÔNG dùng emoji, KHÔNG dùng markdown (**, ``, JSON...).
            - KHÔNG liệt kê toàn bộ danh sách sản phẩm nếu không được yêu cầu.
            - Nếu khách nói sai chính tả, hãy cố gắng hiểu ý.
            - Nếu khách chỉ muốn nói chuyện, hãy giữ không khí thoải mái, không ép tư vấn sản phẩm.

            💬 Tin nhắn từ khách hàng:
            "%s"

            👉 Hãy trả lời như một tư vấn viên thực thụ, có thể linh hoạt trò chuyện tự nhiên nếu khách muốn.
        """.formatted(userInput);

        try {
            return GeminiClient.sendPrompt(prompt);
        } catch (IOException e) {
            if (e.getMessage().contains("RESOURCE_EXHAUSTED") || e.getMessage().contains("quota")) {
                return "⚠️ Xin lỗi, hệ thống AI hiện đang tạm quá tải do vượt giới hạn sử dụng miễn phí. Vui lòng thử lại sau ít phút nhé!";
            }
            return "❌ Đã xảy ra lỗi kết nối với hệ thống AI. Vui lòng thử lại sau.";
        }
    }

    public String recommendForUser(Customer customer) {
        List<Product> all = productDAO.getAllProducts();
        List<Product> wishlist = wishlistDAO.getWishlistedProducts(customer);
        List<CartItem> cart = cartItemDAO.getCartItemsByCustomer(customer);
        List<Order> orders = orderDAO.getOrdersByCustomerId(customer.getId());

        StringBuilder prompt = new StringBuilder();
        prompt.append("Bạn là một trợ lý thời trang chuyên nghiệp, hãy tư vấn sản phẩm phù hợp với khách hàng dựa trên thói quen mua sắm dưới đây. Trả lời tự nhiên, ngắn gọn và thân thiện như một người thật.\n\n");

        prompt.append("👛 Sản phẩm trong giỏ hàng:\n");
        if (cart.isEmpty()) {
            prompt.append("- [Trống]\n");
        } else {
            cart.forEach(c -> prompt.append("- ").append(c.getProduct().getName()).append("\n"));
        }

        prompt.append("\n❤️ Sản phẩm yêu thích:\n");
        if (wishlist.isEmpty()) {
            prompt.append("- [Trống]\n");
        } else {
            wishlist.forEach(p -> prompt.append("- ").append(p.getName()).append("\n"));
        }

        prompt.append("\n🛍️ Sản phẩm đã mua trước đây:\n");
        if (orders.isEmpty()) {
            prompt.append("- [Chưa mua sản phẩm nào]\n");
        } else {
            orders.stream()
                  .flatMap(o -> o.getOrderDetailsList().stream())
                  .forEach(d -> prompt.append("- ").append(d.getProduct().getName()).append("\n"));
        }

        prompt.append("\n📦 Danh sách sản phẩm đang có thể gợi ý:\n");
        all.forEach(p -> prompt.append("- ").append(p.getName()).append("\n"));

        try {
            return GeminiClientRecommendForYou.sendPrompt(prompt.toString());
        } catch (IOException e) {
            if (e.getMessage().contains("RESOURCE_EXHAUSTED") || e.getMessage().contains("quota")) {
                return "⚠️ Xin lỗi, hệ thống AI hiện đang tạm quá tải do vượt giới hạn sử dụng miễn phí. Vui lòng thử lại sau ít phút nhé!";
            }
            return "❌ Đã xảy ra lỗi kết nối với hệ thống AI. Vui lòng thử lại sau.";
        }
    }

    public String recommendByProductAi(int productId) {
        Product current = productDAO.getProductById(productId);
        List<Product> all = productDAO.getAllProducts();

        StringBuilder prompt = new StringBuilder("Dựa vào sản phẩm hiện tại: ")
                .append(current.getName())
                .append(", hãy gợi ý 5 sản phẩm tương tự:\n");

        all.stream()
           .filter(p -> p.getId() != productId)
           .forEach(p -> prompt.append("- ").append(p.getName()).append("\n"));

        try {
            return GeminiClientForRecommend.sendPrompt(prompt.toString());
        } catch (IOException e) {
            if (e.getMessage().contains("RESOURCE_EXHAUSTED") || e.getMessage().contains("quota")) {
                return "⚠️ Xin lỗi, hệ thống AI hiện đang tạm quá tải do vượt giới hạn sử dụng miễn phí. Vui lòng thử lại sau ít phút nhé!";
            }
            return "❌ Đã xảy ra lỗi kết nối với hệ thống AI. Vui lòng thử lại sau.";
        }
    }

    public String bestSellingAI() {
        List<OrderDetail> details = detailDAO.findAll();
        Map<Product, Integer> map = new HashMap<>();
        for (OrderDetail d : details) {
            Product p = d.getProduct();
            map.put(p, map.getOrDefault(p, 0) + d.getQuantity());
        }

        StringBuilder prompt = new StringBuilder("Các sản phẩm bán chạy nhất hiện nay:\n\n");
        map.entrySet().stream()
            .sorted(Map.Entry.<Product, Integer>comparingByValue().reversed())
            .limit(10)
            .forEach(e -> prompt.append(e.getKey().getName()).append("\n")
                    .append("Đã bán: ").append(e.getValue()).append(" sản phẩm\n")
                    .append("Mô tả: ").append(e.getKey().getDescription()).append("\n\n"));

        try {
            return GeminiClientBestSelling.sendPrompt(prompt.toString());
        } catch (IOException e) {
            if (e.getMessage().contains("RESOURCE_EXHAUSTED") || e.getMessage().contains("quota")) {
                return "⚠️ Xin lỗi, hệ thống AI hiện đang tạm quá tải do vượt giới hạn sử dụng miễn phí. Vui lòng thử lại sau ít phút nhé!";
            }
            return "❌ Đã xảy ra lỗi kết nối với hệ thống AI. Vui lòng thử lại sau.";
        }
    }

    public String recommendPopularAi() {
        List<Review> feedback = reviewDAO.getAll();
        List<Product> products = productDAO.findAllProductDetail();

        Map<Product, Double> scores = new HashMap<>();
        for (Product p : products) {
            double avg = feedback.stream()
                    .filter(f -> f.getProduct().equals(p))
                    .mapToInt(Review::getRating)
                    .average().orElse(0.0);
            long count = feedback.stream().filter(f -> f.getProduct().equals(p)).count();
            scores.put(p, avg * 2 + (count > 0 ? Math.log(count) : 0));
        }

        List<Product> sorted = scores.entrySet().stream()
                .sorted(Map.Entry.<Product, Double>comparingByValue().reversed())
                .limit(10)
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());

        StringBuilder prompt = new StringBuilder("Một số sản phẩm được đánh giá cao:\n\n");
        for (Product p : sorted) {
            double avg = feedback.stream().filter(f -> f.getProduct().equals(p)).mapToInt(Review::getRating).average().orElse(0);
            long count = feedback.stream().filter(f -> f.getProduct().equals(p)).count();
            prompt.append(p.getName())
                    .append(" - Đánh giá trung bình: ").append(String.format("%.1f", avg))
                    .append(" từ ").append(count).append(" lượt đánh giá\n");
        }

        try {
            return GeminiClientForRecommend.sendPrompt(prompt.toString());
        } catch (IOException e) {
            if (e.getMessage().contains("RESOURCE_EXHAUSTED") || e.getMessage().contains("quota")) {
                return "⚠️ Xin lỗi, hệ thống AI hiện đang tạm quá tải do vượt giới hạn sử dụng miễn phí. Vui lòng thử lại sau ít phút nhé!";
            }
            return "❌ Đã xảy ra lỗi kết nối với hệ thống AI. Vui lòng thử lại sau.";
        }
    }
}
