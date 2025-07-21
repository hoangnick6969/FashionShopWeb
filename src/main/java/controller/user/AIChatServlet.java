package controller.user;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.ChatMessage;
import model.Customer;
import model.Product;
import service.AIService;
import service.AIParser;
import dao.ProductDAO;
import dao.CartItemDAO;

import java.io.IOException;
import java.util.*;

@WebServlet("/user/chat")
public class AIChatServlet extends HttpServlet {
    private final AIService aiService = new AIService();
    private final AIParser parser = new AIParser(new ProductDAO());
    private final CartItemDAO cartDAO = new CartItemDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        try {
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customer");
            String userInput = request.getParameter("message");

            List<ChatMessage> history = (List<ChatMessage>) session.getAttribute("chatHistory");
            if (history == null) history = new ArrayList<>();
            history.add(new ChatMessage("user", userInput));

            Map<String, Object> pendingCart = (Map<String, Object>) session.getAttribute("pendingCart");
            String aiReply;

            if (pendingCart != null && userInput.equalsIgnoreCase("yes") && customer != null) {
                int productId = Integer.parseInt(pendingCart.get("productId").toString());
                int quantity = Integer.parseInt(pendingCart.get("quantity").toString());
                Product product = new ProductDAO().getProductById(productId);

                cartDAO.saveOrUpdate(customer, product, quantity);
                session.removeAttribute("pendingCart");
                aiReply = "✅ Sản phẩm đã được thêm vào giỏ hàng của bạn!";
            } else {
                aiReply = aiService.askAI(userInput);
                Map<String, Object> cartAction = parser.extractCartAction(aiReply);
                if (cartAction != null) session.setAttribute("pendingCart", cartAction);
            }

            history.add(new ChatMessage("bot", aiReply));
            session.setAttribute("chatHistory", history);

            // Trả về JSON cho client AJAX
            String json = """
                {
                    "user": "%s",
                    "bot": "%s"
                }
            """.formatted(userInput.replace("\"", "\\\""), aiReply.replace("\"", "\\\""));
            response.getWriter().write(json);

        } catch (Exception e) {
            response.setStatus(500);
            response.getWriter().write("""
                {
                    "error": "Đã xảy ra lỗi máy chủ: %s"
                }
            """.formatted(e.getMessage().replace("\"", "\\\"")));
        }
    }
}
    