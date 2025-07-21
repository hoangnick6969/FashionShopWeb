package controller.user;

import dao.ConversationMessageDAO;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.AdminUser;
import model.ConversationMessage;
import model.Customer;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/user/conversation")
public class UserConversationServlet extends HttpServlet {
    private final ConversationMessageDAO messageDAO = new ConversationMessageDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Customer customer = (Customer) request.getSession().getAttribute("user");
        if (customer == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.getRequestDispatcher("/views/user/chat.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Customer customer = (Customer) request.getSession().getAttribute("user");
        if (customer == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String content = request.getParameter("message");
        if (content != null && !content.trim().isEmpty()) {
            ConversationMessage msg = new ConversationMessage();
            msg.setSender(customer);

            AdminUser admin = new AdminUser();
            admin.setId(1); // giả định 1 admin
            msg.setReceiver(admin);

            msg.setMessage(content);
            msg.setFromUser(true);
            msg.setTimestamp(LocalDateTime.now());

            messageDAO.save(msg);
        }

        response.sendRedirect(request.getContextPath() + "/user/conversation");
    }
}
