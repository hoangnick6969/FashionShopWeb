package controller.user;

import dao.CategoryDAO;
import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Category;
import model.Customer;
import model.Order;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import model.OrderDetail;

@WebServlet("/order/detail")
public class OrderDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("user");

        if (customer == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String idRaw = request.getParameter("id");
        int id;
        try {
            id = Integer.parseInt(idRaw);
        } catch (NumberFormatException e) {
            response.sendError(400, "ID đơn hàng không hợp lệ");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        Order order = orderDAO.findById(id);
        if (order != null) {
    if (order.getCustomer() != null) order.getCustomer().getId();
    if (order.getPaymentMethod() != null) order.getPaymentMethod().getName();
    if (order.getShippingMethod() != null) order.getShippingMethod().getName();
    if (order.getOrderDetails() != null) {
        for (OrderDetail od : order.getOrderDetails()) {
            if (od.getProduct() != null) od.getProduct().getName();
        }
    }
}
       
       if (order == null || order.getCustomer() == null || order.getCustomer().getId() != customer.getId()) {
            response.sendError(403, "Bạn không có quyền truy cập đơn hàng này");
            return;
        }


        if (order.getStatus() != null) {
            order.setStatus(order.getStatus().trim());
        }

        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categories = categoryDAO.getAll();
        request.setAttribute("categories", categories);

        request.setAttribute("order", order);
        request.getRequestDispatcher("/views/user/order/detail.jsp").forward(request, response);
    }
}
