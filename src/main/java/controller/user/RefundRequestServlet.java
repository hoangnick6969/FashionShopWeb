package controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.persistence.*;
import model.Order;

import java.io.IOException;

@WebServlet(name = "RefundRequestServlet", urlPatterns = {"/request-refund"})
public class RefundRequestServlet extends HttpServlet {

      private EntityManagerFactory emf;

    @Override
    public void init() throws ServletException {
        emf = Persistence.createEntityManagerFactory("FashionShopPU");
    }

    @Override
    public void destroy() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }

    /**
     * Xử lý yêu cầu POST từ nút "Yêu cầu hoàn tiền"
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String orderIdRaw = request.getParameter("orderId");
            if (orderIdRaw == null) {
                throw new IllegalArgumentException("Thiếu mã đơn hàng");
            }

            int orderId = Integer.parseInt(orderIdRaw);

            EntityManager em = emf.createEntityManager();
            Order order = em.find(Order.class, orderId);
            em.close();

            if (order == null) {
                throw new IllegalArgumentException("Không tìm thấy đơn hàng");
            }

            request.setAttribute("order", order);
            request.getRequestDispatcher("/views/user/order/refundConfirm.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(); // Hiện log trong console NetBeans
            request.setAttribute("error", "Không thể xử lý yêu cầu hoàn tiền. Lý do: " + e.getMessage());
            request.getRequestDispatcher("/views/common/error.jsp").forward(request, response);
        }
    }

    /**
     * Nếu người dùng truy cập trực tiếp bằng GET → quay lại lịch sử đơn hàng
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "views/user/order/history.jsp");
    }
}
