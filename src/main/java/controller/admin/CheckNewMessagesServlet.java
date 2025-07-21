package controller.admin;

import dao.ConversationMessageDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/admin/check-new-messages")
public class CheckNewMessagesServlet extends HttpServlet {
    private final ConversationMessageDAO dao = new ConversationMessageDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        boolean hasNew = dao.hasUnreadMessages();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write("{\"hasNew\": " + hasNew + "}");
    }
}
