package controller.user;

import dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.*;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/order/confirm")
public class OrderConfirmServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("user");

            if (customer == null) {
                response.sendRedirect("login");
                return;
            }

            CartItemDAO cartItemDAO = new CartItemDAO();
            List<CartItem> cartItems = cartItemDAO.findByCustomer(customer);

            if (cartItems == null || cartItems.isEmpty()) {
                response.sendRedirect("cart");
                return;
            }

            PaymentMethod payment = new PaymentMethod();
            payment.setId(1); // COD
            payment.setName("COD");

            ShippingMethod shipping = new ShippingMethod();
            shipping.setId(1);
            shipping.setName("Giao hàng tiêu chuẩn");

            double total = cartItems.stream()
                    .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                    .sum();

            Order order = new Order();
            order.setCustomer(customer);
            order.setShippingMethod(shipping);
            order.setPaymentMethod(payment);
            order.setOrderDate(new Date());
            order.setTotal(total);
            order.setStatus("Chờ xử lý");

            OrderDAO orderDAO = new OrderDAO();
            orderDAO.insert(order);

            OrderDetailDAO detailDAO = new OrderDetailDAO();
            for (CartItem item : cartItems) {
                OrderDetail detail = new OrderDetail();
                detail.setOrder(order);
                detail.setProduct(item.getProduct());
                detail.setQuantity(item.getQuantity());
                detail.setPrice(item.getProduct().getPrice());
                detailDAO.insert(detail);
            }

            cartItemDAO.deleteByCustomerId(customer.getId());

            response.sendRedirect("success");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
        }
    }
}
