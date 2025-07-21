
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt hàng thành công - FashionShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #10b981;
            --primary-dark: #059669;
            --primary-light: #d1fae5;
            --secondary-color: #1f2937;
            --accent-color: #3b82f6;
            --success-color: #10b981;
            --success-light: #ecfdf5;
            --warning-color: #f59e0b;
            --info-color: #06b6d4;
            --gradient-success: linear-gradient(135deg, #10b981, #34d399);
            --gradient-bg: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
            --shadow-soft: 0 4px 20px rgba(0,0,0,0.08);
            --shadow-medium: 0 8px 30px rgba(0,0,0,0.12);
            --shadow-strong: 0 20px 60px rgba(0,0,0,0.15);
            --border-radius: 1rem;
            --border-radius-large: 1.5rem;
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            --animation-bounce: cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: var(--gradient-bg);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
            position: relative;
            overflow-x: hidden;
        }

        /* Animated Background Elements */
        body::before {
            content: '';
            position: absolute;
            top: -10%;
            left: -10%;
            width: 120%;
            height: 120%;
            background: radial-gradient(circle at 20% 50%, rgba(16, 185, 129, 0.1) 0%, transparent 50%),
                        radial-gradient(circle at 80% 20%, rgba(59, 130, 246, 0.1) 0%, transparent 50%),
                        radial-gradient(circle at 40% 80%, rgba(245, 158, 11, 0.1) 0%, transparent 50%);
            animation: float 20s infinite linear;
            pointer-events: none;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            33% { transform: translateY(-20px) rotate(1deg); }
            66% { transform: translateY(10px) rotate(-1deg); }
        }

        /* Success Container */
        .success-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--border-radius-large);
            box-shadow: var(--shadow-strong);
            padding: 3rem;
            width: 100%;
            max-width: 600px;
            text-align: center;
            position: relative;
            overflow: hidden;
            animation: slideInUp 0.8s var(--animation-bounce);
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(60px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .success-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient-success);
        }

        /* Success Icon */
        .success-icon {
            width: 120px;
            height: 120px;
            background: var(--gradient-success);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            position: relative;
            box-shadow: var(--shadow-medium);
            animation: successPulse 2s infinite, iconBounce 0.8s var(--animation-bounce);
        }

        @keyframes successPulse {
            0%, 100% { 
                box-shadow: var(--shadow-medium), 0 0 0 0 rgba(16, 185, 129, 0.7);
            }
            50% { 
                box-shadow: var(--shadow-medium), 0 0 0 20px rgba(16, 185, 129, 0);
            }
        }

        @keyframes iconBounce {
            0% { transform: scale(0) rotate(-180deg); }
            50% { transform: scale(1.2) rotate(-90deg); }
            100% { transform: scale(1) rotate(0deg); }
        }

        .success-icon::before {
            content: '';
            position: absolute;
            top: -20px;
            left: -20px;
            right: -20px;
            bottom: -20px;
            background: linear-gradient(45deg, transparent 30%, rgba(255,255,255,0.2) 50%, transparent 70%);
            border-radius: 50%;
            animation: rotate 3s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .success-icon i {
            color: white;
            font-size: 3.5rem;
            z-index: 1;
            animation: checkmark 0.5s ease-in-out 0.5s both;
        }

        @keyframes checkmark {
            from {
                opacity: 0;
                transform: scale(0.5);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        /* Success Content */
        .success-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--secondary-color);
            margin-bottom: 1rem;
            background: linear-gradient(135deg, var(--success-color), var(--primary-dark));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: titleSlide 0.8s ease-out 0.3s both;
        }

        @keyframes titleSlide {
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
            font-size: 1.2rem;
            color: #6b7280;
            font-weight: 500;
            margin-bottom: 1.5rem;
            line-height: 1.6;
            animation: subtitleSlide 0.8s ease-out 0.5s both;
        }

        @keyframes subtitleSlide {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .success-message {
            background: var(--success-light);
            border: 2px solid var(--primary-light);
            border-radius: var(--border-radius);
            padding: 1.5rem;
            margin: 2rem 0;
            color: var(--primary-dark);
            font-weight: 500;
            position: relative;
            animation: messageSlide 0.8s ease-out 0.7s both;
        }

        @keyframes messageSlide {
            from {
                opacity: 0;
                transform: translateY(20px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .success-message::before {
            content: '';
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            width: 4px;
            height: 60%;
            background: var(--gradient-success);
            border-radius: 2px;
        }

        .success-message p {
            margin: 0 0 0.5rem 1rem;
            padding-left: 1rem;
        }

        .success-message p:last-child {
            margin-bottom: 0;
        }

        /* Order Information */
        .order-info {
            background: rgba(248, 250, 252, 0.8);
            border-radius: var(--border-radius);
            padding: 1.5rem;
            margin: 2rem 0;
            border: 1px solid rgba(226, 232, 240, 0.8);
            animation: infoSlide 0.8s ease-out 0.9s both;
        }

        @keyframes infoSlide {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .order-info-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--secondary-color);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .order-info-title i {
            margin-right: 0.5rem;
            color: var(--info-color);
        }

        .order-details {
            display: grid;
            gap: 0.75rem;
            text-align: left;
        }

        .order-detail-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.5rem 0;
            border-bottom: 1px solid rgba(226, 232, 240, 0.5);
        }

        .order-detail-item:last-child {
            border-bottom: none;
        }

        .order-detail-label {
            color: #6b7280;
            font-weight: 500;
        }

        .order-detail-value {
            color: var(--secondary-color);
            font-weight: 600;
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2.5rem;
            flex-wrap: wrap;
            justify-content: center;
            animation: buttonsSlide 0.8s ease-out 1.1s both;
        }

        @keyframes buttonsSlide {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .btn-primary-custom {
            background: var(--gradient-success);
            border: none;
            color: white;
            font-weight: 600;
            padding: 1rem 2rem;
            border-radius: var(--border-radius);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition);
            box-shadow: var(--shadow-soft);
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.9rem;
        }

        .btn-primary-custom::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s ease;
        }

        .btn-primary-custom:hover::before {
            left: 100%;
        }

        .btn-primary-custom:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-medium);
            color: white;
            text-decoration: none;
        }

        .btn-primary-custom:active {
            transform: translateY(-1px);
        }

        .btn-secondary-custom {
            background: white;
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
            font-weight: 600;
            padding: 1rem 2rem;
            border-radius: var(--border-radius);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.9rem;
        }

        .btn-secondary-custom::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: var(--primary-color);
            transition: left 0.3s ease;
            z-index: -1;
        }

        .btn-secondary-custom:hover::before {
            left: 0;
        }

        .btn-secondary-custom:hover {
            color: white;
            transform: translateY(-3px);
            box-shadow: var(--shadow-soft);
            text-decoration: none;
        }

        /* Next Steps Section */
        .next-steps {
            margin-top: 2rem;
            padding: 1.5rem;
            background: rgba(59, 130, 246, 0.05);
            border: 1px solid rgba(59, 130, 246, 0.2);
            border-radius: var(--border-radius);
            animation: stepsSlide 0.8s ease-out 1.3s both;
        }

        @keyframes stepsSlide {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .next-steps-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--secondary-color);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .next-steps-title i {
            margin-right: 0.5rem;
            color: var(--info-color);
        }

        .steps-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .steps-list li {
            display: flex;
            align-items: flex-start;
            margin-bottom: 0.75rem;
            color: #4b5563;
            font-weight: 500;
        }

        .steps-list li:last-child {
            margin-bottom: 0;
        }

        .steps-list li::before {
            content: '';
            width: 8px;
            height: 8px;
            background: var(--info-color);
            border-radius: 50%;
            margin-right: 0.75rem;
            margin-top: 0.5rem;
            flex-shrink: 0;
        }

        /* Confetti Animation */
        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background: #f59e0b;
            animation: confetti-fall 3s linear infinite;
        }

        .confetti:nth-child(1) { left: 10%; animation-delay: 0s; background: #ef4444; }
        .confetti:nth-child(2) { left: 20%; animation-delay: 0.5s; background: #10b981; }
        .confetti:nth-child(3) { left: 30%; animation-delay: 1s; background: #3b82f6; }
        .confetti:nth-child(4) { left: 40%; animation-delay: 1.5s; background: #8b5cf6; }
        .confetti:nth-child(5) { left: 50%; animation-delay: 2s; background: #f59e0b; }
        .confetti:nth-child(6) { left: 60%; animation-delay: 0.3s; background: #06b6d4; }
        .confetti:nth-child(7) { left: 70%; animation-delay: 0.8s; background: #84cc16; }
        .confetti:nth-child(8) { left: 80%; animation-delay: 1.3s; background: #ec4899; }
        .confetti:nth-child(9) { left: 90%; animation-delay: 1.8s; background: #f97316; }

        @keyframes confetti-fall {
            0% {
                transform: translateY(-100vh) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(100vh) rotate(720deg);
                opacity: 0;
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .success-container {
                padding: 2rem 1.5rem;
                margin: 1rem;
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
            }

            .btn-primary-custom,
            .btn-secondary-custom {
                width: 100%;
                justify-content: center;
            }

            .order-details {
                font-size: 0.9rem;
            }
        }

        @media (max-width: 480px) {
            body {
                padding: 1rem 0.5rem;
            }

            .success-container {
                padding: 1.5rem 1rem;
            }

            .success-title {
                font-size: 1.75rem;
            }

            .success-subtitle {
                font-size: 1rem;
            }
        }

        /* Accessibility Improvements */
        .btn-primary-custom:focus,
        .btn-secondary-custom:focus {
            outline: 3px solid rgba(16, 185, 129, 0.4);
            outline-offset: 2px;
        }

        /* Reduced Motion Support */
        @media (prefers-reduced-motion: reduce) {
            *,
            *::before,
            *::after {
                animation-duration: 0.01ms !important;
                animation-iteration-count: 1 !important;
                transition-duration: 0.01ms !important;
            }
        }

        /* Dark Mode Support */
        @media (prefers-color-scheme: dark) {
            .success-container {
                background: rgba(17, 24, 39, 0.95);
                color: #e5e7eb;
            }

            .success-title {
                color: #e5e7eb;
            }

            .order-info {
                background: rgba(31, 41, 55, 0.8);
                border-color: rgba(75, 85, 99, 0.8);
            }

            .order-detail-label {
                color: #9ca3af;
            }

            .order-detail-value {
                color: #e5e7eb;
            }
        }
    </style>
</head>
<body>
    <!-- Confetti Animation -->
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>
    <div class="confetti"></div>

    <div class="success-container">
        <!-- Success Icon -->
        <div class="success-icon">
            <i class="bi bi-check-circle-fill"></i>
        </div>

        <!-- Success Content -->
        <h1 class="success-title">Đặt hàng thành công!</h1>
        <p class="success-subtitle">
            Cảm ơn bạn đã tin tưởng và mua sắm tại <strong>FashionShop</strong>
        </p>

        <!-- Success Message -->
        <div class="success-message">
            <p>
                <i class="bi bi-check-circle me-2"></i>
                Đơn hàng của bạn đã được tiếp nhận và đang được xử lý
            </p>
            <p>
                <i class="bi bi-telephone me-2"></i>
                Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất
            </p>
        </div>

        <!-- Order Information -->
        <div class="order-info">
            <div class="order-info-title">
                <i class="bi bi-receipt"></i>
                Thông tin đơn hàng
            </div>
            <div class="order-details">
                <div class="order-detail-item">
                    <span class="order-detail-label">Mã đơn hàng:</span>
                    <span class="order-detail-value">#${orderId != null ? orderId : 'FS' + System.currentTimeMillis()}</span>
                </div>
                <div class="order-detail-item">
                    <span class="order-detail-label">Trạng thái:</span>
                    <span class="order-detail-value" style="color: var(--warning-color);">Chờ xử lý</span>
                </div>
                <div class="order-detail-item">
                    <span class="order-detail-label">Phương thức thanh toán:</span>
                    <span class="order-detail-value">Thanh toán khi nhận hàng (COD)</span>
                </div>
                <div class="order-detail-item">
                    <span class="order-detail-label">Thời gian đặt hàng:</span>
                    <span class="order-detail-value">
                        <script>document.write(new Date().toLocaleString('vi-VN'));</script>
                    </span>
                </div>
            </div>
        </div>

        <!-- Next Steps -->
        <div class="next-steps">
            <div class="next-steps-title">
                <i class="bi bi-list-check"></i>
                Những bước tiếp theo
            </div>
            <ul class="steps-list">
                <li>Chúng tôi sẽ xác nhận đơn hàng trong vòng 30 phút</li>
                <li>Nhân viên sẽ liên hệ để xác nhận thông tin giao hàng</li>
                <li>Đơn hàng sẽ được chuẩn bị và giao trong 1-2 ngày làm việc</li>
                <li>Bạn có thể theo dõi trạng thái đơn hàng trong mục "Lịch sử đơn hàng"</li>
            </ul>
        </div>

        <!-- Action Buttons -->
        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/order/history" class="btn-primary-custom">
                <i class="bi bi-clock-history"></i>
                Theo dõi đơn hàng
            </a>
            <a href="${pageContext.request.contextPath}/home" class="btn-secondary-custom">
                <i class="bi bi-house"></i>
                Về trang chủ
            </a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Page load animations
        document.addEventListener('DOMContentLoaded', function() {
            // Auto-hide confetti after animation
            setTimeout(() => {
                document.querySelectorAll('.confetti').forEach(confetti => {
                    confetti.style.display = 'none';
                });
            }, 5000);

            // Add interaction feedback
            const buttons = document.querySelectorAll('.btn-primary-custom, .btn-secondary-custom');
            buttons.forEach(button => {
                button.addEventListener('click', function(e) {
                    // Create ripple effect
                    const ripple = document.createElement('div');
                    ripple.style.position = 'absolute';
                    ripple.style.borderRadius = '50%';
                    ripple.style.background = 'rgba(255, 255, 255, 0.6)';
                    ripple.style.transform = 'scale(0)';
                    ripple.style.animation = 'ripple 0.6s linear';
                    ripple.style.left = (e.clientX - button.getBoundingClientRect().left) + 'px';
                    ripple.style.top = (e.clientY - button.getBoundingClientRect().top) + 'px';
                    ripple.style.width = ripple.style.height = '20px';
                    ripple.style.marginLeft = ripple.style.marginTop = '-10px';
                    
                    button.appendChild(ripple);
                    
                    setTimeout(() => {
                        ripple.remove();
                    }, 600);
                });
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
        `;
        document.head.appendChild(style);

        // Keyboard navigation
        document.addEventListener('keydown', function(event) {
            if (event.key === 'h' || event.key === 'H') {
                window.location.href = '${pageContext.request.contextPath}/home';
            } else if (event.key === 'o' || event.key === 'O') {
                window.location.href = '${pageContext.request.contextPath}/order/history';
            }
        });

        // Success sound (optional - requires user interaction first)
        function playSuccessSound() {
            const audioContext = new (window.AudioContext || window.webkitAudioContext)();
            const oscillator = audioContext.createOscillator();
            const gainNode = audioContext.createGain();
            
            oscillator.connect(gainNode);
            gainNode.connect(audioContext.destination);
            
            oscillator.frequency.setValueAtTime(523.25, audioContext.currentTime); // C5
            oscillator.frequency.setValueAtTime(659.25, audioContext.currentTime + 0.1); // E5
            oscillator.frequency.setValueAtTime(783.99, audioContext.currentTime + 0.2); // G5
            
            gainNode.gain.setValueAtTime(0.3, audioContext.currentTime);
            gainNode.gain.exponentialRampToValueAtTime(0.01, audioContext.currentTime + 0.5);
            
            oscillator.start(audioContext.currentTime);
            oscillator.stop(audioContext.currentTime + 0.5);
        }

        // Auto-redirect after 30 seconds (optional)
        let countdown = 30;
        const autoRedirectTimer = setInterval(() => {
            countdown--;
            if (countdown <= 0) {
                clearInterval(autoRedirectTimer);
                window.location.href = '${pageContext.request.contextPath}/home';
            }
        }, 1000);

        // Cancel auto-redirect on user interaction
        document.addEventListener('click', () => {
            clearInterval(autoRedirectTimer);
        });

        document.addEventListener('keydown', () => {
            clearInterval(autoRedirectTimer);
        });
    </script>
</body>
</html>
