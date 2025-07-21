
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../../common/header.jsp" />

<style>
    :root {
        --primary-color: #e91e63;
        --primary-dark: #c2185b;
        --primary-light: #f8bbd9;
        --secondary-color: #2c3e50;
        --accent-color: #3498db;
        --success-color: #27ae60;
        --warning-color: #f39c12;
        --danger-color: #e74c3c;
        --info-color: #17a2b8;
        --gray-50: #f8f9fa;
        --gray-100: #f1f3f4;
        --gray-200: #e9ecef;
        --gray-300: #dee2e6;
        --gray-400: #ced4da;
        --gray-500: #adb5bd;
        --gray-600: #6c757d;
        --gray-700: #495057;
        --gray-800: #343a40;
        --gray-900: #212529;
        --white: #ffffff;
        --shadow-sm: 0 2px 4px rgba(0,0,0,0.06);
        --shadow-md: 0 4px 12px rgba(0,0,0,0.1);
        --shadow-lg: 0 8px 25px rgba(0,0,0,0.15);
        --shadow-xl: 0 20px 40px rgba(0,0,0,0.1);
        --border-radius: 12px;
        --border-radius-lg: 16px;
        --border-radius-xl: 20px;
        --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        --gradient-primary: linear-gradient(135deg, var(--primary-color), #f06292);
        --gradient-success: linear-gradient(135deg, var(--success-color), #2ecc71);
        --gradient-warning: linear-gradient(135deg, var(--warning-color), #e67e22);
        --gradient-danger: linear-gradient(135deg, var(--danger-color), #c0392b);
        --gradient-bg: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    }

    * {
        box-sizing: border-box;
    }

    body {
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        margin: 0;
        padding: 0;
        min-height: 100vh;
        color: var(--gray-800);
        line-height: 1.6;
    }

    .refund-container {
        max-width: 800px;
        margin: 2rem auto;
        padding: 0 1rem;
        animation: fadeInUp 0.6s ease-out;
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .refund-header {
        background: var(--white);
        border-radius: var(--border-radius-lg);
        padding: 2.5rem 2rem;
        margin-bottom: 2rem;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--gray-200);
        text-align: center;
        position: relative;
        overflow: hidden;
    }

    .refund-header::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: var(--gradient-warning);
    }

    .refund-icon {
        font-size: 4rem;
        color: var(--warning-color);
        margin-bottom: 1rem;
        animation: pulse 2s infinite;
        background: rgba(243, 156, 18, 0.1);
        width: 100px;
        height: 100px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 1.5rem auto;
    }

    @keyframes pulse {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.05); }
    }

    .refund-title {
        font-size: 2.25rem;
        font-weight: 700;
        color: var(--gray-900);
        margin: 0 0 0.75rem 0;
        line-height: 1.2;
    }

    .refund-subtitle {
        color: var(--gray-600);
        font-size: 1.1rem;
        margin: 0;
        font-weight: 400;
    }

    .order-card {
        background: var(--white);
        border-radius: var(--border-radius-lg);
        padding: 2rem;
        margin-bottom: 2rem;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--gray-200);
        animation: slideInLeft 0.7s ease-out;
    }

    @keyframes slideInLeft {
        from {
            opacity: 0;
            transform: translateX(-30px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    .card-header {
        display: flex;
        align-items: center;
        gap: 1rem;
        margin-bottom: 1.5rem;
        padding-bottom: 1rem;
        border-bottom: 2px solid var(--gray-200);
    }

    .card-icon {
        font-size: 1.5rem;
        color: var(--primary-color);
        background: var(--primary-light);
        padding: 0.75rem;
        border-radius: 50%;
    }

    .card-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--gray-900);
        margin: 0;
    }

    .order-details {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 1.5rem;
    }

    .detail-item {
        background: var(--gray-50);
        padding: 1.25rem;
        border-radius: var(--border-radius);
        border: 1px solid var(--gray-200);
        transition: var(--transition);
    }

    .detail-item:hover {
        background: var(--gray-100);
        transform: translateY(-2px);
        box-shadow: var(--shadow-sm);
    }

    .detail-label {
        font-size: 0.9rem;
        font-weight: 600;
        color: var(--gray-600);
        text-transform: uppercase;
        letter-spacing: 0.5px;
        margin-bottom: 0.5rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .detail-value {
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--gray-900);
        margin: 0;
        word-break: break-word;
    }

    .order-id {
        color: var(--primary-color);
        background: var(--primary-light);
        padding: 0.25rem 0.75rem;
        border-radius: 20px;
        font-family: 'Monaco', 'Courier New', monospace;
    }

    .status-badge {
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        padding: 0.5rem 1rem;
        border-radius: 20px;
        font-size: 0.9rem;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .status-paid {
        background: rgba(39, 174, 96, 0.1);
        color: var(--success-color);
        border: 1px solid rgba(39, 174, 96, 0.2);
    }

    .status-paid::before {
        content: "●";
        animation: blink 2s infinite;
    }

    @keyframes blink {
        0%, 50% { opacity: 1; }
        51%, 100% { opacity: 0.3; }
    }

    .amount-highlight {
        color: var(--success-color);
        font-size: 1.25rem;
        font-weight: 700;
    }

    .transaction-code {
        font-family: 'Monaco', 'Courier New', monospace;
        background: var(--gray-100);
        padding: 0.25rem 0.5rem;
        border-radius: 6px;
        border: 1px solid var(--gray-300);
        font-size: 0.95rem;
    }

    .warning-section {
        background: linear-gradient(135deg, rgba(243, 156, 18, 0.1), rgba(230, 126, 34, 0.1));
        border: 1px solid rgba(243, 156, 18, 0.2);
        border-radius: var(--border-radius-lg);
        padding: 2rem;
        margin-bottom: 2rem;
        animation: slideInRight 0.8s ease-out;
    }

    @keyframes slideInRight {
        from {
            opacity: 0;
            transform: translateX(30px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    .warning-header {
        display: flex;
        align-items: center;
        gap: 1rem;
        margin-bottom: 1rem;
    }

    .warning-icon {
        font-size: 2rem;
        color: var(--warning-color);
        animation: shake 3s infinite;
    }

    @keyframes shake {
        0%, 100% { transform: translateX(0); }
        10%, 30%, 50%, 70%, 90% { transform: translateX(-2px); }
        20%, 40%, 60%, 80% { transform: translateX(2px); }
    }

    .warning-title {
        font-size: 1.25rem;
        font-weight: 700;
        color: var(--warning-color);
        margin: 0;
    }

    .warning-text {
        color: var(--gray-700);
        font-size: 1rem;
        line-height: 1.6;
        margin: 0;
    }

    .action-section {
        background: var(--white);
        border-radius: var(--border-radius-lg);
        padding: 2rem;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--gray-200);
        animation: slideInUp 0.9s ease-out;
    }

    @keyframes slideInUp {
        from {
            opacity: 0;
            transform: translateY(40px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .action-header {
        text-align: center;
        margin-bottom: 2rem;
    }

    .action-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--gray-900);
        margin: 0 0 0.5rem 0;
    }

    .action-subtitle {
        color: var(--gray-600);
        font-size: 1rem;
        margin: 0;
    }

    .button-group {
        display: flex;
        gap: 1rem;
        justify-content: center;
        margin-bottom: 2rem;
    }

    .btn-submit {
        background: var(--gradient-danger);
        color: var(--white);
        border: none;
        padding: 1.25rem 2.5rem;
        border-radius: var(--border-radius);
        font-weight: 700;
        font-size: 1.1rem;
        cursor: pointer;
        transition: var(--transition);
        display: flex;
        align-items: center;
        gap: 0.75rem;
        text-decoration: none;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        box-shadow: var(--shadow-sm);
        position: relative;
        overflow: hidden;
        min-width: 200px;
        justify-content: center;
    }

    .btn-submit::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
        transition: left 0.5s ease;
    }

    .btn-submit:hover::before {
        left: 100%;
    }

    .btn-submit:hover {
        transform: translateY(-3px);
        box-shadow: var(--shadow-lg);
        text-decoration: none;
        color: var(--white);
    }

    .btn-cancel {
        background: var(--white);
        color: var(--gray-700);
        border: 2px solid var(--gray-300);
        padding: 1.25rem 2.5rem;
        border-radius: var(--border-radius);
        font-weight: 600;
        font-size: 1.1rem;
        cursor: pointer;
        transition: var(--transition);
        display: flex;
        align-items: center;
        gap: 0.75rem;
        text-decoration: none;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        min-width: 200px;
        justify-content: center;
    }

    .btn-cancel:hover {
        background: var(--gray-50);
        border-color: var(--gray-400);
        transform: translateY(-2px);
        box-shadow: var(--shadow-md);
        text-decoration: none;
        color: var(--gray-800);
    }

    .security-info {
        background: rgba(23, 162, 184, 0.1);
        border: 1px solid rgba(23, 162, 184, 0.2);
        border-radius: var(--border-radius);
        padding: 1.5rem;
        display: flex;
        align-items: center;
        gap: 1rem;
        margin-top: 1.5rem;
    }

    .security-icon {
        font-size: 1.5rem;
        color: var(--info-color);
    }

    .security-text {
        color: var(--gray-700);
        font-size: 0.95rem;
        margin: 0;
        line-height: 1.5;
    }

    /* Loading States */
    .loading {
        opacity: 0.7;
        pointer-events: none;
        position: relative;
    }

    .loading::after {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 20px;
        height: 20px;
        border: 2px solid rgba(255,255,255,0.3);
        border-radius: 50%;
        border-top: 2px solid white;
        animation: spin 1s linear infinite;
        transform: translate(-50%, -50%);
    }

    @keyframes spin {
        0% { transform: translate(-50%, -50%) rotate(0deg); }
        100% { transform: translate(-50%, -50%) rotate(360deg); }
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .refund-container {
            margin: 1rem auto;
            padding: 0 0.5rem;
        }

        .refund-header,
        .order-card,
        .action-section {
            padding: 1.5rem;
        }

        .refund-title {
            font-size: 1.75rem;
        }

        .refund-icon {
            width: 80px;
            height: 80px;
            font-size: 3rem;
        }

        .order-details {
            grid-template-columns: 1fr;
        }

        .button-group {
            flex-direction: column;
            gap: 1rem;
        }

        .btn-submit,
        .btn-cancel {
            width: 100%;
        }
    }

    @media (max-width: 480px) {
        .refund-header,
        .order-card,
        .warning-section,
        .action-section {
            padding: 1.25rem;
        }

        .refund-title {
            font-size: 1.5rem;
        }

        .card-header {
            flex-direction: column;
            text-align: center;
            gap: 0.5rem;
        }
    }

    /* Accessibility Improvements */
    .btn-submit:focus,
    .btn-cancel:focus {
        outline: 2px solid var(--primary-color);
        outline-offset: 2px;
    }

    /* Success Animation for Future Use */
    .success-animation {
        animation: bounceIn 0.8s ease-out;
    }

    @keyframes bounceIn {
        0% {
            opacity: 0;
            transform: scale(0.3);
        }
        50% {
            opacity: 1;
            transform: scale(1.05);
        }
        70% {
            transform: scale(0.9);
        }
        100% {
            opacity: 1;
            transform: scale(1);
        }
    }
</style>

<div class="refund-container">
    <!-- Header Section -->
    <div class="refund-header">
        <div class="refund-icon">
            <i class="bi bi-arrow-counterclockwise"></i>
        </div>
        <h1 class="refund-title">Xác nhận yêu cầu hoàn tiền</h1>
        <p class="refund-subtitle">Vui lòng xem lại thông tin đơn hàng và xác nhận yêu cầu hoàn tiền</p>
    </div>

    <!-- Order Information Card -->
    <div class="order-card">
        <div class="card-header">
            <div class="card-icon">
                <i class="bi bi-receipt"></i>
            </div>
            <h2 class="card-title">Thông tin đơn hàng</h2>
        </div>

        <div class="order-details">
            <div class="detail-item">
                <div class="detail-label">
                    <i class="bi bi-hash"></i>
                    Mã đơn hàng
                </div>
                <p class="detail-value">
                    <span class="order-id">#${order.id}</span>
                </p>
            </div>

            <div class="detail-item">
                <div class="detail-label">
                    <i class="bi bi-calendar"></i>
                    Ngày đặt hàng
                </div>
                <p class="detail-value">${order.orderDate}</p>
            </div>

            <div class="detail-item">
                <div class="detail-label">
                    <i class="bi bi-info-circle"></i>
                    Trạng thái đơn hàng
                </div>
                <p class="detail-value">
                    <span class="status-badge status-paid">${order.status}</span>
                </p>
            </div>

            <div class="detail-item">
                <div class="detail-label">
                    <i class="bi bi-currency-dollar"></i>
                    Tổng tiền
                </div>
                <p class="detail-value amount-highlight">${order.total} VND</p>
            </div>

            <c:if test="${order.paymentMethod != null}">
                <div class="detail-item">
                    <div class="detail-label">
                        <i class="bi bi-credit-card"></i>
                        Phương thức thanh toán
                    </div>
                    <p class="detail-value">${order.paymentMethod.name}</p>
                </div>
            </c:if>

            <c:if test="${order.shippingMethod != null}">
                <div class="detail-item">
                    <div class="detail-label">
                        <i class="bi bi-truck"></i>
                        Phương thức giao hàng
                    </div>
                    <p class="detail-value">${order.shippingMethod.name}</p>
                </div>
            </c:if>

            <c:if test="${not empty order.transactionNo}">
                <div class="detail-item" style="grid-column: 1 / -1;">
                    <div class="detail-label">
                        <i class="bi bi-receipt-cutoff"></i>
                        Mã giao dịch VNPay
                    </div>
                    <p class="detail-value">
                        <span class="transaction-code">${order.transactionNo}</span>
                    </p>
                </div>
            </c:if>
        </div>
    </div>

    <!-- Warning Section -->
    <div class="warning-section">
        <div class="warning-header">
            <div class="warning-icon">
                <i class="bi bi-exclamation-triangle-fill"></i>
            </div>
            <h3 class="warning-title">Lưu ý quan trọng</h3>
        </div>
        <p class="warning-text">
            Khi bạn gửi yêu cầu hoàn tiền, đơn hàng sẽ được chuyển đến bộ phận xử lý. 
            Thời gian xử lý có thể từ 3-7 ngày làm việc. Bạn sẽ nhận được thông báo 
            qua email khi yêu cầu được phê duyệt và tiền được hoàn trả.
        </p>
    </div>

    <!-- Action Section -->
    <div class="action-section">
        <div class="action-header">
            <h3 class="action-title">Bạn có chắc chắn muốn yêu cầu hoàn tiền?</h3>
            <p class="action-subtitle">Hành động này không thể hoàn tác sau khi được gửi</p>
        </div>

        <form action="${pageContext.request.contextPath}/request-refund-submit" method="post" id="refundForm">
            <input type="hidden" name="orderId" value="${order.id}" />
            
            <div class="button-group">
                <button type="submit" class="btn-submit" onclick="return confirmRefund()">
                    <i class="bi bi-check-circle"></i>
                    Xác nhận yêu cầu hoàn tiền
                </button>
                
                <a href="${pageContext.request.contextPath}/user/order/history" class="btn-cancel">
                    <i class="bi bi-x-circle"></i>
                    Hủy bỏ
                </a>
            </div>
        </form>

        <div class="security-info">
            <div class="security-icon">
                <i class="bi bi-shield-check"></i>
            </div>
            <p class="security-text">
                Thông tin của bạn được bảo mật và yêu cầu hoàn tiền sẽ được xử lý 
                một cách an toàn theo chính sách bảo mật của chúng tôi.
            </p>
        </div>
    </div>
</div>

<script>
    // Confirmation dialog
    function confirmRefund() {
        const confirmed = confirm(
            'Bạn có chắc chắn muốn gửi yêu cầu hoàn tiền cho đơn hàng #${order.id}?\n\n' +
            'Sau khi gửi, yêu cầu sẽ được chuyển đến bộ phận xử lý và không thể hủy bỏ.\n\n' +
            'Nhấn OK để tiếp tục hoặc Cancel để hủy bỏ.'
        );

        if (confirmed) {
            // Add loading state to submit button
            const submitBtn = document.querySelector('.btn-submit');
            submitBtn.classList.add('loading');
            submitBtn.disabled = true;
            
            // Update button text
            submitBtn.innerHTML = '<i class="bi bi-hourglass-split"></i> Đang xử lý...';
            
            return true;
        }

        return false;
    }

    // Enhanced form interaction
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('refundForm');
        const submitBtn = document.querySelector('.btn-submit');
        
        // Add hover effects
        submitBtn.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-2px)';
        });

        submitBtn.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });

        // Add keyboard shortcut
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                window.location.href = '${pageContext.request.contextPath}/user/order/history';
            }
            
            if (e.key === 'Enter' && e.ctrlKey) {
                if (confirmRefund()) {
                    form.submit();
                }
            }
        });

        // Auto-focus on important elements
        window.scrollTo({ top: 0, behavior: 'smooth' });

        // Add success animation to cards
        document.querySelectorAll('.order-card, .warning-section, .action-section').forEach((card, index) => {
            card.style.animationDelay = (index * 0.2) + 's';
        });
    });

    // Progressive enhancement for better UX
    if ('IntersectionObserver' in window) {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, { threshold: 0.1 });

        document.querySelectorAll('.detail-item').forEach(item => {
            item.style.opacity = '0';
            item.style.transform = 'translateY(20px)';
            item.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
            observer.observe(item);
        });
    }

    // Add visual feedback for successful interactions
    function addSuccessFeedback(element) {
        element.classList.add('success-animation');
        setTimeout(() => {
            element.classList.remove('success-animation');
        }, 800);
    }

    // Enhanced button interactions
    document.querySelectorAll('.btn-submit, .btn-cancel').forEach(btn => {
        btn.addEventListener('click', function(e) {
            // Add ripple effect
            const ripple = document.createElement('span');
            ripple.style.position = 'absolute';
            ripple.style.borderRadius = '50%';
            ripple.style.background = 'rgba(255,255,255,0.6)';
            ripple.style.transform = 'scale(0)';
            ripple.style.animation = 'ripple 0.6s linear';
            
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            ripple.style.width = ripple.style.height = size + 'px';
            ripple.style.left = (e.clientX - rect.left - size / 2) + 'px';
            ripple.style.top = (e.clientY - rect.top - size / 2) + 'px';
            
            this.appendChild(ripple);
            
            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });

    // Add ripple animation
    const style = document.createElement('style');
    style.textContent = `
        @keyframes ripple {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
        
        .btn-submit, .btn-cancel {
            position: relative;
            overflow: hidden;
        }
    `;
    document.head.appendChild(style);
</script>

<jsp:include page="../../common/footer.jsp" />
