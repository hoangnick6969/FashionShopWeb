package controller.admin;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Order;
import util.JPAUtil;

import java.io.IOException;

@WebServlet("/admin/approve-refund")
public class AdminApproveRefundServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String orderIdRaw = req.getParameter("orderId");

        if (orderIdRaw == null || orderIdRaw.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/admin/pending-refunds");
            return;
        }

        int orderId;
        try {
            orderId = Integer.parseInt(orderIdRaw);
        } catch (NumberFormatException e) {
            resp.sendRedirect(req.getContextPath() + "/admin/pending-refunds");
            return;
        }

        EntityManager em = JPAUtil.getEntityManager();

        try {
            em.getTransaction().begin();

            Order order = em.find(Order.class, orderId);

            if (order != null && Boolean.TRUE.equals(order.getRequestRefund())) {
                order.setStatus("Đang hoàn tiền");
                order.setRequestRefund(false);
                em.merge(order);
                System.out.println("✅ Admin duyệt hoàn tiền cho đơn #" + order.getId());
            }

            em.getTransaction().commit();

        } catch (Exception e) {
            em.getTransaction().rollback();
            System.err.println("❌ Lỗi khi duyệt hoàn tiền:");
            e.printStackTrace();
        } finally {
            em.close();
        }

        resp.sendRedirect(req.getContextPath() + "/admin/pending-refunds");
    }
}
