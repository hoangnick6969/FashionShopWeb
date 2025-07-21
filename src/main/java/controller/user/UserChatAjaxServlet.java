package controller.user;

import com.google.gson.Gson;
import dao.ConversationMessageDAO;
import dto.ChatMessageDTO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ConversationMessage;
import model.Customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/user/chat-ajax")
public class UserChatAjaxServlet extends HttpServlet {
    private final Gson gson = new Gson();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("application/json;charset=UTF-8");

        HttpSession session = request.getSession(false);
        Customer customer = (Customer) (session != null ? session.getAttribute("user") : null);

        if (customer == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"error\":\"Chưa đăng nhập\"}");
            return;
        }

        try {
            ConversationMessageDAO dao = new ConversationMessageDAO();
            List<ConversationMessage> messages = dao.findByCustomer(customer);

            List<ChatMessageDTO> result = new ArrayList<>();
            for (ConversationMessage m : messages) {
                ChatMessageDTO dto = new ChatMessageDTO();
                dto.message = m.getMessage();
                dto.timestamp = m.getTimestamp().toString();
                dto.fromUser = m.isFromUser();
                dto.senderName = dto.fromUser ? customer.getName() : "Admin";
                result.add(dto);
            }

            response.getWriter().write(gson.toJson(result));

        } catch (Exception ex) {
            ex.printStackTrace(); // In ra console
            response.setStatus(500);
            response.getWriter().write("{\"error\":\"Lỗi nội bộ: " + ex.getMessage() + "\"}");
        }
    }
}
