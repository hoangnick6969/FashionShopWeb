package controller.user;


import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceUnit;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Order;

@WebServlet(name = "RefundSubmitServlet", urlPatterns = {"/request-refund-submit"})
public class RefundSubmitServlet extends HttpServlet {
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            EntityManager em = emf.createEntityManager();
            em.getTransaction().begin();

            Order order = em.find(Order.class, orderId);
            if (order != null && order.getStatus().equals("Đã thanh toán")) {
                order.setRequestRefund(true);
                em.merge(order);
            }

            em.getTransaction().commit();
            em.close();

            request.setAttribute("message", "✅ Yêu cầu hoàn tiền đã được gửi. Quản trị viên sẽ xử lý sớm.");
            request.getRequestDispatcher("/views/user/order/refundSuccess.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Không thể gửi yêu cầu hoàn tiền: " + e.getMessage());
            request.getRequestDispatcher("/views/user/common/error.jsp").forward(request, response);
        }
    }
}
