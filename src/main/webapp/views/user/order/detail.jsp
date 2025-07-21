
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đơn hàng #${order.id} - FashionShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #2563eb;
            --primary-dark: #1d4ed8;
            --primary-light: #dbeafe;
            --success-color: #16a34a;
            --success-light: #dcfce7;
            --warning-color: #ca8a04;
            --warning-light: #fefce8;
            --danger-color: #dc2626;
            --danger-light: #fef2f2;
            --neutral-50: #fafafa;
            --neutral-100: #f5f5f5;
            --neutral-200: #e5e5e5;
            --neutral-300: #d4d4d4;
            --neutral-600: #525252;
            --neutral-700: #404040;
            --neutral-800: #262626;
            --neutral-900: #171717;
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            --shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);
            --border-radius: 0.75rem;
            --transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, var(--neutral-50) 0%, var(--neutral-100) 100%);
            min-height: 100vh;
            color: var(--neutral-800);
            line-height: 1.6;
        }

        /* Header Section */
        .page-header {
            background: white;
            border-bottom: 1px solid var(--neutral-200);
            padding: 2rem 0;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-sm);
        }

        .breadcrumb-nav {
            font-size: 0.875rem;
            margin-bottom: 1rem;
        }

        .breadcrumb-nav a {
            color: var(--neutral-600);
            text-decoration: none;
            transition: var(--transition);
        }

        .breadcrumb-nav a:hover {
            color: var(--primary-color);
        }

        .breadcrumb-nav .separator {
            color: var(--neutral-300);
            margin: 0 0.5rem;
        }

        .page-title {
            display: flex;
            align-items: center;
            gap: 1rem;
            font-size: 2rem;
            font-weight: 700;
            color: var(--neutral-900);
        }

        .page-title .order-number {
            color: var(--primary-color);
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            border-radius: 9999px;
            font-size: 0.875rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.025em;
        }

        .status-badge.pending {
            background: var(--warning-light);
            color: var(--warning-color);
            border: 1px solid #fbbf24;
        }

        .status-badge.paid {
            background: var(--success-light);
            color: var(--success-color);
            border: 1px solid #34d399;
        }

        .status-badge.cancelled {
            background: var(--danger-light);
            color: var(--danger-color);
            border: 1px solid #f87171;
        }

        .status-badge.delivered {
            background: var(--primary-light);
            color: var(--primary-color);
            border: 1px solid #60a5fa;
        }

        /* Main Content */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .order-grid {
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 2rem;
            align-items: start;
        }

        /* Order Details Card */
        .order-card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-md);
            overflow: hidden;
            border: 1px solid var(--neutral-200);
        }

        .card-header {
            background: var(--neutral-50);
            border-bottom: 1px solid var(--neutral-200);
            padding: 1.5rem;
        }

        .card-title {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--neutral-900);
        }

        .card-body {
            padding: 1.5rem;
        }

        /* Order Info Grid */
        .order-info {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .info-item {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .info-label {
            font-size: 0.875rem;
            font-weight: 500;
            color: var(--neutral-600);
            text-transform: uppercase;
            letter-spacing: 0.025em;
        }

        .info-value {
            font-size: 1rem;
            font-weight: 600;
            color: var(--neutral-900);
        }

        .info-value.amount {
            font-size: 1.125rem;
            color: var(--primary-color);
        }

        /* Product Items */
        .products-section {
            margin-top: 2rem;
        }

        .product-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            border: 1px solid var(--neutral-200);
            border-radius: var(--border-radius);
            background: var(--neutral-50);
            margin-bottom: 1rem;
            transition: var(--transition);
        }

        .product-item:hover {
            background: white;
            box-shadow: var(--shadow-md);
            transform: translateY(-1px);
        }

        .product-image {
            width: 80px;
            height: 80px;
            background: white;
            border-radius: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid var(--neutral-200);
            flex-shrink: 0;
        }

        .product-image i {
            font-size: 2rem;
            color: var(--neutral-400);
        }

        .product-details {
            flex: 1;
            min-width: 0;
        }

        .product-name {
            font-size: 1rem;
            font-weight: 600;
            color: var(--neutral-900);
            margin-bottom: 0.25rem;
            line-height: 1.4;
        }

        .product-meta {
            display: flex;
            gap: 1rem;
            font-size: 0.875rem;
            color: var(--neutral-600);
        }

        .product-price {
            text-align: right;
            display: flex;
            flex-direction: column;
            gap: 0.25rem;
        }

        .unit-price {
            font-size: 0.875rem;
            color: var(--neutral-600);
        }

        .total-price {
            font-size: 1rem;
            font-weight: 600;
            color: var(--neutral-900);
        }

        /* Summary Card */
        .summary-card {
            position: sticky;
            top: 2rem;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.75rem 0;
            border-bottom: 1px solid var(--neutral-200);
        }

        .summary-row:last-child {
            border-bottom: none;
            padding-top: 1rem;
            font-size: 1.125rem;
            font-weight: 700;
        }

        .summary-label {
            color: var(--neutral-600);
        }

        .summary-value {
            font-weight: 600;
            color: var(--neutral-900);
        }

        .summary-row:last-child .summary-value {
            color: var(--primary-color);
        }

        /* Action Buttons */
        .action-section {
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid var(--neutral-200);
        }

        .btn-action {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: var(--border-radius);
            font-size: 0.875rem;
            font-weight: 600;
            text-decoration: none;
            transition: var(--transition);
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 0.025em;
        }

        .btn-primary {
            background: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background: var(--primary-dark);
            transform: translateY(-1px);
            box-shadow: var(--shadow-lg);
            color: white;
        }

        .btn-danger {
            background: var(--danger-color);
            color: white;
        }

        .btn-danger:hover {
            background: #b91c1c;
            transform: translateY(-1px);
            box-shadow: var(--shadow-lg);
            color: white;
        }

        .btn-outline {
            background: transparent;
            color: var(--neutral-700);
            border: 2px solid var(--neutral-300);
        }

        .btn-outline:hover {
            background: var(--neutral-100);
            border-color: var(--neutral-400);
            color: var(--neutral-800);
        }

        /* Progress Timeline */
        .timeline {
            margin: 2rem 0;
        }

        .timeline-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .timeline-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            background: var(--neutral-200);
            color: var(--neutral-600);
        }

        .timeline-icon.active {
            background: var(--primary-color);
            color: white;
        }

        .timeline-icon.completed {
            background: var(--success-color);
            color: white;
        }

        .timeline-content {
            flex: 1;
        }

        .timeline-title {
            font-weight: 600;
            color: var(--neutral-900);
            margin-bottom: 0.25rem;
        }

        .timeline-date {
            font-size: 0.875rem;
            color: var(--neutral-600);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .order-grid {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .order-info {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .product-item {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            .product-price {
                text-align: center;
            }

            .page-title {
                font-size: 1.5rem;
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }

            .summary-card {
                position: relative;
                top: 0;
            }
        }

        /* Loading States */
        .loading {
            opacity: 0.6;
            pointer-events: none;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .order-card {
            animation: fadeIn 0.5s ease-out;
        }

        /* Print Styles */
        @media print {
            body {
                background: white;
            }
            
            .order-card {
                box-shadow: none;
                border: 1px solid #000;
            }
            
            .btn-action {
                display: none;
            }
        }

        /* Accessibility */
        .btn-action:focus {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        .status-badge:focus {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        /* Error States */
        .error-message {
            background: var(--danger-light);
            color: var(--danger-color);
            padding: 1rem;
            border-radius: var(--border-radius);
            border: 1px solid #f87171;
            margin-bottom: 1rem;
        }

        /* Success States */
        .success-message {
            background: var(--success-light);
            color: var(--success-color);
            padding: 1rem;
            border-radius: var(--border-radius);
            border: 1px solid #34d399;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <jsp:include page="../../common/header.jsp" />

    <!-- Page Header -->
    <div class="page-header">
        <div class="container">
            <!-- Breadcrumb Navigation -->
            <nav class="breadcrumb-nav">
                <a href="${pageContext.request.contextPath}/home">
                    <i class="bi bi-house-door"></i> Trang chủ
                </a>
                <span class="separator">/</span>
                <a href="${pageContext.request.contextPath}/order/history">
                    Lịch sử đơn hàng
                </a>
                <span class="separator">/</span>
                <span>Chi tiết đơn hàng</span>
            </nav>

            <!-- Page Title -->
            <div class="d-flex justify-content-between align-items-center">
                <h1 class="page-title">
                    <i class="bi bi-receipt"></i>
                    Đơn hàng <span class="order-number">#${order.id}</span>
                </h1>
                
                <!-- Order Status Badge -->
                <c:choose>
                    <c:when test="${order.status eq 'Chờ xử lý'}">
                        <span class="status-badge pending">
                            <i class="bi bi-clock"></i> ${order.status}
                        </span>
                    </c:when>
                    <c:when test="${order.status eq 'Đã thanh toán'}">
                        <span class="status-badge paid">
                            <i class="bi bi-check-circle"></i> ${order.status}
                        </span>
                    </c:when>
                    <c:when test="${order.status eq 'Đã giao'}">
                        <span class="status-badge delivered">
                            <i class="bi bi-truck"></i> ${order.status}
                        </span>
                    </c:when>
                    <c:when test="${order.status eq 'Hủy'}">
                        <span class="status-badge cancelled">
                            <i class="bi bi-x-circle"></i> ${order.status}
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span class="status-badge pending">
                            <i class="bi bi-info-circle"></i> ${order.status}
                        </span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="order-grid">
            <!-- Order Details -->
            <div class="order-card">
                <div class="card-header">
                    <h2 class="card-title">
                        <i class="bi bi-info-circle"></i>
                        Thông tin đơn hàng
                    </h2>
                </div>
                <div class="card-body">
                    <!-- Order Information Grid -->
                    <div class="order-info">
                        <div class="info-item">
                            <span class="info-label">Ngày đặt hàng</span>
                            <span class="info-value">
                                <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm" />
                            </span>
                        </div>
                        
                        <div class="info-item">
                            <span class="info-label">Phương thức thanh toán</span>
                            <span class="info-value">
                                <c:choose>
                                    <c:when test="${order.paymentMethod != null}">
                                        <i class="bi bi-credit-card me-2"></i>
                                        ${order.paymentMethod.name}
                                    </c:when>
                                    <c:otherwise>
                                        <i class="bi bi-question-circle me-2"></i>
                                        Chưa xác định
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        
                        <div class="info-item">
                            <span class="info-label">Phương thức giao hàng</span>
                            <span class="info-value">
                                <c:choose>
                                    <c:when test="${order.shippingMethod != null}">
                                        <i class="bi bi-truck me-2"></i>
                                        ${order.shippingMethod.name}
                                    </c:when>
                                    <c:otherwise>
                                        <i class="bi bi-question-circle me-2"></i>
                                        Chưa xác định
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </div>
                        
                        <div class="info-item">
                            <span class="info-label">Tổng tiền</span>
                            <span class="info-value amount">
                                <fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" />
                            </span>
                        </div>
                    </div>

                    <!-- Products Section -->
                    <div class="products-section">
                        <h3 class="card-title mb-3">
                            <i class="bi bi-bag-check"></i>
                            Sản phẩm đã đặt
                        </h3>
                        
                        <c:forEach var="item" items="${order.orderDetails}">
                            <div class="product-item">
                                <div class="product-image">
                                    <i class="bi bi-image"></i>
                                </div>
                                
                                <div class="product-details">
                                    <div class="product-name">
                                        <c:choose>
                                            <c:when test="${item.product != null}">
                                                ${item.product.name}
                                            </c:when>
                                            <c:otherwise>
                                                Sản phẩm không xác định
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="product-meta">
                                        <span>
                                            <i class="bi bi-tag me-1"></i>
                                            <fmt:formatNumber value="${item.price}" type="currency" currencySymbol="₫" />
                                        </span>
                                        <span>
                                            <i class="bi bi-x me-1"></i>
                                            ${item.quantity}
                                        </span>
                                    </div>
                                </div>
                                
                                <div class="product-price">
                                    <div class="unit-price">
                                        <fmt:formatNumber value="${item.price}" type="currency" currencySymbol="₫" /> × ${item.quantity}
                                    </div>
                                    <div class="total-price">
                                        <fmt:formatNumber value="${item.price * item.quantity}" type="currency" currencySymbol="₫" />
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Action Buttons -->
                    <div class="action-section">
                        <div class="d-flex gap-3 flex-wrap">
                            <a href="${pageContext.request.contextPath}/order/history" class="btn-action btn-outline">
                                <i class="bi bi-arrow-left"></i>
                                Quay lại danh sách
                            </a>
                            
                            <c:if test="${order.status eq 'Đã thanh toán'}">
                                <form action="${pageContext.request.contextPath}/request-refund" method="post" class="d-inline">
                                    <input type="hidden" name="orderId" value="${order.id}" />
                                    <button type="submit" class="btn-action btn-danger" 
                                            onclick="return confirm('Bạn có chắc chắn muốn yêu cầu hoàn tiền cho đơn hàng này?')">
                                        <i class="bi bi-arrow-counterclockwise"></i>
                                        Yêu cầu hoàn tiền
                                    </button>
                                </form>
                            </c:if>
                            
                            <button type="button" class="btn-action btn-primary" onclick="window.print()">
                                <i class="bi bi-printer"></i>
                                In đơn hàng
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Order Summary Sidebar -->
            <div class="summary-card order-card">
                <div class="card-header">
                    <h3 class="card-title">
                        <i class="bi bi-receipt-cutoff"></i>
                        Tóm tắt đơn hàng
                    </h3>
                </div>
                <div class="card-body">
                    <div class="summary-row">
                        <span class="summary-label">Mã đơn hàng:</span>
                        <span class="summary-value">#${order.id}</span>
                    </div>
                    
                    <div class="summary-row">
                        <span class="summary-label">Trạng thái:</span>
                        <span class="summary-value">${order.status}</span>
                    </div>
                    
                    <div class="summary-row">
                        <span class="summary-label">Số sản phẩm:</span>
                        <span class="summary-value">
                            <c:set var="totalItems" value="0" />
                            <c:forEach var="item" items="${order.orderDetails}">
                                <c:set var="totalItems" value="${totalItems + item.quantity}" />
                            </c:forEach>
                            ${totalItems} sản phẩm
                        </span>
                    </div>
                    
                    <c:if test="${order.transactionNo != null && !empty order.transactionNo}">
                        <div class="summary-row">
                            <span class="summary-label">Mã giao dịch:</span>
                            <span class="summary-value">${order.transactionNo}</span>
                        </div>
                    </c:if>
                    
                    <div class="summary-row">
                        <span class="summary-label">Tổng cộng:</span>
                        <span class="summary-value">
                            <fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" />
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../../common/footer.jsp" />

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Enhanced user interactions
        document.addEventListener('DOMContentLoaded', function() {
            // Smooth animations for product items
            const productItems = document.querySelectorAll('.product-item');
            productItems.forEach((item, index) => {
                item.style.animationDelay = `${index * 0.1}s`;
                item.classList.add('animate');
            });

            // Status badge click to show more info
            const statusBadge = document.querySelector('.status-badge');
            if (statusBadge) {
                statusBadge.addEventListener('click', function() {
                    // Could show a modal with status history
                    console.log('Status clicked - could show detailed status timeline');
                });
            }

            // Enhanced print functionality
            window.addEventListener('beforeprint', function() {
                document.body.classList.add('printing');
            });

            window.addEventListener('afterprint', function() {
                document.body.classList.remove('printing');
            });

            // Copy order ID to clipboard functionality
            const orderNumber = document.querySelector('.order-number');
            if (orderNumber) {
                orderNumber.addEventListener('click', function() {
                    const orderIdText = this.textContent;
                    navigator.clipboard.writeText(orderIdText).then(function() {
                        // Show temporary success message
                        const originalText = orderNumber.textContent;
                        orderNumber.textContent = 'Đã sao chép!';
                        orderNumber.style.color = 'var(--success-color)';
                        
                        setTimeout(function() {
                            orderNumber.textContent = originalText;
                            orderNumber.style.color = 'var(--primary-color)';
                        }, 2000);
                    });
                });
                orderNumber.style.cursor = 'pointer';
                orderNumber.title = 'Click để sao chép mã đơn hàng';
            }

            // Auto-refresh for pending orders
            const status = '${order.status}';
            if (status === 'Chờ xử lý' || status === 'Đang xử lý') {
                // Auto refresh every 30 seconds for pending orders
                setTimeout(function() {
                    window.location.reload();
                }, 30000);
            }
        });

        // Loading state for buttons
        document.querySelectorAll('.btn-action').forEach(button => {
            button.addEventListener('click', function() {
                if (this.type === 'submit') {
                    this.classList.add('loading');
                    this.innerHTML = '<i class="bi bi-arrow-repeat"></i> Đang xử lý...';
                }
            });
        });
    </script>
</body>
</html>
