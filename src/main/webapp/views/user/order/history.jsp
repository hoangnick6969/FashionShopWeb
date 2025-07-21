
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../../common/header.jsp" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử đơn hàng - FashionShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #2563eb;
            --primary-dark: #1d4ed8;
            --primary-light: #dbeafe;
            --secondary-color: #1f2937;
            --success-color: #059669;
            --warning-color: #d97706;
            --danger-color: #dc2626;
            --info-color: #0891b2;
            --gray-50: #f9fafb;
            --gray-100: #f3f4f6;
            --gray-200: #e5e7eb;
            --gray-300: #d1d5db;
            --gray-500: #6b7280;
            --gray-600: #4b5563;
            --gray-700: #374151;
            --gray-800: #1f2937;
            --gray-900: #111827;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            --border-radius: 0.75rem;
            --border-radius-sm: 0.5rem;
            --transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            min-height: 100vh;
            line-height: 1.6;
            color: var(--gray-800);
        }

        /* Container */
        .order-history-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        /* Page Header */
        .page-header {
            background: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-200);
            position: relative;
            overflow: hidden;
        }

        .page-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), #3b82f6);
        }

        .page-title {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 0.5rem;
        }

        .page-title i {
            width: 48px;
            height: 48px;
            background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            color: white;
            border-radius: var(--border-radius-sm);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .page-title h1 {
            font-size: 2rem;
            font-weight: 700;
            color: var(--gray-900);
            margin: 0;
        }

        .page-subtitle {
            color: var(--gray-600);
            font-size: 1.1rem;
            margin: 0;
        }

        /* Empty State */
        .empty-state {
            background: white;
            border-radius: var(--border-radius);
            padding: 4rem 2rem;
            text-align: center;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-200);
        }

        .empty-state-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, var(--gray-100), var(--gray-200));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2rem;
            color: var(--gray-500);
        }

        .empty-state h3 {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: 0.5rem;
        }

        .empty-state p {
            color: var(--gray-600);
            font-size: 1.1rem;
            margin-bottom: 2rem;
        }

        .btn-shop-now {
            background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            color: white;
            padding: 0.75rem 2rem;
            border-radius: var(--border-radius-sm);
            text-decoration: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition);
            border: none;
            box-shadow: var(--shadow-sm);
        }

        .btn-shop-now:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
            color: white;
            text-decoration: none;
        }

        /* Orders Grid */
        .orders-grid {
            display: grid;
            gap: 1.5rem;
            grid-template-columns: 1fr;
        }

        /* Order Card */
        .order-card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-200);
            overflow: hidden;
            transition: var(--transition);
            position: relative;
        }

        .order-card:hover {
            box-shadow: var(--shadow-md);
            transform: translateY(-2px);
        }

        .order-card-header {
            background: var(--gray-50);
            padding: 1.5rem;
            border-bottom: 1px solid var(--gray-200);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .order-meta {
            display: flex;
            align-items: center;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .order-id {
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--gray-900);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .order-id i {
            color: var(--primary-color);
        }

        .order-date {
            color: var(--gray-600);
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .order-status {
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-size: 0.875rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            border: 2px solid;
            position: relative;
            overflow: hidden;
        }

        .order-status::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s ease;
        }

        .order-status:hover::before {
            left: 100%;
        }

        /* Status Variants */
        .status-pending {
            background: #fef3c7;
            color: #92400e;
            border-color: #d97706;
        }

        .status-paid {
            background: #d1fae5;
            color: #065f46;
            border-color: var(--success-color);
        }

        .status-shipped {
            background: #dbeafe;
            color: #1e40af;
            border-color: var(--primary-color);
        }

        .status-delivered {
            background: #ecfdf5;
            color: #047857;
            border-color: #10b981;
        }

        .status-cancelled {
            background: #fee2e2;
            color: #991b1b;
            border-color: var(--danger-color);
        }

        .order-card-body {
            padding: 1.5rem;
        }

        .order-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .detail-item {
            display: flex;
            flex-direction: column;
            gap: 0.25rem;
        }

        .detail-label {
            font-size: 0.875rem;
            font-weight: 600;
            color: var(--gray-600);
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .detail-value {
            font-size: 1rem;
            font-weight: 500;
            color: var(--gray-900);
        }

        .order-total {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--primary-color);
        }

        /* Refund Notice */
        .refund-notice {
            background: linear-gradient(135deg, #fef3c7, #fed7aa);
            border: 1px solid #f59e0b;
            border-radius: var(--border-radius-sm);
            padding: 0.75rem 1rem;
            margin-top: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            color: #92400e;
        }

        .refund-notice i {
            color: #f59e0b;
        }

        /* Action Buttons */
        .order-actions {
            display: flex;
            gap: 0.75rem;
            justify-content: flex-end;
            padding-top: 1rem;
            border-top: 1px solid var(--gray-200);
            flex-wrap: wrap;
        }

        .btn {
            padding: 0.5rem 1rem;
            border-radius: var(--border-radius-sm);
            font-size: 0.875rem;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition);
            border: 1px solid;
            cursor: pointer;
            background: none;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            color: white;
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
            color: white;
            text-decoration: none;
        }

        .btn-danger {
            background: linear-gradient(135deg, var(--danger-color), #ef4444);
            color: white;
            border-color: var(--danger-color);
        }

        .btn-danger:hover {
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
            color: white;
        }

        .btn-outline {
            background: white;
            color: var(--gray-700);
            border-color: var(--gray-300);
        }

        .btn-outline:hover {
            background: var(--gray-50);
            border-color: var(--gray-400);
            color: var(--gray-700);
            text-decoration: none;
        }

        /* Loading State */
        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
            opacity: 0;
            visibility: hidden;
            transition: var(--transition);
        }

        .loading-overlay.active {
            opacity: 1;
            visibility: visible;
        }

        .loading-spinner {
            width: 48px;
            height: 48px;
            border: 4px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            border-top: 4px solid white;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .order-history-container {
                margin: 1rem auto;
                padding: 0 0.5rem;
            }

            .page-header {
                padding: 1.5rem;
                margin-bottom: 1.5rem;
            }

            .page-title {
                flex-direction: column;
                text-align: center;
                gap: 0.75rem;
            }

            .page-title h1 {
                font-size: 1.75rem;
            }

            .order-card-header {
                flex-direction: column;
                align-items: stretch;
                gap: 1rem;
            }

            .order-meta {
                justify-content: space-between;
            }

            .order-details {
                grid-template-columns: 1fr;
                gap: 0.75rem;
            }

            .order-actions {
                justify-content: stretch;
                flex-direction: column;
            }

            .btn {
                justify-content: center;
                width: 100%;
            }
        }

        /* Accessibility */
        .btn:focus,
        .order-card:focus-within {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        /* Animation */
        .order-card {
            animation: slideInUp 0.5s ease-out;
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Order card animation delay */
        .order-card:nth-child(1) { animation-delay: 0.1s; }
        .order-card:nth-child(2) { animation-delay: 0.2s; }
        .order-card:nth-child(3) { animation-delay: 0.3s; }
        .order-card:nth-child(4) { animation-delay: 0.4s; }
        .order-card:nth-child(5) { animation-delay: 0.5s; }
    </style>
</head>
<body>
    <div class="order-history-container">
        <!-- Page Header -->
        <div class="page-header">
            <div class="page-title">
                <i class="bi bi-clock-history"></i>
                <div>
                    <h1>Lịch sử đơn hàng</h1>
                    <p class="page-subtitle">Theo dõi và quản lý tất cả đơn hàng của bạn</p>
                </div>
            </div>
        </div>

        <!-- Orders Content -->
        <c:choose>
            <c:when test="${empty orders}">
                <!-- Empty State -->
                <div class="empty-state">
                    <div class="empty-state-icon">
                        <i class="bi bi-bag-x"></i>
                    </div>
                    <h3>Chưa có đơn hàng nào</h3>
                    <p>Bạn chưa thực hiện đơn hàng nào. Hãy khám phá các sản phẩm tuyệt vời của chúng tôi!</p>
                    <a href="${pageContext.request.contextPath}/products" class="btn-shop-now">
                        <i class="bi bi-bag-plus"></i>
                        Mua sắm ngay
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Orders Grid -->
                <div class="orders-grid">
                    <c:forEach var="o" items="${orders}" varStatus="status">
                        <div class="order-card">
                            <!-- Order Header -->
                            <div class="order-card-header">
                                <div class="order-meta">
                                    <div class="order-id">
                                        <i class="bi bi-receipt"></i>
                                        Đơn hàng #${o.id}
                                    </div>
                                    <div class="order-date">
                                        <i class="bi bi-calendar3"></i>
                                        <fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyyy HH:mm" />
                                    </div>
                                </div>
                                
                                <!-- Status Badge -->
                                <div class="order-status 
                                    <c:choose>
                                        <c:when test="${o.status eq 'Chờ thanh toán'}">status-pending</c:when>
                                        <c:when test="${o.status eq 'Đã thanh toán'}">status-paid</c:when>
                                        <c:when test="${o.status eq 'Đang giao hàng'}">status-shipped</c:when>
                                        <c:when test="${o.status eq 'Đã giao hàng'}">status-delivered</c:when>
                                        <c:when test="${o.status eq 'Hủy'}">status-cancelled</c:when>
                                        <c:otherwise>status-pending</c:otherwise>
                                    </c:choose>">
                                    <c:choose>
                                        <c:when test="${o.status eq 'Chờ thanh toán'}">
                                            <i class="bi bi-clock"></i>
                                        </c:when>
                                        <c:when test="${o.status eq 'Đã thanh toán'}">
                                            <i class="bi bi-check-circle"></i>
                                        </c:when>
                                        <c:when test="${o.status eq 'Đang giao hàng'}">
                                            <i class="bi bi-truck"></i>
                                        </c:when>
                                        <c:when test="${o.status eq 'Đã giao hàng'}">
                                            <i class="bi bi-box-seam"></i>
                                        </c:when>
                                        <c:when test="${o.status eq 'Hủy'}">
                                            <i class="bi bi-x-circle"></i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="bi bi-question-circle"></i>
                                        </c:otherwise>
                                    </c:choose>
                                    ${o.status}
                                </div>
                            </div>

                            <!-- Order Body -->
                            <div class="order-card-body">
                                <div class="order-details">
                                    <div class="detail-item">
                                        <span class="detail-label">Tổng tiền</span>
                                        <span class="detail-value order-total">
                                            <fmt:formatNumber value="${o.total}" type="currency" currencySymbol="" />₫
                                        </span>
                                    </div>
                                    
                                    <c:if test="${o.paymentMethod != null}">
                                        <div class="detail-item">
                                            <span class="detail-label">Thanh toán</span>
                                            <span class="detail-value">
                                                <i class="bi bi-credit-card me-1"></i>
                                                ${o.paymentMethod.name}
                                            </span>
                                        </div>
                                    </c:if>
                                    
                                    <c:if test="${o.shippingMethod != null}">
                                        <div class="detail-item">
                                            <span class="detail-label">Vận chuyển</span>
                                            <span class="detail-value">
                                                <i class="bi bi-truck me-1"></i>
                                                ${o.shippingMethod.name}
                                            </span>
                                        </div>
                                    </c:if>
                                    
                                    <c:if test="${not empty o.transactionNo}">
                                        <div class="detail-item">
                                            <span class="detail-label">Mã giao dịch</span>
                                            <span class="detail-value">
                                                <i class="bi bi-hash me-1"></i>
                                                ${o.transactionNo}
                                            </span>
                                        </div>
                                    </c:if>
                                </div>

                                <!-- Refund Notice -->
                                <c:if test="${o.requestRefund}">
                                    <div class="refund-notice">
                                        <i class="bi bi-exclamation-triangle"></i>
                                        Đã yêu cầu hoàn tiền - Chờ xử lý
                                    </div>
                                </c:if>

                                <!-- Action Buttons -->
                                <div class="order-actions">
                                    <a href="${pageContext.request.contextPath}/order/detail?id=${o.id}" 
                                       class="btn btn-primary">
                                        <i class="bi bi-eye"></i>
                                        Xem chi tiết
                                    </a>

                                    <c:if test="${o.status eq 'Đã thanh toán' and not o.requestRefund}">
                                        <form action="${pageContext.request.contextPath}/request-refund" 
                                              method="post" 
                                              style="display:inline;"
                                              onsubmit="return confirmRefund(event, '${o.id}')">
                                            <input type="hidden" name="orderId" value="${o.id}" />
                                            <button type="submit" class="btn btn-danger">
                                                <i class="bi bi-arrow-clockwise"></i>
                                                Yêu cầu hoàn tiền
                                            </button>
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Loading Overlay -->
    <div class="loading-overlay" id="loadingOverlay">
        <div class="loading-spinner"></div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Confirm refund request
        function confirmRefund(event, orderId) {
            event.preventDefault();
            
            if (confirm('Bạn có chắc chắn muốn yêu cầu hoàn tiền cho đơn hàng #' + orderId + '?\n\nLưu ý: Sau khi gửi yêu cầu, bạn không thể hủy bỏ.')) {
                showLoading();
                event.target.submit();
                return true;
            }
            
            return false;
        }

        // Show loading overlay
        function showLoading() {
            document.getElementById('loadingOverlay').classList.add('active');
        }

        // Hide loading overlay
        function hideLoading() {
            document.getElementById('loadingOverlay').classList.remove('active');
        }

        // Enhanced interactions
        document.addEventListener('DOMContentLoaded', function() {
            // Add click analytics
            document.querySelectorAll('.order-card').forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-4px)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(-2px)';
                });
            });

            // Auto-hide loading after page load
            setTimeout(hideLoading, 500);

            // Add keyboard navigation
            document.addEventListener('keydown', function(e) {
                if (e.key === 'Escape') {
                    hideLoading();
                }
            });

            // Smooth scroll for actions
            document.querySelectorAll('.btn').forEach(btn => {
                btn.addEventListener('click', function(e) {
                    if (this.classList.contains('btn-primary')) {
                        showLoading();
                    }
                });
            });

            // Add ripple effect to buttons
            document.querySelectorAll('.btn').forEach(button => {
                button.addEventListener('click', function(e) {
                    const ripple = document.createElement('span');
                    const rect = this.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;
                    
                    ripple.style.cssText = `
                        position: absolute;
                        width: ${size}px;
                        height: ${size}px;
                        left: ${x}px;
                        top: ${y}px;
                        background: rgba(255,255,255,0.4);
                        border-radius: 50%;
                        transform: scale(0);
                        animation: ripple 0.6s linear;
                        pointer-events: none;
                    `;
                    
                    this.style.position = 'relative';
                    this.style.overflow = 'hidden';
                    this.appendChild(ripple);
                    
                    setTimeout(() => ripple.remove(), 600);
                });
            });
        });

        // CSS animation for ripple effect
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

        // Performance optimization - lazy load images if any
        if ('IntersectionObserver' in window) {
            const imageObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        img.src = img.dataset.src;
                        img.classList.remove('lazy');
                        imageObserver.unobserve(img);
                    }
                });
            });

            document.querySelectorAll('img[data-src]').forEach(img => {
                imageObserver.observe(img);
            });
        }
    </script>
</body>
</html>

<jsp:include page="../../common/footer.jsp" />
