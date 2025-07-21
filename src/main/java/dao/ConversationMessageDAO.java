package dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import model.ConversationMessage;
import model.Customer;
import model.AdminUser;
import util.JPAUtil;

import java.util.List;

public class ConversationMessageDAO {

    private final EntityManager em = JPAUtil.getEntityManager();

    // ✅ Lưu tin nhắn mới
   public void save(ConversationMessage msg) {
        EntityManager em = JPAUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            em.persist(msg);
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw new RuntimeException("Không thể lưu tin nhắn", e);
        } finally {
            em.close();
        }
    }

    

    public List<ConversationMessage> findByCustomerId(int id) {
        return em.createQuery(
            "SELECT m FROM ConversationMessage m " +
            "LEFT JOIN FETCH m.sender " +
            "LEFT JOIN FETCH m.receiver " +
            "WHERE (m.sender.id = :id AND m.fromUser = true) " +
            "   OR (m.receiver.id = :id AND m.fromUser = false) " +
            "ORDER BY m.timestamp", ConversationMessage.class)
            .setParameter("id", id)
            .getResultList();
    }

    public List<Customer> findDistinctCustomersWhoChatted() {
        return em.createQuery(
            "SELECT DISTINCT m.sender FROM ConversationMessage m WHERE m.fromUser = true", Customer.class)
            .getResultList();
    }
    public List<ConversationMessage> findConversationWithCustomer(long customerId) {
        EntityManager em = JPAUtil.getEntityManager();
        return em.createQuery(
            "SELECT m FROM ConversationMessage m " +
            "WHERE m.sender.id = :cid OR m.receiver.id = :cid " +
            "ORDER BY m.timestamp", ConversationMessage.class)
            .setParameter("cid", customerId)
            .getResultList();
    }
    // ✅ Cập nhật trạng thái tin nhắn (ví dụ: set isRead = true)
    public void update(ConversationMessage message) {
        try {
            em.getTransaction().begin();
            em.merge(message);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        }
    }

    // ✅ Kiểm tra có tin nhắn nào chưa đọc từ khách hàng hay không (dùng cho admin)
    public boolean hasUnreadMessages() {
        String jpql = "SELECT COUNT(m) FROM ConversationMessage m WHERE m.fromUser = true AND m.isRead = false";
        Long count = em.createQuery(jpql, Long.class).getSingleResult();
        return count > 0;
    }


 public List<ConversationMessage> findByCustomer(Customer customer) {
    EntityManager em = JPAUtil.getEntityManager();
    try {
        return em.createQuery(
                "SELECT m FROM ConversationMessage m " +
                "LEFT JOIN FETCH m.sender " +
                "LEFT JOIN FETCH m.receiver " +
                "WHERE m.sender.id = :cid OR m.receiver.id = :cid " +
                "ORDER BY m.timestamp", ConversationMessage.class)
            .setParameter("cid", customer.getId())
            .getResultList();
    } finally {
        em.close();
    }
}

   
    // ✅ Lấy toàn bộ tin nhắn (cho admin quản lý)
    public List<ConversationMessage> findAll() {
        return em.createQuery("SELECT m FROM ConversationMessage m ORDER BY m.timestamp ASC", ConversationMessage.class)
                 .getResultList();
    }

    // (Tùy chọn) Đếm số tin nhắn chưa đọc (nếu cần hiển thị badge số lượng)
    public long countUnreadMessages() {
        String jpql = "SELECT COUNT(m) FROM ConversationMessage m WHERE m.fromUser = true AND m.isRead = false";
        return em.createQuery(jpql, Long.class).getSingleResult();
    }
}
