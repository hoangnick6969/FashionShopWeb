
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    }

    .cart-container {
        max-width: 1200px;
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

    .cart-header {
        background: var(--white);
        border-radius: var(--border-radius-lg);
        padding: 2rem;
        margin-bottom: 2rem;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--gray-200);
        position: relative;
        overflow: hidden;
    }

    .cart-header::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: var(--gradient-primary);
    }

    .cart-title {
        font-size: 2.5rem;
        font-weight: 700;
        color: var(--gray-900);
        margin: 0 0 0.5rem 0;
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .cart-title i {
        font-size: 2rem;
        color: var(--primary-color);
        background: var(--primary-light);
        padding: 0.8rem;
        border-radius: 50%;
        animation: pulse 2s infinite;
    }

    @keyframes pulse {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.05); }
    }

    .cart-subtitle {
        color: var(--gray-600);
        font-size: 1.1rem;
        margin: 0;
        font-weight: 400;
    }

    .empty-cart {
        text-align: center;
        background: var(--white);
        border-radius: var(--border-radius-lg);
        padding: 4rem 2rem;
        box-shadow: var(--shadow-md);
        margin-top: 2rem;
        border: 1px solid var(--gray-200);
        animation: slideInUp 0.8s ease-out;
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

    .empty-cart-icon {
        font-size: 5rem;
        color: var(--gray-400);
        margin-bottom: 1.5rem;
        animation: float 3s ease-in-out infinite;
    }

    @keyframes float {
        0%, 100% { transform: translateY(0px); }
        50% { transform: translateY(-10px); }
    }

    .empty-cart h3 {
        font-size: 1.75rem;
        color: var(--gray-700);
        margin-bottom: 1rem;
        font-weight: 600;
    }

    .empty-cart p {
        color: var(--gray-600);
        font-size: 1.1rem;
        margin-bottom: 2rem;
        line-height: 1.6;
    }

    .btn-primary {
        background: var(--gradient-primary);
        color: var(--white);
        border: none;
        padding: 1rem 2rem;
        border-radius: var(--border-radius);
        font-weight: 600;
        font-size: 1rem;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        transition: var(--transition);
        box-shadow: var(--shadow-sm);
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: var(--shadow-md);
        text-decoration: none;
        color: var(--white);
    }

    .cart-content {
        display: grid;
        grid-template-columns: 1fr 400px;
        gap: 2rem;
        align-items: start;
    }

    .cart-items {
        background: var(--white);
        border-radius: var(--border-radius-lg);
        overflow: hidden;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--gray-200);
    }

    .cart-item {
        padding: 1.5rem;
        border-bottom: 1px solid var(--gray-200);
        transition: var(--transition);
        position: relative;
        animation: slideInLeft 0.6s ease-out;
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

    .cart-item:last-child {
        border-bottom: none;
    }

    .cart-item:hover {
        background: var(--gray-50);
        transform: translateX(4px);
    }

    .item-content {
        display: grid;
        grid-template-columns: 120px 1fr auto;
        gap: 1.5rem;
        align-items: center;
    }

    .item-image {
        width: 120px;
        height: 120px;
        border-radius: var(--border-radius);
        overflow: hidden;
        box-shadow: var(--shadow-sm);
        border: 2px solid var(--gray-200);
        transition: var(--transition);
    }

    .item-image:hover {
        transform: scale(1.05);
        box-shadow: var(--shadow-md);
    }

    .item-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: var(--transition);
    }

    .item-details {
        flex: 1;
    }

    .item-name {
        font-size: 1.25rem;
        font-weight: 600;
        color: var(--gray-900);
        margin: 0 0 0.5rem 0;
        line-height: 1.4;
    }

    .item-price {
        font-size: 1.1rem;
        color: var(--primary-color);
        font-weight: 600;
        margin-bottom: 1rem;
    }

    .quantity-controls {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        background: var(--gray-50);
        padding: 0.5rem;
        border-radius: var(--border-radius);
        border: 1px solid var(--gray-300);
    }

    .quantity-btn {
        width: 36px;
        height: 36px;
        border: none;
        background: var(--white);
        color: var(--gray-700);
        border-radius: 8px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: var(--transition);
        font-size: 1.1rem;
        font-weight: 600;
        box-shadow: var(--shadow-sm);
    }

    .quantity-btn:hover {
        background: var(--primary-color);
        color: var(--white);
        transform: scale(1.1);
    }

    .quantity-display {
        font-weight: 600;
        color: var(--gray-900);
        min-width: 2rem;
        text-align: center;
        font-size: 1.1rem;
    }

    .item-actions {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
        gap: 1rem;
    }

    .item-total {
        font-size: 1.5rem;
        font-weight: 700;
        color: var(--success-color);
        margin-bottom: 0.5rem;
    }

    .remove-btn {
        background: linear-gradient(135deg, var(--danger-color), #c0392b);
        color: var(--white);
        border: none;
        padding: 0.75rem 1.25rem;
        border-radius: var(--border-radius);
        font-weight: 600;
        cursor: pointer;
        transition: var(--transition);
        display: flex;
        align-items: center;
        gap: 0.5rem;
        font-size: 0.9rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        box-shadow: var(--shadow-sm);
    }

    .remove-btn:hover {
        transform: translateY(-2px);
        box-shadow: var(--shadow-md);
        background: linear-gradient(135deg, #c0392b, var(--danger-color));
    }

    .cart-summary {
        background: var(--white);
        border-radius: var(--border-radius-lg);
        padding: 2rem;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--gray-200);
        position: sticky;
        top: 2rem;
        height: fit-content;
        animation: slideInRight 0.6s ease-out;
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

    .summary-title {
        font-size: 1.5rem;
        font-weight: 700;
        color: var(--gray-900);
        margin: 0 0 1.5rem 0;
        padding-bottom: 1rem;
        border-bottom: 2px solid var(--gray-200);
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .summary-title i {
        color: var(--primary-color);
        font-size: 1.25rem;
    }

    .summary-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0.75rem 0;
        border-bottom: 1px solid var(--gray-200);
    }

    .summary-row:last-child {
        border-bottom: none;
        padding-top: 1.5rem;
        margin-top: 1rem;
        border-top: 2px solid var(--gray-200);
    }

    .summary-label {
        color: var(--gray-700);
        font-weight: 500;
        font-size: 1rem;
    }

    .summary-value {
        color: var(--gray-900);
        font-weight: 600;
        font-size: 1rem;
    }

    .summary-total {
        font-size: 1.5rem;
        font-weight: 700;
        color: var(--success-color);
    }

    .checkout-section {
        margin-top: 2rem;
        padding-top: 2rem;
        border-top: 2px solid var(--gray-200);
    }

    .checkout-buttons {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }

    .btn-checkout {
        background: var(--gradient-success);
        color: var(--white);
        border: none;
        padding: 1.25rem 1.5rem;
        border-radius: var(--border-radius);
        font-weight: 700;
        font-size: 1.1rem;
        cursor: pointer;
        transition: var(--transition);
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.75rem;
        text-decoration: none;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        box-shadow: var(--shadow-sm);
        position: relative;
        overflow: hidden;
    }

    .btn-checkout::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
        transition: left 0.5s ease;
    }

    .btn-checkout:hover::before {
        left: 100%;
    }

    .btn-checkout:hover {
        transform: translateY(-3px);
        box-shadow: var(--shadow-lg);
        text-decoration: none;
        color: var(--white);
    }

    .btn-vnpay {
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        color: var(--white);
        border: none;
        padding: 1.25rem 1.5rem;
        border-radius: var(--border-radius);
        font-weight: 700;
        font-size: 1.1rem;
        cursor: pointer;
        transition: var(--transition);
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.75rem;
        text-decoration: none;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        box-shadow: var(--shadow-sm);
        position: relative;
        overflow: hidden;
    }

    .btn-vnpay::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
        transition: left 0.5s ease;
    }

    .btn-vnpay:hover::before {
        left: 100%;
    }

    .btn-vnpay:hover {
        transform: translateY(-3px);
        box-shadow: var(--shadow-lg);
        text-decoration: none;
        color: var(--white);
    }

    .security-badge {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.5rem;
        color: var(--gray-600);
        font-size: 0.9rem;
        margin-top: 1rem;
        padding: 0.75rem;
        background: var(--gray-50);
        border-radius: var(--border-radius);
        border: 1px solid var(--gray-200);
    }

    .security-badge i {
        color: var(--success-color);
        font-size: 1rem;
    }

    /* Responsive Design */
    @media (max-width: 968px) {
        .cart-content {
            grid-template-columns: 1fr;
            gap: 1.5rem;
        }

        .cart-summary {
            position: static;
        }
    }

    @media (max-width: 768px) {
        .cart-container {
            margin: 1rem auto;
            padding: 0 0.5rem;
        }

        .cart-header {
            padding: 1.5rem;
        }

        .cart-title {
            font-size: 2rem;
        }

        .item-content {
            grid-template-columns: 80px 1fr;
            gap: 1rem;
        }

        .item-image {
            width: 80px;
            height: 80px;
        }

        .item-actions {
            grid-column: 1 / -1;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 1px solid var(--gray-200);
        }

        .cart-summary {
            padding: 1.5rem;
        }
    }

    @media (max-width: 480px) {
        .cart-title {
            font-size: 1.75rem;
            flex-direction: column;
            text-align: center;
            gap: 0.5rem;
        }

        .item-content {
            grid-template-columns: 1fr;
            text-align: center;
        }

        .item-image {
            justify-self: center;
        }

        .checkout-buttons {
            gap: 0.75rem;
        }

        .btn-checkout,
        .btn-vnpay {
            padding: 1rem;
            font-size: 1rem;
        }
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

    /* Accessibility Improvements */
    .cart-item:focus-within {
        outline: 2px solid var(--primary-color);
        outline-offset: 2px;
    }

    .btn-primary:focus,
    .btn-checkout:focus,
    .btn-vnpay:focus,
    .remove-btn:focus,
    .quantity-btn:focus {
        outline: 2px solid var(--primary-color);
        outline-offset: 2px;
    }

    /* Success Animation */
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

<div class="cart-container">
    <!-- Cart Header -->
    <div class="cart-header">
        <h1 class="cart-title">
            <i class="bi bi-cart-fill"></i>
            Giỏ hàng của bạn
        </h1>
        <p class="cart-subtitle">Xem lại và quản lý các sản phẩm bạn đã chọn</p>
    </div>

    <c:choose>
        <c:when test="${empty cart}">
            <!-- Empty Cart State -->
            <div class="empty-cart">
                <div class="empty-cart-icon">
                    <i class="bi bi-cart-x"></i>
                </div>
                <h3>Giỏ hàng trống</h3>
                <p>Bạn chưa có sản phẩm nào trong giỏ hàng.<br>Hãy khám phá những sản phẩm tuyệt vời của chúng tôi!</p>
                <a href="${pageContext.request.contextPath}/home" class="btn-primary">
                    <i class="bi bi-arrow-left"></i>
                    Tiếp tục mua sắm
                </a>
            </div>
        </c:when>
        <c:otherwise>
            <!-- Cart Content -->
            <div class="cart-content">
                <!-- Cart Items -->
                <div class="cart-items">
                    <c:forEach var="entry" items="${cart}" varStatus="status">
                        <div class="cart-item" style="animation-delay: ${status.index * 0.1}s">
                            <div class="item-content">
                                <!-- Product Image -->
                                <div class="item-image">
                                    <img src="${pageContext.request.contextPath}/${entry.key.mainImage}" 
                                         alt="${entry.key.name}" 
                                         onerror="this.src='${pageContext.request.contextPath}/images/default.jpg'">
                                </div>

                                <!-- Product Details -->
                                <div class="item-details">
                                    <h3 class="item-name">${entry.key.name}</h3>
                                    <div class="item-price">
                                        <i class="bi bi-tag-fill"></i>
                                        ${entry.key.price} VND
                                    </div>
                                    <div class="quantity-controls">
                                        <button class="quantity-btn" onclick="updateQuantity(${entry.key.id}, -1)" 
                                                aria-label="Giảm số lượng">
                                            <i class="bi bi-dash"></i>
                                        </button>
                                        <span class="quantity-display">${entry.value}</span>
                                        <button class="quantity-btn" onclick="updateQuantity(${entry.key.id}, 1)"
                                                aria-label="Tăng số lượng">
                                            <i class="bi bi-plus"></i>
                                        </button>
                                    </div>
                                </div>

                                <!-- Item Actions -->
                                <div class="item-actions">
                                    <div class="item-total">
                                        ${entry.key.price * entry.value} VND
                                    </div>
                                    <button class="remove-btn" 
                                            onclick="removeFromCart(${entry.key.id}, '${entry.key.name}')"
                                            aria-label="Xóa sản phẩm">
                                        <i class="bi bi-trash"></i>
                                        Xóa
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Cart Summary -->
                <div class="cart-summary">
                    <h2 class="summary-title">
                        <i class="bi bi-receipt"></i>
                        Tổng kết đơn hàng
                    </h2>

                    <div class="summary-row">
                        <span class="summary-label">Số lượng sản phẩm:</span>
                        <span class="summary-value">
                            <c:set var="totalItems" value="0" />
                            <c:forEach var="entry" items="${cart}">
                                <c:set var="totalItems" value="${totalItems + entry.value}" />
                            </c:forEach>
                            ${totalItems} sản phẩm
                        </span>
                    </div>

                    <div class="summary-row">
                        <span class="summary-label">Tạm tính:</span>
                        <span class="summary-value">${total} VND</span>
                    </div>

                    <div class="summary-row">
                        <span class="summary-label">Phí vận chuyển:</span>
                        <span class="summary-value">Miễn phí</span>
                    </div>

                    <div class="summary-row">
                        <span class="summary-label summary-total">Tổng cộng:</span>
                        <span class="summary-value summary-total">${total} VND</span>
                    </div>

                    <div class="checkout-section">
                        <div class="checkout-buttons">
                            <!-- Standard Checkout -->
                            <a href="${pageContext.request.contextPath}/checkout" class="btn-checkout">
                                <i class="bi bi-credit-card"></i>
                                Tiến hành thanh toán
                            </a>

                            <!-- VNPay Checkout -->
                            <form action="${pageContext.request.contextPath}/vnpay" method="post" style="margin: 0;">
                                <input type="hidden" name="amount" value="${total}" />
                                <button type="submit" class="btn-vnpay">
                                    <i class="bi bi-wallet2"></i>
                                    Thanh toán bằng VNPay
                                </button>
                            </form>
                        </div>

                        <div class="security-badge">
                            <i class="bi bi-shield-check"></i>
                            Thanh toán an toàn & bảo mật
                        </div>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<script>
    // Quantity Update Function
    function updateQuantity(productId, change) {
        // Add loading state
        const quantityControls = event.target.closest('.quantity-controls');
        quantityControls.classList.add('loading');

        // Simulate API call (replace with actual implementation)
        setTimeout(() => {
            const quantityDisplay = quantityControls.querySelector('.quantity-display');
            let currentQuantity = parseInt(quantityDisplay.textContent);
            let newQuantity = currentQuantity + change;

            if (newQuantity <= 0) {
                removeFromCart(productId);
                return;
            }

            // Update display
            quantityDisplay.textContent = newQuantity;
            
            // Update item total
            const cartItem = quantityControls.closest('.cart-item');
            const priceText = cartItem.querySelector('.item-price').textContent;
            const price = parseInt(priceText.replace(/[^\d]/g, ''));
            const totalElement = cartItem.querySelector('.item-total');
            totalElement.textContent = (price * newQuantity) + ' VND';

            // Update cart summary
            updateCartSummary();

            // Remove loading state
            quantityControls.classList.remove('loading');

            // Add success animation
            cartItem.classList.add('success-animation');
            setTimeout(() => cartItem.classList.remove('success-animation'), 800);

            // Here you would typically make an AJAX call to update the backend
            // fetch(`${pageContext.request.contextPath}/update-cart`, {
            //     method: 'POST',
            //     headers: { 'Content-Type': 'application/json' },
            //     body: JSON.stringify({ productId: productId, quantity: newQuantity })
            // });

        }, 500);
    }

    // Remove from Cart Function
    function removeFromCart(productId, productName = 'sản phẩm này') {
        // Show confirmation dialog
        const confirmed = confirm(`Bạn có chắc chắn muốn xóa "${productName}" khỏi giỏ hàng?`);
        
        if (confirmed) {
            // Add loading state
            const cartItem = event.target.closest('.cart-item');
            cartItem.style.opacity = '0.5';
            cartItem.style.pointerEvents = 'none';

            // Animate removal
            setTimeout(() => {
                cartItem.style.animation = 'slideOutLeft 0.5s ease-in forwards';
                setTimeout(() => {
                    // Redirect to remove servlet
                    window.location.href = `${pageContext.request.contextPath}/remove-from-cart?productId=${productId}`;
                }, 500);
            }, 300);
        }
    }

    // Update Cart Summary
    function updateCartSummary() {
        let totalAmount = 0;
        let totalItems = 0;

        document.querySelectorAll('.cart-item').forEach(item => {
            const quantity = parseInt(item.querySelector('.quantity-display').textContent);
            const total = parseInt(item.querySelector('.item-total').textContent.replace(/[^\d]/g, ''));
            
            totalItems += quantity;
            totalAmount += total;
        });

        // Update summary values
        document.querySelector('.summary-value').textContent = totalItems + ' sản phẩm';
        document.querySelectorAll('.summary-value')[1].textContent = totalAmount + ' VND';
        document.querySelector('.summary-total.summary-value').textContent = totalAmount + ' VND';

        // Update hidden input for VNPay
        document.querySelector('input[name="amount"]').value = totalAmount;
    }

    // Enhanced button interactions
    document.querySelectorAll('.btn-checkout, .btn-vnpay').forEach(btn => {
        btn.addEventListener('click', function(e) {
            // Add loading state
            this.classList.add('loading');
            
            // Remove loading after form submission
            setTimeout(() => {
                this.classList.remove('loading');
            }, 2000);
        });
    });

    // Smooth scroll to checkout section on mobile
    function scrollToCheckout() {
        if (window.innerWidth <= 768) {
            document.querySelector('.cart-summary').scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    }

    // Auto-save cart state (for future enhancement)
    function saveCartState() {
        const cartState = {
            timestamp: Date.now(),
            items: []
        };

        document.querySelectorAll('.cart-item').forEach(item => {
            const productId = item.querySelector('.remove-btn').onclick.toString().match(/\d+/)[0];
            const quantity = parseInt(item.querySelector('.quantity-display').textContent);
            cartState.items.push({ productId, quantity });
        });

        localStorage.setItem('cartState', JSON.stringify(cartState));
    }

    // Initialize page
    document.addEventListener('DOMContentLoaded', function() {
        // Add fade-in animation to existing items
        document.querySelectorAll('.cart-item').forEach((item, index) => {
            item.style.animationDelay = (index * 0.1) + 's';
        });

        // Auto-scroll to top on page load
        window.scrollTo({ top: 0, behavior: 'smooth' });

        // Add keyboard shortcuts
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                window.location.href = '${pageContext.request.contextPath}/home';
            }
        });
    });

    // Smooth animations for quantity changes
    document.querySelectorAll('.quantity-btn').forEach(btn => {
        btn.addEventListener('mousedown', function() {
            this.style.transform = 'scale(0.95)';
        });

        btn.addEventListener('mouseup', function() {
            this.style.transform = 'scale(1.1)';
            setTimeout(() => {
                this.style.transform = '';
            }, 150);
        });
    });
</script>

<jsp:include page="../../common/footer.jsp" />
