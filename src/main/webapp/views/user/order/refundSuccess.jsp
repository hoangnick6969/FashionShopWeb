
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="../../common/header.jsp" />

<style>
    :root {
        --primary-color: #e91e63;
        --primary-dark: #c2185b;
        --primary-light: #f8bbd9;
        --secondary-color: #2c3e50;
        --success-color: #27ae60;
        --success-light: #2ecc71;
        --success-dark: #229954;
        --info-color: #3498db;
        --warning-color: #f39c12;
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
        --gradient-success: linear-gradient(135deg, var(--success-color), var(--success-light));
        --gradient-bg: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    }

    * {
        box-sizing: border-box;
    }

    body {
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        background: var(--gradient-bg);
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    .success-container {
        max-width: 800px;
        margin: 2rem auto;
        padding: 0 1rem;
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        animation: fadeInUp 0.8s ease-out;
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(40px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .success-card {
        background: var(--white);
        border-radius: var(--border-radius-xl);
        padding: 3rem 2rem;
        box-shadow: var(--shadow-xl);
        border: 1px solid var(--gray-200);
        text-align: center;
        position: relative;
        overflow: hidden;
        width: 100%;
        max-width: 600px;
    }

    .success-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 6px;
        background: var(--gradient-success);
    }

    .success-icon-container {
        position: relative;
        display: inline-block;
        margin-bottom: 2rem;
        animation: bounceIn 1s ease-out;
    }

    @keyframes bounceIn {
        0% {
            opacity: 0;
            transform: scale(0.3);
        }
        50% {
            opacity: 1;
            transform: scale(1.1);
        }
        70% {
            transform: scale(0.9);
        }
        100% {
            opacity: 1;
            transform: scale(1);
        }
    }

    .success-icon {
        width: 120px;
        height: 120px;
        background: var(--gradient-success);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto;
        box-shadow: var(--shadow-lg);
        position: relative;
        overflow: hidden;
    }

    .success-icon::before {
        content: '';
        position: absolute;
        top: 50%;
        left: 50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, transparent 70%);
        transform: translate(-50%, -50%);
        animation: pulse 3s infinite;
    }

    @keyframes pulse {
        0%, 100% { opacity: 1; transform: translate(-50%, -50%) scale(1); }
        50% { opacity: 0.7; transform: translate(-50%, -50%) scale(1.1); }
    }

    .success-icon i {
        font-size: 3.5rem;
        color: var(--white);
        z-index: 1;
        position: relative;
        animation: checkmark 1.5s ease-out 0.5s both;
    }

    @keyframes checkmark {
        0% {
            transform: scale(0) rotate(-45deg);
            opacity: 0;
        }
        50% {
            transform: scale(1.2) rotate(-45deg);
            opacity: 1;
        }
        100% {
            transform: scale(1) rotate(0deg);
            opacity: 1;
        }
    }

    .success-title {
        font-size: 2.5rem;
        font-weight: 700;
        color: var(--gray-900);
        margin: 0 0 1rem 0;
        line-height: 1.2;
        animation: slideInUp 0.8s ease-out 0.3s both;
    }

    @keyframes slideInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .success-subtitle {
        font-size: 1.25rem;
        color: var(--success-color);
        font-weight: 600;
        margin: 0 0 2rem 0;
        animation: slideInUp 0.8s ease-out 0.4s both;
    }

    .success-message {
        font-size: 1.1rem;
        color: var(--gray-700);
        line-height: 1.7;
        margin: 0 0 2.5rem 0;
        max-width: 500px;
        margin-left: auto;
        margin-right: auto;
        animation: slideInUp 0.8s ease-out 0.5s both;
    }

    .info-card {
        background: var(--gray-50);
        border: 1px solid var(--gray-200);
        border-radius: var(--border-radius);
        padding: 1.5rem;
        margin: 2rem 0;
        text-align: left;
        animation: slideInUp 0.8s ease-out 0.6s both;
    }

    .info-card h4 {
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--gray-800);
        margin: 0 0 1rem 0;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .info-card h4 i {
        color: var(--info-color);
        font-size: 1.2rem;
    }

    .info-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .info-list li {
        padding: 0.5rem 0;
        border-bottom: 1px solid var(--gray-200);
        display: flex;
        align-items: center;
        gap: 0.75rem;
        font-size: 0.95rem;
        color: var(--gray-700);
    }

    .info-list li:last-child {
        border-bottom: none;
    }

    .info-list li i {
        color: var(--success-color);
        font-size: 1rem;
        width: 16px;
        text-align: center;
    }

    .action-buttons {
        display: flex;
        gap: 1rem;
        justify-content: center;
        flex-wrap: wrap;
        margin-top: 2rem;
        animation: slideInUp 0.8s ease-out 0.7s both;
    }

    .btn {
        display: inline-flex;
        align-items: center;
        gap: 0.75rem;
        padding: 1rem 2rem;
        border: none;
        border-radius: var(--border-radius);
        font-weight: 600;
        font-size: 1rem;
        text-decoration: none;
        cursor: pointer;
        transition: var(--transition);
        text-transform: uppercase;
        letter-spacing: 0.5px;
        position: relative;
        overflow: hidden;
    }

    .btn::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
        transition: left 0.5s ease;
    }

    .btn:hover::before {
        left: 100%;
    }

    .btn-primary {
        background: var(--gradient-success);
        color: var(--white);
        box-shadow: var(--shadow-sm);
    }

    .btn-primary:hover {
        transform: translateY(-3px);
        box-shadow: var(--shadow-lg);
        text-decoration: none;
        color: var(--white);
    }

    .btn-secondary {
        background: var(--white);
        color: var(--gray-700);
        border: 2px solid var(--gray-300);
        box-shadow: var(--shadow-sm);
    }

    .btn-secondary:hover {
        background: var(--gray-50);
        border-color: var(--gray-400);
        transform: translateY(-2px);
        box-shadow: var(--shadow-md);
        text-decoration: none;
        color: var(--gray-800);
    }

    .progress-indicator {
        margin: 2rem 0;
        animation: slideInUp 0.8s ease-out 0.8s both;
    }

    .progress-steps {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 1rem;
        margin: 1.5rem 0;
    }

    .step {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 0.5rem;
        font-size: 0.85rem;
        color: var(--gray-600);
    }

    .step-icon {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.1rem;
        font-weight: 600;
        transition: var(--transition);
    }

    .step.completed .step-icon {
        background: var(--success-color);
        color: var(--white);
        animation: stepComplete 0.6s ease-out;
    }

    .step.active .step-icon {
        background: var(--info-color);
        color: var(--white);
        animation: stepActive 1.5s ease-in-out infinite;
    }

    .step.pending .step-icon {
        background: var(--gray-200);
        color: var(--gray-500);
    }

    @keyframes stepComplete {
        0% { transform: scale(0.8); }
        50% { transform: scale(1.1); }
        100% { transform: scale(1); }
    }

    @keyframes stepActive {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.05); }
    }

    .step-connector {
        width: 60px;
        height: 2px;
        background: var(--gray-200);
        position: relative;
    }

    .step-connector.completed {
        background: var(--success-color);
    }

    .security-badge {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.75rem;
        background: rgba(39, 174, 96, 0.1);
        border: 1px solid rgba(39, 174, 96, 0.2);
        border-radius: var(--border-radius);
        padding: 1rem;
        margin: 2rem 0;
        font-size: 0.95rem;
        color: var(--success-dark);
        font-weight: 500;
        animation: slideInUp 0.8s ease-out 0.9s both;
    }

    .security-badge i {
        color: var(--success-color);
        font-size: 1.2rem;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .success-container {
            margin: 1rem auto;
            padding: 0 0.5rem;
        }

        .success-card {
            padding: 2rem 1.5rem;
        }

        .success-title {
            font-size: 2rem;
        }

        .success-icon {
            width: 100px;
            height: 100px;
        }

        .success-icon i {
            font-size: 3rem;
        }

        .action-buttons {
            flex-direction: column;
            align-items: center;
        }

        .btn {
            width: 100%;
            max-width: 300px;
            justify-content: center;
        }

        .progress-steps {
            flex-direction: column;
            gap: 0.5rem;
        }

        .step-connector {
            width: 2px;
            height: 30px;
            transform: rotate(90deg);
        }
    }

    @media (max-width: 480px) {
        .success-card {
            padding: 1.5rem 1rem;
        }

        .success-title {
            font-size: 1.75rem;
        }

        .success-icon {
            width: 80px;
            height: 80px;
        }

        .success-icon i {
            font-size: 2.5rem;
        }

        .info-card {
            padding: 1rem;
        }
    }

    /* Accessibility Improvements */
    .btn:focus {
        outline: 3px solid rgba(39, 174, 96, 0.3);
        outline-offset: 2px;
    }

    @media (prefers-reduced-motion: reduce) {
        * {
            animation-duration: 0.01ms !important;
            animation-iteration-count: 1 !important;
            transition-duration: 0.01ms !important;
        }
    }

    /* Loading State */
    .loading {
        opacity: 0.7;
        pointer-events: none;
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
        border-top: 2px solid var(--success-color);
        animation: spin 1s linear infinite;
        transform: translate(-50%, -50%);
    }

    @keyframes spin {
        0% { transform: translate(-50%, -50%) rotate(0deg); }
        100% { transform: translate(-50%, -50%) rotate(360deg); }
    }
