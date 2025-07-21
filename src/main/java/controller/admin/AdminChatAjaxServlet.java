package controller.admin;

import com.google.gson.Gson;
import dao.ConversationMessageDAO;
import dto.ChatMessageDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.ConversationMessage;
import model.Customer;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/chat-ajax")
public class AdminChatAjaxServlet extends HttpServlet {
    private final ConversationMessageDAO messageDAO = new ConversationMessageDAO();
    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String cidRaw = request.getParameter("cid");
        if (cidRaw == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        try {
            int cid = Integer.parseInt(cidRaw);
            List<ConversationMessage> messages = messageDAO.findConversationWithCustomer(cid);

            List<ChatMessageDTO> dtoList = new ArrayList<>();
            for (ConversationMessage m : messages) {
                ChatMessageDTO dto = new ChatMessageDTO();
                dto.message = m.getMessage();
                dto.fromUser = m.isFromUser();
                
                dto.senderName = m.isFromUser()
                        ? (m.getSender() != null ? m.getSender().getName() : "Khách")
                        : "Admin";
                dto.timestamp = m.getTimestamp().toString();
                dtoList.add(dto);
            }

            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write(gson.toJson(dtoList));

        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"ID khách không hợp lệ\"}");
        }
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String customerIdRaw = request.getParameter("customerId");
    String message = request.getParameter("message");

    try {
        long customerId = Long.parseLong(customerIdRaw);

        Customer sender = new Customer();
        sender.setId((int) customerId);

        ConversationMessage msg = new ConversationMessage();
        msg.setMessage(message);
        msg.setTimestamp(LocalDateTime.now());
        msg.setFromUser(false);           // admin gửi
        msg.setSender(sender);            // khách hàng là đối tượng gửi
        msg.setReceiver(null);            // tùy bạn muốn gán AdminUser không
        msg.setRead(false);               // mặc định chưa đọc

        messageDAO.save(msg);

        response.setStatus(HttpServletResponse.SC_OK);
    } catch (NumberFormatException e) {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.getWriter().write("{\"error\": \"ID khách không hợp lệ\"}");
    }
}

}
