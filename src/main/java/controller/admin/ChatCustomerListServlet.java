package controller.admin;

import com.google.gson.Gson;
import dao.ConversationMessageDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/customers-chat")
public class ChatCustomerListServlet extends HttpServlet {
    private final ConversationMessageDAO dao = new ConversationMessageDAO();
    private final Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Customer> customers = dao.findDistinctCustomersWhoChatted();

        List<Map<String, Object>> customerDTOs = new ArrayList<>();
        for (Customer c : customers) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", c.getId());
            map.put("fullName", c.getName());  
            customerDTOs.add(map);
        }

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(customerDTOs));
    }
}
