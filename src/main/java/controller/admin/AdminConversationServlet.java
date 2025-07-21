package controller.admin;

import dao.ConversationMessageDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.AdminUser;
import model.ConversationMessage;
import model.Customer;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/admin/chat")
public class AdminConversationServlet extends HttpServlet {
    private final ConversationMessageDAO messageDAO = new ConversationMessageDAO();
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    request.setCharacterEncoding("UTF-8");
    response.setContentType("application/json;charset=UTF-8");

    String cidRaw = request.getParameter("customerId");
    String message = request.getParameter("message");

    if (cidRaw == null || message == null || message.trim().isEmpty()) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu customerId hoặc message.");
        return;
    }

    try {
        int customerId = Integer.parseInt(cidRaw);
        Customer customer = new Customer();
        customer.setId(customerId);

        AdminUser admin = (AdminUser) request.getSession().getAttribute("admin");
        if (admin == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Chưa đăng nhập.");
            return;
        }

        ConversationMessage msg = new ConversationMessage(customer, admin, message, false);
        msg.setRead(true); // Tin nhắn từ admin không cần đánh dấu chưa đọc
        messageDAO.save(msg);
        response.setStatus(HttpServletResponse.SC_OK);
    } catch (NumberFormatException e) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID khách hàng không hợp lệ.");
    }
}
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
    response.sendRedirect(request.getContextPath() + "/views/admin/chat.jsp");
}

    
}
