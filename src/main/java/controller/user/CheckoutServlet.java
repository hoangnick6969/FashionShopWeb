package controller.user;

import dao.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.*;

import java.io.IOException;
import java.util.*;

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("user");

        // ✅ Kiểm tra đăng nhập
        if (customer == null) {
            response.sendRedirect(request.getContextPath() + "/user/auth/login.jsp");
            return;
        }

        // ✅ Lấy giỏ hàng từ DB
        CartItemDAO cartItemDAO = new CartItemDAO();
        List<CartItem> cartItems = cartItemDAO.findByCustomer(customer);

        // ✅ Gán vào session cho VNPayServlet dùng
        session.setAttribute("cartItems", cartItems);

        // ✅ Tính tổng tiền
        double total = 0;
        if (cartItems != null) {
            total = cartItems.stream()
                    .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                    .sum();
        }

        // ✅ Load dữ liệu giao diện
        ShippingMethodDAO shippingDAO = new ShippingMethodDAO();
        PaymentMethodDAO paymentDAO = new PaymentMethodDAO();
        CategoryDAO categoryDAO = new CategoryDAO();

        request.setAttribute("total", total);
        request.setAttribute("shippingMethods", shippingDAO.getAll());
        request.setAttribute("paymentMethods", paymentDAO.getAll());
        request.setAttribute("categories", categoryDAO.getAll());

        // ✅ Hiển thị giao diện checkout
        request.getRequestDispatcher("/views/user/order/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("user");

            if (customer == null) {
                response.sendRedirect(request.getContextPath() + "/user/auth/login.jsp");
                return;
            }

            CartItemDAO cartItemDAO = new CartItemDAO();
            List<CartItem> cartItems = cartItemDAO.findByCustomer(customer);

            if (cartItems == null || cartItems.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/user/cart");
                return;
            }

            int shippingId = Integer.parseInt(request.getParameter("shippingMethod"));
            int paymentId = Integer.parseInt(request.getParameter("paymentMethod"));

            ShippingMethodDAO shippingDAO = new ShippingMethodDAO();
            PaymentMethodDAO paymentDAO = new PaymentMethodDAO();

            ShippingMethod shipping = shippingDAO.findById(shippingId);
            PaymentMethod payment = paymentDAO.findById(paymentId);

            if (shipping == null || payment == null) {
                throw new Exception("Phương thức giao hàng hoặc thanh toán không hợp lệ!");
            }

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
            session.removeAttribute("cartItems");

            // ✅ Chuyển tới trang thông báo thành công
            response.sendRedirect(request.getContextPath() + "/views/user/order/order-success.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
        }
    }
}
