<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../../common/header.jsp" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách yêu thích - FashionShop</title>
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
            --heart-color: #ef4444;
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
        .wishlist-container {
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
            background: linear-gradient(90deg, var(--heart-color), #f97316);
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
            background: linear-gradient(135deg, var(--heart-color), #f97316);
            color: white;
            border-radius: var(--border-radius-sm);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            animation: heartbeat 2s ease-in-out infinite;
        }

        @keyframes heartbeat {
            0%, 50%, 100% { transform: scale(1); }
            25%, 75% { transform: scale(1.1); }
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

        .wishlist-stats {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 1px solid var(--gray-200);
        }

        .stat-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.9rem;
            color: var(--gray-600);
        }

        .stat-value {
            font-weight: 600;
            color: var(--primary-color);
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
            width: 120px;
            height: 120px;
            background: linear-gradient(135deg, #fee2e2, #fecaca);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            font-size: 3rem;
            color: var(--heart-color);
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
        }

        .empty-state h3 {
            font-size: 1.75rem;
            font-weight: 700;
            color: var(--gray-900);
            margin-bottom: 0.75rem;
        }

        .empty-state p {
            color: var(--gray-600);
            font-size: 1.1rem;
            margin-bottom: 2rem;
            max-width: 500px;
            margin-left: auto;
            margin-right: auto;
        }

        .btn-discover {
background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            color: white;
            padding: 1rem 2rem;
            border-radius: var(--border-radius-sm);
            text-decoration: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            transition: var(--transition);
            border: none;
            box-shadow: var(--shadow-sm);
            font-size: 1.1rem;
        }

        .btn-discover:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
            color: white;
            text-decoration: none;
        }

        /* Product Grid */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.5rem;
            padding: 0;
        }

        /* Product Card */
        .product-card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-200);
            overflow: hidden;
            transition: var(--transition);
            position: relative;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .product-card:hover {
            box-shadow: var(--shadow-lg);
            transform: translateY(-4px);
        }

        .product-image-container {
            position: relative;
            aspect-ratio: 1;
            overflow: hidden;
            background: var(--gray-100);
        }

        .product-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: var(--transition);
        }

        .product-card:hover .product-image {
            transform: scale(1.05);
        }

        .wishlist-heart {
            position: absolute;
            top: 1rem;
            right: 1rem;
            width: 40px;
            height: 40px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: var(--shadow-md);
            color: var(--heart-color);
            font-size: 1.2rem;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        .product-info {
            padding: 1.5rem;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .product-name {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: 0.5rem;
            line-height: 1.4;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
.product-name a {
            color: inherit;
            text-decoration: none;
            transition: var(--transition);
        }

        .product-name a:hover {
            color: var(--primary-color);
        }

        .product-price {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }

        .product-actions {
            display: flex;
            gap: 0.75rem;
            margin-top: auto;
        }

        .btn {
            padding: 0.75rem 1rem;
            border-radius: var(--border-radius-sm);
            font-size: 0.9rem;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            transition: var(--transition);
            border: 1px solid;
            cursor: pointer;
            flex: 1;
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
            background: white;
            color: var(--heart-color);
            border-color: var(--heart-color);
        }

        .btn-danger:hover {
            background: var(--heart-color);
            color: white;
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
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

        /* Wishlist Actions Bar */
        .wishlist-actions {
            background: white;
            border-radius: var(--border-radius);
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-200);
            display: flex;
justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .actions-left {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .bulk-actions {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .btn-sm {
            padding: 0.5rem 1rem;
            font-size: 0.875rem;
        }

        /* Notification Toast */
        .toast-container {
            position: fixed;
            top: 2rem;
            right: 2rem;
            z-index: 10000;
        }

        .toast {
            background: white;
            border-radius: var(--border-radius-sm);
            box-shadow: var(--shadow-lg);
            border: 1px solid var(--gray-200);
            min-width: 300px;
            transform: translateX(100%);
            transition: var(--transition);
        }

        .toast.show {
            transform: translateX(0);
        }

        .toast-success {
            border-left: 4px solid var(--success-color);
        }

        .toast-error {
            border-left: 4px solid var(--danger-color);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .wishlist-container {
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

            .product-grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 1rem;
            }

            .wishlist-actions {
                flex-direction: column;
                align-items: stretch;
            }

            .actions-left {
                justify-content: center;
            }

            .bulk-actions {
                justify-content: stretch;
                flex-direction: column;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }

            .wishlist-stats {
                justify-content: center;
                flex-wrap: wrap;
            }
        }

        /* Accessibility */
        .btn:focus,
        .product-card:focus-within {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        /* Animation */
        .product-card {
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

        /* Staggered animation for cards */
        .product-card:nth-child(1) { animation-delay: 0.1s; }
        .product-card:nth-child(2) { animation-delay: 0.2s; }
        .product-card:nth-child(3) { animation-delay: 0.3s; }
        .product-card:nth-child(4) { animation-delay: 0.4s; }
        .product-card:nth-child(5) { animation-delay: 0.5s; }
        .product-card:nth-child(6) { animation-delay: 0.6s; }
    </style>
</head>
<body>
    <div class="wishlist-container">
        <!-- Page Header -->
        <div class="page-header">
            <div class="page-title">
                <i class="bi bi-heart-fill"></i>
                <div>
                    <h1>Danh sách yêu thích</h1>
                    <p class="page-subtitle">Những sản phẩm bạn yêu thích nhất</p>
                </div>
            </div>
            
            <c:if test="${not empty wishlist}">
                <div class="wishlist-stats">
                    <div class="stat-item">
                        <i class="bi bi-heart"></i>
                        <span><span class="stat-value">${wishlist.size()}</span> sản phẩm yêu thích</span>
                    </div>
                    <div class="stat-item">
                        <i class="bi bi-clock"></i>
                        <span>Cập nhật lần cuối hôm nay</span>
                    </div>
                </div>
            </c:if>
        </div>

        <!-- Wishlist Content -->
        <c:choose>
            <c:when test="${empty wishlist}">
                <!-- Empty State -->
                <div class="empty-state">
                    <div class="empty-state-icon">
                        <i class="bi bi-heart"></i>
                    </div>
                    <h3>Danh sách yêu thích trống</h3>
                    <p>Bạn chưa thêm sản phẩm nào vào danh sách yêu thích. Hãy khám phá các sản phẩm tuyệt vời và lưu lại những món đồ bạn ưa thích!</p>
                    <a href="${pageContext.request.contextPath}/products" class="btn-discover">
                        <i class="bi bi-search"></i>
                        Khám phá sản phẩm
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Wishlist Actions Bar -->
                <div class="wishlist-actions">
                    <div class="actions-left">
                        <span class="fw-semibold text-secondary">
                            <i class="bi bi-collection"></i>
                            ${wishlist.size()} sản phẩm
                        </span>
                    </div>
                    <div class="bulk-actions">
                        <button class="btn btn-outline-secondary btn-sm" onclick="clearAllWishlist()">
                            <i class="bi bi-trash"></i>
                            Xóa tất cả
                        </button>
<a href="${pageContext.request.contextPath}/products" class="btn btn-primary btn-sm">
                            <i class="bi bi-plus-circle"></i>
                            Thêm sản phẩm
                        </a>
                    </div>
                </div>

                <!-- Product Grid -->
                <div class="product-grid">
                    <c:forEach var="p" items="${wishlist}" varStatus="status">
                        <div class="product-card">
                            <!-- Heart Icon -->
                            <div class="wishlist-heart">
                                <i class="bi bi-heart-fill"></i>
                            </div>
                            
                            <!-- Product Image -->
                            <div class="product-image-container">
                                <a href="${pageContext.request.contextPath}/product-detail?id=${p.id}">
                                    <img src="${pageContext.request.contextPath}/${p.mainImage}" 
                                         alt="${p.name}" 
                                         class="product-image"
                                         onerror="this.src='${pageContext.request.contextPath}/images/default.jpg'">
                                </a>
                            </div>
                            
                            <!-- Product Info -->
                            <div class="product-info">
                                <h4 class="product-name">
                                    <a href="${pageContext.request.contextPath}/product-detail?id=${p.id}">
                                        ${p.name}
                                    </a>
                                </h4>
                                
                                <div class="product-price">
                                    <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="" />₫
                                </div>
                                
                                <!-- Action Buttons -->
                                <div class="product-actions">
                                    <a href="${pageContext.request.contextPath}/product-detail?id=${p.id}" 
                                       class="btn btn-primary">
                                        <i class="bi bi-eye"></i>
                                        Xem chi tiết
                                    </a>
                                    
                                    <form action="${pageContext.request.contextPath}/remove-from-wishlist" 
                                          method="post" 
                                          style="flex: 0 0 auto;"
                                          onsubmit="return confirmRemove(event, '${p.name}')">
                                        <input type="hidden" name="productId" value="${p.id}" />
<button type="submit" class="btn btn-danger" title="Bỏ yêu thích">
                                            <i class="bi bi-heart-break"></i>
                                        </button>
                                    </form>
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

    <!-- Toast Container -->
    <div class="toast-container" id="toastContainer"></div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Confirm remove from wishlist
        function confirmRemove(event, productName) {
            event.preventDefault();
            
            if (confirm(`Bạn có chắc chắn muốn bỏ "${productName}" khỏi danh sách yêu thích?`)) {
                showLoading();
                showToast('Đã xóa khỏi danh sách yêu thích', 'success');
                
                // Add a slight delay for better UX
                setTimeout(() => {
                    event.target.submit();
                }, 500);
                
                return true;
            }
            
            return false;
        }

        // Clear all wishlist
        function clearAllWishlist() {
            if (confirm('Bạn có chắc chắn muốn xóa tất cả sản phẩm khỏi danh sách yêu thích?')) {
                showLoading();
                // This would need to be implemented server-side
                showToast('Chức năng đang được phát triển', 'info');
                hideLoading();
            }
        }

        // Show loading overlay
        function showLoading() {
            document.getElementById('loadingOverlay').classList.add('active');
        }

        // Hide loading overlay
        function hideLoading() {
            document.getElementById('loadingOverlay').classList.remove('active');
        }

        // Show toast notification
        function showToast(message, type = 'success') {
    const toastContainer = document.getElementById('toastContainer');
    const toastId = 'toast-' + Date.now();

    let iconClass = '';
    if (type === 'success') {
        iconClass = 'check-circle-fill text-success';
    } else if (type === 'error') {
        iconClass = 'exclamation-triangle-fill text-danger';
    } else {
        iconClass = 'info-circle-fill text-info';
    }

    const toastHTML = 
        '<div id="' + toastId + '" class="toast toast-' + type + '" role="alert">' +
            '<div class="toast-header">' +
                '<i class="bi bi-' + iconClass + ' me-2"></i>' +
                '<strong class="me-auto">Thông báo</strong>' +
'<button type="button" class="btn-close" onclick="hideToast(\'' + toastId + '\')"></button>' +
            '</div>' +
            '<div class="toast-body">' +
                message +
            '</div>' +
        '</div>';

    toastContainer.insertAdjacentHTML('beforeend', toastHTML);

    const toast = document.getElementById(toastId);
    setTimeout(() => toast.classList.add('show'), 100);
    setTimeout(() => hideToast(toastId), 4000);
}


        // Hide toast
        function hideToast(toastId) {
            const toast = document.getElementById(toastId);
            if (toast) {
                toast.classList.remove('show');
                setTimeout(() => toast.remove(), 300);
            }
        }

        // Enhanced interactions
        document.addEventListener('DOMContentLoaded', function() {
            // Add hover effects for product cards
            document.querySelectorAll('.product-card').forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-6px)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(-4px)';
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

            // Add ripple effect to buttons
            document.querySelectorAll('.btn').forEach(button => {
                button.addEventListener('click', function(e) {
                    if (!this.querySelector('.ripple')) {
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
                            z-index: 1;
                        `;
                        
                        ripple.classList.add('ripple');
                        this.style.position = 'relative';
                        this.style.overflow = 'hidden';
this.appendChild(ripple);
                        
                        setTimeout(() => ripple.remove(), 600);
                    }
                });
            });

            // Lazy loading for images
            if ('IntersectionObserver' in window) {
                const imageObserver = new IntersectionObserver((entries, observer) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            const img = entry.target;
                            // Already loaded, just observe for animations
                            img.style.opacity = '1';
                            imageObserver.unobserve(img);
                        }
                    });
                });

                document.querySelectorAll('.product-image').forEach(img => {
                    imageObserver.observe(img);
                });
            }

            // Add smooth transitions to wishlist hearts
            document.querySelectorAll('.wishlist-heart').forEach(heart => {
                heart.addEventListener('click', function() {
                    this.style.transform = 'scale(1.3)';
                    setTimeout(() => {
                        this.style.transform = 'scale(1)';
                    }, 200);
                });
            });

            // Initialize tooltips if Bootstrap is available
            if (typeof bootstrap !== 'undefined') {
                const tooltipTriggerList = [].slice.call(document.querySelectorAll('[title]'));
                tooltipTriggerList.map(function (tooltipTriggerEl) {
                    return new bootstrap.Tooltip(tooltipTriggerEl);
                });
            }
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

        // Performance optimization
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate');
                }
            });
        }, { threshold: 0.1 });

        document.querySelectorAll('.product-card').forEach(card => {
            observer.observe(card);
        });
    </script>
</body>
</html>

<jsp:include page="../../common/footer.jsp" />