</style>

<div class="success-container">
    <div class="success-card">
        <!-- Success Icon -->
        <div class="success-icon-container">
            <div class="success-icon">
                <i class="bi bi-check-circle-fill"></i>
            </div>
        </div>

        <!-- Main Message -->
        <h1 class="success-title">Yêu cầu đã được gửi thành công!</h1>
        <p class="success-subtitle">Cảm ơn bạn đã tin tưởng dịch vụ của chúng tôi</p>
        
        <div class="success-message">
            Yêu cầu hoàn tiền của bạn đã được ghi nhận và chuyển đến bộ phận xử lý. 
            Chúng tôi sẽ kiểm tra và phản hồi trong thời gian sớm nhất.
        </div>

        <!-- Progress Indicator -->
        <div class="progress-indicator">
            <div class="progress-steps">
                <div class="step completed">
                    <div class="step-icon">
                        <i class="bi bi-check"></i>
                    </div>
                    <span>Gửi yêu cầu</span>
                </div>
                <div class="step-connector completed"></div>
                <div class="step active">
                    <div class="step-icon">2</div>
                    <span>Đang xử lý</span>
                </div>
                <div class="step-connector"></div>
                <div class="step pending">
                    <div class="step-icon">3</div>
                    <span>Hoàn thành</span>
                </div>
            </div>
        </div>

        <!-- Information Card -->
        <div class="info-card">
            <h4>
                <i class="bi bi-info-circle"></i>
                Thông tin quan trọng
            </h4>
            <ul class="info-list">
                <li>
                    <i class="bi bi-clock"></i>
                    Thời gian xử lý: 1-2 ngày làm việc
                </li>
                <li>
                    <i class="bi bi-envelope"></i>
                    Chúng tôi sẽ thông báo qua email khi có kết quả
                </li>
                <li>
                    <i class="bi bi-telephone"></i>
                    Liên hệ hotline nếu cần hỗ trợ khẩn cấp
                </li>
                <li>
                    <i class="bi bi-receipt"></i>
                    Theo dõi trạng thái tại lịch sử đơn hàng
                </li>
            </ul>
        </div>

        <!-- Security Badge -->
        <div class="security-badge">
            <i class="bi bi-shield-check"></i>
            Yêu cầu của bạn được xử lý bảo mật và minh bạch
        </div>

        <!-- Action Buttons -->
        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/order-history" class="btn btn-primary">
                <i class="bi bi-list-ul"></i>
                Xem lịch sử đơn hàng
            </a>
            <a href="${pageContext.request.contextPath}/home" class="btn btn-secondary">
                <i class="bi bi-house"></i>
                Về trang chủ
            </a>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Add smooth scrolling to top
        window.scrollTo({ top: 0, behavior: 'smooth' });

        // Auto-redirect after a certain time (optional)
        let countdown = 30;
        const autoRedirectTimer = setInterval(() => {
            countdown--;
            if (countdown <= 0) {
                clearInterval(autoRedirectTimer);
                // Uncomment the line below if you want auto-redirect
                // window.location.href = '${pageContext.request.contextPath}/order-history';
            }
        }, 1000);

        // Add click handlers for enhanced UX
        document.querySelectorAll('.btn').forEach(btn => {
            btn.addEventListener('click', function(e) {
                // Add loading state
                this.classList.add('loading');
                
                // Remove loading state after navigation (fallback)
                setTimeout(() => {
                    this.classList.remove('loading');
                }, 1000);
            });
        });

        // Add keyboard shortcuts
        document.addEventListener('keydown', function(e) {
            if (e.key === 'h' || e.key === 'H') {
                window.location.href = '${pageContext.request.contextPath}/home';
            } else if (e.key === 'o' || e.key === 'O') {
                window.location.href = '${pageContext.request.contextPath}/order-history';
            } else if (e.key === 'Escape') {
                window.history.back();
            }
        });

        // Animate progress steps
        const steps = document.querySelectorAll('.step');
        steps.forEach((step, index) => {
            setTimeout(() => {
                if (step.classList.contains('completed')) {
                    step.style.animation = `stepComplete 0.6s ease-out ${index * 0.2}s both`;
                }
            }, 1000);
        });

        // Add hover effects for better interaction feedback
        document.querySelectorAll('.info-list li').forEach(item => {
            item.addEventListener('mouseenter', function() {
                this.style.background = 'rgba(39, 174, 96, 0.05)';
                this.style.borderRadius = '6px';
                this.style.padding = '0.5rem 0.75rem';
                this.style.margin = '0 -0.75rem';
            });

            item.addEventListener('mouseleave', function() {
                this.style.background = '';
                this.style.borderRadius = '';
                this.style.padding = '0.5rem 0';
                this.style.margin = '';
            });
        });

        // Add celebration confetti effect (optional)
        function createConfetti() {
            const colors = ['#27ae60', '#2ecc71', '#e91e63', '#3498db'];
            const confettiCount = 50;

            for (let i = 0; i < confettiCount; i++) {
                setTimeout(() => {
                    const confetti = document.createElement('div');
                    confetti.style.position = 'fixed';
                    confetti.style.width = '10px';
                    confetti.style.height = '10px';
                    confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                    confetti.style.left = Math.random() * window.innerWidth + 'px';
                    confetti.style.top = '-10px';
                    confetti.style.zIndex = '9999';
                    confetti.style.borderRadius = '50%';
                    confetti.style.pointerEvents = 'none';
                    
                    document.body.appendChild(confetti);
                    
                    const animation = confetti.animate([
                        { transform: 'translateY(0) rotate(0deg)', opacity: 1 },
                        { transform: `translateY(${window.innerHeight + 100}px) rotate(720deg)`, opacity: 0 }
                    ], {
                        duration: 3000 + Math.random() * 2000,
                        easing: 'cubic-bezier(0.5, 0, 0.5, 1)'
                    });
                    
                    animation.onfinish = () => confetti.remove();
                }, i * 50);
            }
        }

        // Trigger confetti after a short delay
        setTimeout(createConfetti, 1500);

        // Add success sound (if available)
        try {
            if (typeof Audio !== 'undefined') {
                // You can add a success sound file here
                // const successSound = new Audio('${pageContext.request.contextPath}/sounds/success.mp3');
                // successSound.volume = 0.3;
                // successSound.play().catch(() => {}); // Ignore errors if sound fails
            }
        } catch (e) {
            // Ignore audio errors
        }
    });

    // Enhanced accessibility
    function announceSuccess() {
        if ('speechSynthesis' in window) {
            const utterance = new SpeechSynthesisUtterance('Yêu cầu hoàn tiền đã được gửi thành công');
            utterance.lang = 'vi-VN';
            utterance.volume = 0.5;
            utterance.rate = 0.8;
            speechSynthesis.speak(utterance);
        }
    }

    // Call announcement after page loads
    setTimeout(announceSuccess, 2000);
</script>

<jsp:include page="../../common/footer.jsp" />
