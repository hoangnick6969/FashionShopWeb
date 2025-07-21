
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán đơn hàng - FashionShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #e91e63;
            --primary-dark: #c2185b;
            --primary-light: #f8bbd9;
            --success-color: #00c851;
            --warning-color: #ff8800;
            --danger-color: #ff4444;
            --info-color: #33b5e5;
            --secondary-color: #2c3e50;
            --light-gray: #f8f9fa;
            --medium-gray: #6c757d;
            --dark-gray: #495057;
            --white: #ffffff;
            --shadow-soft: 0 2px 20px rgba(0,0,0,0.08);
            --shadow-medium: 0 4px 30px rgba(0,0,0,0.12);
            --shadow-strong: 0 8px 40px rgba(0,0,0,0.16);
            --border-radius: 0.75rem;
            --border-radius-lg: 1rem;
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            --gradient-primary: linear-gradient(135deg, #e91e63, #f06292);
            --gradient-success: linear-gradient(135deg, #00c851, #00d4aa);
            --gradient-bg: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: var(--gradient-bg);
            color: var(--secondary-color);
            line-height: 1.6;
            min-height: 100vh;
        }

        /* Header */
        .checkout-header {
            background: var(--white);
            box-shadow: var(--shadow-soft);
            padding: 1.5rem 0;
            margin-bottom: 2rem;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .header-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            padding: 0.75rem 1.5rem;
            background: var(--light-gray);
            color: var(--secondary-color);
            text-decoration: none;
            border-radius: var(--border-radius);
            font-weight: 500;
            transition: var(--transition);
            border: 2px solid transparent;
        }

        .back-button:hover {
            background: var(--primary-color);
            color: var(--white);
            text-decoration: none;
            transform: translateY(-2px);
            box-shadow: var(--shadow-soft);
        }

        .checkout-title {
            font-size: 2rem;
            font-weight: 700;
            color: var(--secondary-color);
            margin: 0;
            text-align: center;
            flex: 1;
        }

        .security-badge {
            display: flex;
            align-items: center;
            color: var(--success-color);
            font-weight: 500;
            font-size: 0.9rem;
        }

        /* Main Container */
        .checkout-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .checkout-grid {
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 2rem;
            align-items: start;
        }

        /* Form Section */
        .form-section {
            background: var(--white);
            border-radius: var(--border-radius-lg);
            box-shadow: var(--shadow-medium);
            padding: 2.5rem;
            height: fit-content;
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .section-icon {
            width: 40px;
            height: 40px;
            background: var(--gradient-primary);
            color: var(--white);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
        }

        /* Form Groups */
        .form-group {
            margin-bottom: 2rem;
        }

        .form-label {
            display: block;
            font-weight: 600;
            color: var(--secondary-color);
            margin-bottom: 0.75rem;
            font-size: 1rem;
        }

        .form-control {
            width: 100%;
            padding: 1rem 1.25rem;
            border: 2px solid #e9ecef;
            border-radius: var(--border-radius);
            font-size: 1rem;
            font-family: inherit;
            transition: var(--transition);
            background: var(--light-gray);
            color: var(--secondary-color);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(233, 30, 99, 0.15);
            background: var(--white);
        }

        .form-control:hover {
            border-color: #ced4da;
        }

        /* Select Styling */
        .select-wrapper {
            position: relative;
        }

        .select-wrapper::after {
            content: '\f282';
            font-family: 'bootstrap-icons';
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--medium-gray);
            pointer-events: none;
            font-size: 1rem;
        }

        select.form-control {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            cursor: pointer;
            padding-right: 3rem;
        }

        /* Payment Methods */
        .payment-methods {
            display: grid;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .payment-option {
            border: 2px solid #e9ecef;
            border-radius: var(--border-radius);
            padding: 1.5rem;
            cursor: pointer;
            transition: var(--transition);
            background: var(--light-gray);
            position: relative;
        }

        .payment-option:hover {
            border-color: var(--primary-color);
            background: var(--white);
            transform: translateY(-2px);
            box-shadow: var(--shadow-soft);
        }

        .payment-option.active {
            border-color: var(--primary-color);
            background: var(--white);
            box-shadow: var(--shadow-soft);
        }

        .payment-option.active::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: var(--gradient-primary);
            border-radius: var(--border-radius);
            z-index: -1;
        }

        .payment-content {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .payment-icon {
            width: 50px;
            height: 50px;
            background: var(--gradient-primary);
            color: var(--white);
            border-radius: var(--border-radius);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            flex-shrink: 0;
        }

        .payment-info h4 {
            margin: 0 0 0.25rem 0;
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--secondary-color);
        }

        .payment-info p {
            margin: 0;
            color: var(--medium-gray);
            font-size: 0.9rem;
        }

        /* Order Summary */
        .order-summary {
            background: var(--white);
            border-radius: var(--border-radius-lg);
            box-shadow: var(--shadow-medium);
            padding: 2.5rem;
            position: sticky;
            top: 120px;
        }

        .summary-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--secondary-color);
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .total-display {
            background: var(--gradient-primary);
            color: var(--white);
            padding: 2rem;
            border-radius: var(--border-radius);
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
            overflow: hidden;
        }

        .total-display::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="pattern" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23pattern)"/></svg>');
            animation: float 20s infinite linear;
        }

        @keyframes float {
            0% { transform: translateX(-25%) translateY(-25%); }
            100% { transform: translateX(-75%) translateY(-75%); }
        }

        .total-label {
            font-size: 1rem;
            font-weight: 500;
            opacity: 0.9;
            margin-bottom: 0.5rem;
        }

        .total-amount {
            font-size: 2.5rem;
            font-weight: 700;
            margin: 0;
            position: relative;
            z-index: 1;
        }

        /* Action Buttons */
        .action-buttons {
            display: grid;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn {
            padding: 1.25rem 2rem;
            border: none;
            border-radius: var(--border-radius);
            font-size: 1.1rem;
            font-weight: 600;
            text-decoration: none;
            text-align: center;
            cursor: pointer;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            font-family: inherit;
            text-transform: uppercase;
            letter-spacing: 0.5px;
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
            background: var(--gradient-primary);
            color: var(--white);
            box-shadow: var(--shadow-soft);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-medium);
            color: var(--white);
        }

        .btn-vnpay {
            background: linear-gradient(135deg, #0066cc, #004499);
            color: var(--white);
            box-shadow: var(--shadow-soft);
        }

        .btn-vnpay:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-medium);
            color: var(--white);
        }

        .btn:active {
            transform: translateY(0);
        }

        /* Loading State */
        .btn.loading {
            pointer-events: none;
            opacity: 0.8;
        }

        .btn.loading::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            border: 2px solid rgba(255,255,255,0.3);
            border-radius: 50%;
            border-top: 2px solid white;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Trust Indicators */
        .trust-indicators {
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid #e9ecef;
        }

        .trust-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1rem;
            font-size: 0.9rem;
            color: var(--medium-gray);
        }

        .trust-icon {
            color: var(--success-color);
            font-size: 1.2rem;
        }

        /* Progress Steps */
        .progress-steps {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 2rem;
            gap: 1rem;
        }

        .step {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            border-radius: var(--border-radius);
            background: var(--light-gray);
            color: var(--medium-gray);
            font-weight: 500;
            font-size: 0.9rem;
        }

        .step.active {
            background: var(--gradient-primary);
            color: var(--white);
        }

        .step.completed {
            background: var(--success-color);
            color: var(--white);
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .checkout-grid {
                grid-template-columns: 1fr;
                gap: 2rem;
            }

            .order-summary {
                position: static;
                order: -1;
            }

            .checkout-title {
                font-size: 1.5rem;
            }

            .header-content {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }
        }

        @media (max-width: 768px) {
            .checkout-container {
                padding: 0 0.75rem;
            }

            .form-section,
            .order-summary {
                padding: 1.5rem;
            }

            .total-amount {
                font-size: 2rem;
            }

            .btn {
                padding: 1rem 1.5rem;
                font-size: 1rem;
            }
        }

        /* Animation */
        .checkout-container {
            animation: slideInUp 0.8s cubic-bezier(0.4, 0, 0.2, 1);
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

        /* Error States */
        .error-message {
            background: #fff5f5;
            border: 2px solid var(--danger-color);
            color: var(--danger-color);
            padding: 1rem 1.5rem;
            border-radius: var(--border-radius);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-weight: 500;
        }

        .form-control.error {
            border-color: var(--danger-color);
            background: #fff5f5;
        }

        /* Success States */
        .success-message {
            background: #f0f9f0;
            border: 2px solid var(--success-color);
            color: var(--success-color);
            padding: 1rem 1.5rem;
            border-radius: var(--border-radius);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-weight: 500;
        }

        /* Enhanced Accessibility */
        .btn:focus,
        .form-control:focus,
        .payment-option:focus {
            outline: 3px solid rgba(233, 30, 99, 0.3);
            outline-offset: 2px;
        }

        .visually-hidden {
            position: absolute !important;
            width: 1px !important;
            height: 1px !important;
            padding: 0 !important;
            margin: -1px !important;
            overflow: hidden !important;
            clip: rect(0, 0, 0, 0) !important;
            white-space: nowrap !important;
            border: 0 !important;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="checkout-header">
        <div class="container">
            <div class="header-content">
                <a href="${pageContext.request.contextPath}/cart" class="back-button">
                    <i class="bi bi-arrow-left"></i>
                    <span>Quay lại giỏ hàng</span>
                </a>
                
                <h1 class="checkout-title">Thanh toán đơn hàng</h1>
                
                <div class="security-badge">
                    <i class="bi bi-shield-check me-2"></i>
                    Bảo mật SSL
                </div>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="checkout-container">
        <!-- Progress Steps -->
        <div class="progress-steps">
            <div class="step completed">
                <i class="bi bi-cart-check"></i>
                <span>Giỏ hàng</span>
            </div>
            <div class="step active">
                <i class="bi bi-credit-card"></i>
                <span>Thanh toán</span>
            </div>
            <div class="step">
                <i class="bi bi-check-circle"></i>
                <span>Hoàn thành</span>
            </div>
        </div>

        <!-- Error/Success Messages -->
        <c:if test="${not empty error}">
            <div class="error-message">
                <i class="bi bi-exclamation-triangle-fill"></i>
                ${error}
            </div>
        </c:if>

        <c:if test="${not empty success}">
            <div class="success-message">
                <i class="bi bi-check-circle-fill"></i>
                ${success}
            </div>
        </c:if>

        <div class="checkout-grid">
            <!-- Form Section -->
            <div class="form-section">
                <div class="section-title">
                    <div class="section-icon">
                        <i class="bi bi-credit-card"></i>
                    </div>
                    Thông tin thanh toán
                </div>

                <!-- COD/Bank Transfer Form -->
                <form id="traditionalForm" action="${pageContext.request.contextPath}/checkout" method="post" novalidate>
                    <input type="hidden" name="paymentType" value="cod"/>

                    <div class="form-group">
                        <label for="shippingMethod" class="form-label">
                            <i class="bi bi-truck me-2"></i>
                            Phương thức giao hàng
                        </label>
                        <div class="select-wrapper">
                            <select name="shippingMethod" id="shippingMethod" class="form-control" required>
                                <option value="">Chọn phương thức giao hàng</option>
                                <c:forEach var="s" items="${shippingMethods}">
                                    <option value="${s.id}">${s.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="paymentMethod" class="form-label">
                            <i class="bi bi-wallet2 me-2"></i>
                            Phương thức thanh toán
                        </label>
                        <div class="select-wrapper">
                            <select name="paymentMethod" id="paymentMethod" class="form-control" required>
                                <option value="">Chọn phương thức thanh toán</option>
                                <c:forEach var="p" items="${paymentMethods}">
                                    <option value="${p.id}">${p.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <!-- Payment Method Options -->
                    <div class="payment-methods">
                        <div class="payment-option" onclick="selectPayment('cod')">
                            <div class="payment-content">
                                <div class="payment-icon">
                                    <i class="bi bi-cash-coin"></i>
                                </div>
                                <div class="payment-info">
                                    <h4>Thanh toán khi nhận hàng (COD)</h4>
                                    <p>Thanh toán bằng tiền mặt khi nhận được sản phẩm</p>
                                </div>
                            </div>
                        </div>

                        <div class="payment-option" onclick="selectPayment('bank')">
                            <div class="payment-content">
                                <div class="payment-icon">
                                    <i class="bi bi-bank"></i>
                                </div>
                                <div class="payment-info">
                                    <h4>Chuyển khoản ngân hàng</h4>
                                    <p>Chuyển khoản qua tài khoản ngân hàng của shop</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary" id="traditionalBtn">
                        <i class="bi bi-check-circle-fill"></i>
                        <span>Xác nhận đặt hàng</span>
                    </button>
                </form>

                <!-- VNPay Form -->
                <div style="margin-top: 2rem; padding-top: 2rem; border-top: 2px dashed #e9ecef;">
                    <div class="payment-option" onclick="selectPayment('vnpay')">
                        <div class="payment-content">
                            <div class="payment-icon" style="background: linear-gradient(135deg, #0066cc, #004499);">
                                <i class="bi bi-credit-card-2-front"></i>
                            </div>
                            <div class="payment-info">
                                <h4>Thanh toán VNPay</h4>
                                <p>Thanh toán trực tuyến qua ví điện tử VNPay</p>
                            </div>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/vnpay" method="post" style="margin-top: 1rem;">
                        <input type="hidden" name="amount" value="${total}" />
                        <button type="submit" class="btn btn-vnpay" id="vnpayBtn">
                            <i class="bi bi-credit-card"></i>
                            <span>Thanh toán VNPay</span>
                        </button>
                    </form>
                </div>
            </div>

            <!-- Order Summary -->
            <div class="order-summary">
                <h3 class="summary-title">
                    <i class="bi bi-receipt me-2"></i>
                    Tóm tắt đơn hàng
                </h3>

                <div class="total-display">
                    <div class="total-label">Tổng thanh toán</div>
                    <h2 class="total-amount">
                        <c:choose>
                            <c:when test="${not empty total}">
                                <fmt:formatNumber value="${total}" type="number" groupingUsed="true"/> ₫
                            </c:when>
                            <c:otherwise>
                                <span style="font-size: 1.2rem; opacity: 0.8;">Không xác định</span>
                            </c:otherwise>
                        </c:choose>
                    </h2>
                </div>

                <!-- Trust Indicators -->
                <div class="trust-indicators">
                    <div class="trust-item">
                        <i class="bi bi-shield-check trust-icon"></i>
                        <span>Thông tin được bảo mật an toàn</span>
                    </div>
                    <div class="trust-item">
                        <i class="bi bi-truck trust-icon"></i>
                        <span>Miễn phí giao hàng đơn từ 500.000₫</span>
                    </div>
                    <div class="trust-item">
                        <i class="bi bi-arrow-repeat trust-icon"></i>
                        <span>Đổi trả trong vòng 30 ngày</span>
                    </div>
                    <div class="trust-item">
                        <i class="bi bi-headset trust-icon"></i>
                        <span>Hỗ trợ khách hàng 24/7</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Payment method selection
        function selectPayment(method) {
            document.querySelectorAll('.payment-option').forEach(option => {
                option.classList.remove('active');
            });
            
            event.currentTarget.classList.add('active');
        }

        // Form validation and loading states
        document.getElementById('traditionalForm').addEventListener('submit', function(e) {
            const shippingMethod = document.getElementById('shippingMethod');
            const paymentMethod = document.getElementById('paymentMethod');
            const btn = document.getElementById('traditionalBtn');
            
            let isValid = true;
            
            // Reset error states
            [shippingMethod, paymentMethod].forEach(field => {
                field.classList.remove('error');
            });
            
            // Validate shipping method
            if (!shippingMethod.value) {
                shippingMethod.classList.add('error');
                isValid = false;
            }
            
            // Validate payment method
            if (!paymentMethod.value) {
                paymentMethod.classList.add('error');
                isValid = false;
            }
            
            if (!isValid) {
                e.preventDefault();
                showNotification('Vui lòng điền đầy đủ thông tin thanh toán!', 'error');
                return;
            }
            
            // Add loading state
            btn.classList.add('loading');
            btn.disabled = true;
            
            // Show success message
            showNotification('Đang xử lý đơn hàng của bạn...', 'success');
        });

        // VNPay form submission
        document.getElementById('vnpayBtn').addEventListener('click', function(e) {
            const btn = this;
            
            btn.classList.add('loading');
            btn.disabled = true;
            
            showNotification('Đang chuyển hướng đến VNPay...', 'info');
            
            // Re-enable button after 3 seconds if something goes wrong
            setTimeout(() => {
                btn.classList.remove('loading');
                btn.disabled = false;
            }, 3000);
        });

        // Enhanced form interactions
        document.querySelectorAll('.form-control').forEach(field => {
            field.addEventListener('focus', function() {
                this.classList.remove('error');
            });

            field.addEventListener('change', function() {
                if (this.value) {
                    this.classList.remove('error');
                }
            });
        });

        // Notification system
        function showNotification(message, type) {
            const notification = document.createElement('div');
            notification.className = `${type}-message`;
            notification.innerHTML = `
                <i class="bi bi-${getIcon(type)}"></i>
                ${message}
            `;
            
            const container = document.querySelector('.checkout-container');
            container.insertBefore(notification, container.firstChild);
            
            // Auto remove after 5 seconds
            setTimeout(() => {
                notification.style.animation = 'slideOutUp 0.5s ease forwards';
                setTimeout(() => notification.remove(), 500);
            }, 5000);
        }

        function getIcon(type) {
            const icons = {
                'error': 'exclamation-triangle-fill',
                'success': 'check-circle-fill',
                'info': 'info-circle-fill'
            };
            return icons[type] || 'info-circle-fill';
        }

        // Keyboard shortcuts
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                window.location.href = '${pageContext.request.contextPath}/cart';
            }
        });

        // Auto-select first payment method if only one available
        document.addEventListener('DOMContentLoaded', function() {
            const paymentOptions = document.querySelectorAll('.payment-option');
            if (paymentOptions.length === 1) {
                paymentOptions[0].classList.add('active');
            }
            
            // Add smooth scroll behavior
            document.documentElement.style.scrollBehavior = 'smooth';
        });

        // Price formatting
        function formatPrice(price) {
            return new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(price);
        }

        // Form auto-save (optional)
        function saveFormData() {
            const formData = {
                shippingMethod: document.getElementById('shippingMethod').value,
                paymentMethod: document.getElementById('paymentMethod').value
            };
            localStorage.setItem('checkoutData', JSON.stringify(formData));
        }

        function loadFormData() {
            const saved = localStorage.getItem('checkoutData');
            if (saved) {
                const data = JSON.parse(saved);
                document.getElementById('shippingMethod').value = data.shippingMethod || '';
                document.getElementById('paymentMethod').value = data.paymentMethod || '';
            }
        }

        // Load saved data on page load
        document.addEventListener('DOMContentLoaded', loadFormData);

        // Save data on form changes
        document.querySelectorAll('select').forEach(select => {
            select.addEventListener('change', saveFormData);
        });
    </script>
</body>
</html>
