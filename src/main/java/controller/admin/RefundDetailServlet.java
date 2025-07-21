package controller.admin;


import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Order;
import util.JPAUtil;

@WebServlet("/admin/refund-detail")
public class RefundDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String orderIdRaw = req.getParameter("orderId");
        if (orderIdRaw == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
            return;
        }

        int orderId = Integer.parseInt(orderIdRaw);
        EntityManager em = JPAUtil.getEntityManager();
        try {
            Order order = em.find(Order.class, orderId);
            req.setAttribute("order", order);
            req.getRequestDispatcher("/views/admin/vnpay/refund-detail.jsp").forward(req, resp);
        } finally {
            em.close();
        }
    }
}
