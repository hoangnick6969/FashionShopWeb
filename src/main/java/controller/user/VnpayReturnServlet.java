package controller.user;

import dao.CartItemDAO;
import dao.OrderDAO;
import dao.PaymentMethodDAO;
import dao.ShippingMethodDAO;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.CartItem;
import model.Customer;
import model.Order;
import model.OrderDetail;
import model.PaymentMethod;
import model.ShippingMethod;
import util.JPAUtil;

import java.io.IOException;
import java.util.*;

@WebServlet("/vnpay_return")
public class VnpayReturnServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");

        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("user");

        if (customer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if ("00".equals(vnp_ResponseCode)) {
            CartItemDAO cartItemDAO = new CartItemDAO();
            List<CartItem> cartItems = cartItemDAO.findByCustomer(customer);

            if (cartItems == null || cartItems.isEmpty()) {
                request.setAttribute("message", "Giỏ hàng trống, không thể tạo đơn hàng.");
                request.getRequestDispatcher("/views/order/failure.jsp").forward(request, response);
                return;
            }

            // Gắn lại customer từ DB (tránh detached)
            EntityManager em = JPAUtil.getEntityManager();
            Customer attachedCustomer = em.find(Customer.class, customer.getId());
            em.close();

            List<OrderDetail> orderDetails = new ArrayList<>();
            double totalAmount = 0;

            for (CartItem item : cartItems) {
                OrderDetail od = new OrderDetail();
                od.setProduct(item.getProduct());
                od.setQuantity(item.getQuantity());
                od.setPrice(item.getProduct().getPrice());
                totalAmount += item.getQuantity() * item.getProduct().getPrice();
                orderDetails.add(od);
            }

            PaymentMethodDAO paymentDAO = new PaymentMethodDAO();
            ShippingMethodDAO shippingDAO = new ShippingMethodDAO();
            PaymentMethod paymentMethod = paymentDAO.findById(2); // VNPay
            ShippingMethod shippingMethod = shippingDAO.findById(1); // default

            Order order = new Order();
            order.setCustomer(attachedCustomer); // 👈 Gắn trước khi lưu
            order.setOrderDate(new Date());
            order.setTotal(totalAmount);
            order.setStatus("Đã thanh toán");
            order.setPaymentMethod(paymentMethod);
            order.setShippingMethod(shippingMethod);
            order.setOrderDetails(orderDetails);

            for (OrderDetail od : orderDetails) {
                od.setOrder(order);
            }

            OrderDAO orderDAO = new OrderDAO();
            orderDAO.create(order);

            cartItemDAO.clearCart(customer.getId());

            System.out.println("✅ Thanh toán VNPay thành công. Order ID: " + order.getId());
            request.setAttribute("message", "Thanh toán thành công!");
            request.getRequestDispatcher("/views/user/order/vnpay_return.jsp").forward(request, response);
        } else {
            System.out.println("❌ Thanh toán thất bại. VNPay Response Code = " + vnp_ResponseCode);
            request.setAttribute("message", "Thanh toán thất bại. Mã lỗi: " + vnp_ResponseCode);
            request.getRequestDispatcher("/views/user/order/vnpay_return.jsp").forward(request, response);
        }
    }
}
