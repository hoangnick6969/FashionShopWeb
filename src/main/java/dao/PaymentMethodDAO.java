package dao;

import jakarta.persistence.EntityManager;
import model.PaymentMethod;
import util.JPAUtil;

import java.util.List;

public class PaymentMethodDAO {

    public List<PaymentMethod> getAll() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT p FROM PaymentMethod p", PaymentMethod.class).getResultList();
        } finally {
            em.close();
        }
    }
   public PaymentMethod findByName(String name) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT p FROM PaymentMethod p WHERE p.name = :name", PaymentMethod.class)
                     .setParameter("name", name)
                     .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public PaymentMethod findById(int id) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(PaymentMethod.class, id);
        } finally {
            em.close();
        }
    }
}
