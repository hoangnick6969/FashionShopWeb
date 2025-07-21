package controller.admin;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Order;
import util.JPAUtil;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/pending-refunds")
public class PendingRefundsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Object admin = (session != null) ? session.getAttribute("admin") : null;

        if (admin == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        EntityManager em = JPAUtil.getEntityManager();
        try {
            System.out.println("🔍 Truy vấn các đơn hàng yêu cầu hoàn tiền...");

            // ✅ Truy vấn theo requestRefund = true
            String jpql = "SELECT o FROM Order o WHERE o.requestRefund = true";
            List<Order> orders = em.createQuery(jpql, Order.class).getResultList();

            System.out.println("✅ Số đơn cần hoàn tiền: " + orders.size());

            req.setAttribute("orders", orders);
            req.getRequestDispatcher("/views/admin/vnpay/pendingRefunds.jsp").forward(req, resp);

        } catch (Exception e) {
            System.err.println("❌ Lỗi khi truy vấn đơn hoàn tiền:");
            e.printStackTrace();

            req.setAttribute("errorMessage", "Đã xảy ra lỗi: " + e.getMessage());
            req.getRequestDispatcher("/views/admin/common/error.jsp").forward(req, resp);
        } finally {
            em.close();
        }
    }
}
