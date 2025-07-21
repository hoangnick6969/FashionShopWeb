package model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
public class ConversationMessage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private boolean isRead = false;

    @ManyToOne
    @JoinColumn(name = "sender_id")
    private Customer sender;

    @ManyToOne
    @JoinColumn(name = "receiver_id")
    private AdminUser receiver;

    @Column(nullable = false, columnDefinition = "NVARCHAR(MAX)")
    private String message;

    @Column(nullable = false)
    private LocalDateTime timestamp;

    @Column(nullable = false)
    private boolean fromUser;

    public ConversationMessage() {}

    public ConversationMessage(Customer sender, AdminUser receiver, String message, boolean fromUser) {
        this.sender = sender;
        this.receiver = receiver;
        this.message = message;
        this.fromUser = fromUser;
        this.timestamp = LocalDateTime.now();
    }

    // ✅ Getter/setter đúng chuẩn cho boolean
    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean isRead) {
        this.isRead = isRead;
    }

    // Các getter/setter khác
    public Long getId() { return id; }

    public Customer getSender() { return sender; }

    public void setSender(Customer sender) { this.sender = sender; }

    public AdminUser getReceiver() { return receiver; }

    public void setReceiver(AdminUser receiver) { this.receiver = receiver; }

    public String getMessage() { return message; }

    public void setMessage(String message) { this.message = message; }

    public LocalDateTime getTimestamp() { return timestamp; }

    public void setTimestamp(LocalDateTime timestamp) { this.timestamp = timestamp; }

    public boolean isFromUser() { return fromUser; }

    public void setFromUser(boolean fromUser) { this.fromUser = fromUser; }
}
    