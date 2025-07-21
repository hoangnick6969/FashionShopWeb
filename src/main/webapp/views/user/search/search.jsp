<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/views/common/header.jsp" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm kiếm: "${query}" - FashionShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
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
            --gray-400: #9ca3af;
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
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
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

        /* Search Container */
        .search-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }

        /* Search Header */
        .search-header {
            background: white;
            border-radius: var(--border-radius);
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-200);
            position: relative;
            overflow: hidden;
        }

        .search-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), #3b82f6);
        }

        .search-title {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .search-icon {
            width: 56px;
            height: 56px;
            background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            color: white;
            border-radius: var(--border-radius-sm);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .search-title h1 {
            font-size: 2rem;
            font-weight: 700;
            color: var(--gray-900);
            margin: 0;
            flex: 1;
        }

        .search-query {
            background: linear-gradient(135deg, var(--primary-light), #e0f2fe);
            color: var(--primary-dark);
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-weight: 600;
            display: inline-block;
        }

        .search-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
            margin-top: 1rem;
        }

        .search-results-count {
            color: var(--gray-600);
            font-size: 1rem;
        }

        .search-results-count strong {
            color: var(--primary-color);
            font-weight: 700;
        }

        /* Enhanced Search Bar */
        .enhanced-search {
            background: var(--gray-50);
            border-radius: var(--border-radius-sm);
            padding: 1rem;
            margin-top: 1rem;
            border: 2px solid transparent;
            transition: var(--transition);
        }

        .enhanced-search:focus-within {
            border-color: var(--primary-color);
            background: white;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        .search-input-group {
            display: flex;
            gap: 0.75rem;
            align-items: center;
        }

        .search-input-group input {
            flex: 1;
            border: none;
            background: transparent;
            padding: 0.75rem 0;
            font-size: 1rem;
            outline: none;
            color: var(--gray-800);
        }

        .search-input-group input::placeholder {
            color: var(--gray-400);
        }

        .search-btn {
            background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: var(--border-radius-sm);
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition);
            cursor: pointer;
        }
.search-btn:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
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
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, var(--gray-100), var(--gray-200));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            font-size: 2.5rem;
            color: var(--gray-400);
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

        .search-suggestions {
            display: flex;
            gap: 0.5rem;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 2rem;
        }

        .suggestion-tag {
            background: var(--gray-100);
            color: var(--gray-700);
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-size: 0.875rem;
            text-decoration: none;
            transition: var(--transition);
            border: 1px solid var(--gray-200);
        }

        .suggestion-tag:hover {
            background: var(--primary-color);
            color: white;
            text-decoration: none;
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }

        .btn-explore {
            background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            color: white;
            padding: 0.875rem 2rem;
            border-radius: var(--border-radius-sm);
            text-decoration: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            transition: var(--transition);
            border: none;
            box-shadow: var(--shadow-sm);
        }

        .btn-explore:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
            color: white;
            text-decoration: none;
        }

        /* Product Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        /* Product Card */
        .product-card {
            background: white;
border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-200);
            transition: var(--transition);
            position: relative;
            height: fit-content;
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-xl);
        }

        .product-image-container {
            position: relative;
            overflow: hidden;
            aspect-ratio: 4/3;
            background: var(--gray-50);
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

        .product-badge {
            position: absolute;
            top: 1rem;
            left: 1rem;
            background: linear-gradient(135deg, var(--danger-color), #ef4444);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 2rem;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .product-actions {
            position: absolute;
            top: 1rem;
            right: 1rem;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            opacity: 0;
            transform: translateX(100%);
            transition: var(--transition);
        }

        .product-card:hover .product-actions {
            opacity: 1;
            transform: translateX(0);
        }

        .product-action-btn {
            width: 44px;
            height: 44px;
            background: rgba(255, 255, 255, 0.95);
            border: 1px solid var(--gray-200);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--gray-700);
            text-decoration: none;
            transition: var(--transition);
            backdrop-filter: blur(10px);
        }

        .product-action-btn:hover {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
            transform: scale(1.1);
        }

        .product-info {
            padding: 1.5rem;
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
            text-decoration: none;
            color: inherit;
            transition: var(--transition);
        }

        .product-name a:hover {
color: var(--primary-color);
        }

        .product-price {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1rem;
        }

        .current-price {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--primary-color);
        }

        .original-price {
            font-size: 1rem;
            color: var(--gray-400);
            text-decoration: line-through;
        }

        .discount-badge {
            background: linear-gradient(135deg, var(--danger-color), #ef4444);
            color: white;
            padding: 0.25rem 0.5rem;
            border-radius: 0.25rem;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .product-rating {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .stars {
            display: flex;
            gap: 0.125rem;
        }

        .star {
            color: #fbbf24;
            font-size: 0.875rem;
        }

        .rating-text {
            color: var(--gray-600);
            font-size: 0.875rem;
        }

        .product-actions-bottom {
            display: flex;
            gap: 0.5rem;
            margin-top: 1rem;
        }

        .btn-add-cart {
            flex: 1;
            background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            color: white;
            border: none;
            padding: 0.75rem;
            border-radius: var(--border-radius-sm);
            font-weight: 600;
            font-size: 0.875rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            transition: var(--transition);
            cursor: pointer;
        }

        .btn-add-cart:hover {
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }

        .btn-quick-view {
            background: white;
            color: var(--gray-700);
            border: 1px solid var(--gray-300);
            padding: 0.75rem;
            border-radius: var(--border-radius-sm);
            font-weight: 600;
            font-size: 0.875rem;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: var(--transition);
            cursor: pointer;
        }

        .btn-quick-view:hover {
            background: var(--gray-50);
            border-color: var(--gray-400);
        }

        /* Loading Animation */
        .loading-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 400px;
        }

        .loading-spinner {
            width: 48px;
            height: 48px;
            border: 4px solid var(--gray-200);
            border-radius: 50%;
            border-top: 4px solid var(--primary-color);
animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .search-container {
                padding: 1rem 0.5rem;
            }

            .search-header {
                padding: 1.5rem;
                margin-bottom: 1.5rem;
            }

            .search-title {
                flex-direction: column;
                text-align: center;
                gap: 0.75rem;
            }

            .search-title h1 {
                font-size: 1.5rem;
            }

            .search-meta {
                flex-direction: column;
                align-items: stretch;
                text-align: center;
                gap: 0.75rem;
            }

            .search-input-group {
                flex-direction: column;
                gap: 0.75rem;
            }

            .search-btn {
                width: 100%;
                justify-content: center;
            }

            .products-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 1.5rem;
            }

            .product-actions {
                position: static;
                flex-direction: row;
                opacity: 1;
                transform: none;
                justify-content: center;
                margin-top: 1rem;
            }

            .empty-state {
                padding: 3rem 1rem;
            }

            .empty-state h3 {
                font-size: 1.5rem;
            }

            .search-suggestions {
                flex-direction: column;
                align-items: center;
            }

            .suggestion-tag {
                width: 100%;
                text-align: center;
                max-width: 200px;
            }
        }

        /* Accessibility */
        .product-card:focus-within,
        .btn-add-cart:focus,
        .btn-quick-view:focus,
        .search-btn:focus {
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
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Staggered animation for product cards */
        .product-card:nth-child(1) { animation-delay: 0.1s; }
        .product-card:nth-child(2) { animation-delay: 0.2s; }
        .product-card:nth-child(3) { animation-delay: 0.3s; }
        .product-card:nth-child(4) { animation-delay: 0.4s; }
        .product-card:nth-child(5) { animation-delay: 0.5s; }
        .product-card:nth-child(6) { animation-delay: 0.6s; }
.product-card:nth-child(7) { animation-delay: 0.7s; }
        .product-card:nth-child(8) { animation-delay: 0.8s; }
    </style>
</head>
<body>
    <div class="search-container">
        <!-- Search Header -->
        <div class="search-header">
            <div class="search-title">
                <div class="search-icon">
                    <i class="bi bi-search"></i>
                </div>
                <h1>Kết quả tìm kiếm cho: <span class="search-query">${query}</span></h1>
            </div>
            
            <div class="search-meta">
                <div class="search-results-count">
                    <c:choose>
                        <c:when test="${empty results}">
                            Không tìm thấy sản phẩm nào
                        </c:when>
                        <c:otherwise>
                            Tìm thấy <strong>${results.size()}</strong> sản phẩm phù hợp
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Enhanced Search Bar -->
            <div class="enhanced-search">
                <form action="${pageContext.request.contextPath}/search" method="get" class="search-input-group">
                    <i class="bi bi-search text-muted"></i>
                    <input type="text" 
                           name="q" 
                           value="${query}" 
                           placeholder="Tìm kiếm sản phẩm, thương hiệu, danh mục..."
                           aria-label="Tìm kiếm sản phẩm">
                    <button type="submit" class="search-btn">
                        <i class="bi bi-search"></i>
                        Tìm kiếm
                    </button>
                </form>
            </div>
        </div>

        <!-- Search Results Content -->
        <c:choose>
            <c:when test="${empty results}">
                <!-- Empty State -->
                <div class="empty-state">
                    <div class="empty-state-icon">
                        <i class="bi bi-search"></i>
                    </div>
                    <h3>Không tìm thấy kết quả</h3>
                    <p>Rất tiếc, chúng tôi không tìm thấy sản phẩm nào khớp với từ khóa "<strong>${query}</strong>". Hãy thử tìm kiếm với từ khóa khác hoặc khám phá các sản phẩm phổ biến bên dưới.</p>
                    
                    <!-- Search Suggestions -->
                    <div class="search-suggestions">
                        <a href="${pageContext.request.contextPath}/search?q=áo" class="suggestion-tag">Áo thời trang</a>
                        <a href="${pageContext.request.contextPath}/search?q=quần" class="suggestion-tag">Quần jean</a>
                        <a href="${pageContext.request.contextPath}/search?q=giày" class="suggestion-tag">Giày sneaker</a>
                        <a href="${pageContext.request.contextPath}/search?q=túi" class="suggestion-tag">Túi xách</a>
<a href="${pageContext.request.contextPath}/search?q=phụ kiện" class="suggestion-tag">Phụ kiện</a>
                    </div>

                    <a href="${pageContext.request.contextPath}/products" class="btn-explore">
                        <i class="bi bi-compass"></i>
                        Khám phá sản phẩm
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Products Grid -->
                <div class="products-grid">
                    <c:forEach var="p" items="${results}" varStatus="status">
                        <div class="product-card">
                            <!-- Product Image -->
                            <div class="product-image-container">
                                <a href="${pageContext.request.contextPath}/product-detail?id=${p.id}">
                                    <img src="${pageContext.request.contextPath}/${p.mainImage}" 
                                         alt="${p.name}"
                                         class="product-image"
                                         loading="lazy">
                                </a>

                                <!-- Product Badge -->
                                <c:if test="${p.discountPercent > 0}">
                                    <div class="product-badge">
                                        -${p.discountPercent}%
                                    </div>
                                </c:if>

                                <!-- Quick Actions -->
                                <div class="product-actions">
                                    <a href="#" class="product-action-btn" title="Yêu thích">
                                        <i class="bi bi-heart"></i>
                                    </a>
                                    <a href="#" class="product-action-btn" title="Xem nhanh">
                                        <i class="bi bi-eye"></i>
                                    </a>
                                    <a href="#" class="product-action-btn" title="So sánh">
                                        <i class="bi bi-arrow-left-right"></i>
                                    </a>
                                </div>
                            </div>

                            <!-- Product Info -->
                            <div class="product-info">
                                <h4 class="product-name">
                                    <a href="${pageContext.request.contextPath}/product-detail?id=${p.id}">
                                        ${p.name}
                                    </a>
                                </h4>

                                <!-- Product Price -->
                                <div class="product-price">
                                    <span class="current-price">
<fmt:formatNumber value="${p.price}" type="currency" currencySymbol="" maxFractionDigits="0"/>₫
                                    </span>
                                    <c:if test="${p.originalPrice > p.price}">
                                        <span class="original-price">
                                            <fmt:formatNumber value="${p.originalPrice}" type="currency" currencySymbol="" maxFractionDigits="0"/>₫
                                        </span>
                                        <span class="discount-badge">
                                            -<fmt:formatNumber value="${((p.originalPrice - p.price) / p.originalPrice) * 100}" pattern="0"/>%
                                        </span>
                                    </c:if>
                                </div>

                                <!-- Product Rating -->
                                <div class="product-rating">
                                    <div class="stars">
                                        <c:forEach begin="1" end="5" var="i">
                                            <i class="bi bi-star-fill star"></i>
                                        </c:forEach>
                                    </div>
                                    <span class="rating-text">(4.8) 127 đánh giá</span>
                                </div>

                                <!-- Action Buttons -->
                                <div class="product-actions-bottom">
                                    <button class="btn-add-cart" onclick="addToCart(${p.id})">
                                        <i class="bi bi-cart-plus"></i>
                                        Thêm vào giỏ
                                    </button>
                                    <button class="btn-quick-view" onclick="quickView(${p.id})">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Enhanced search functionality
        document.addEventListener('DOMContentLoaded', function() {
            // Auto-focus on search input for better UX
            const searchInput = document.querySelector('input[name="q"]');
            if (searchInput && searchInput.value === '') {
                setTimeout(() => searchInput.focus(), 300);
            }

            // Enhanced product card interactions
            const productCards = document.querySelectorAll('.product-card');
            productCards.forEach(card => {
                // Add subtle hover effects
card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-6px)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(-4px)';
                });

                // Add keyboard navigation
                card.addEventListener('keydown', function(e) {
                    if (e.key === 'Enter') {
                        const link = this.querySelector('.product-name a');
                        if (link) link.click();
                    }
                });
            });

            // Search form enhancements
            const searchForm = document.querySelector('.search-input-group');
            if (searchForm) {
                searchForm.addEventListener('submit', function(e) {
                    const input = this.querySelector('input[name="q"]');
                    if (input.value.trim() === '') {
                        e.preventDefault();
                        input.focus();
                        showNotification('Vui lòng nhập từ khóa tìm kiếm', 'warning');
                    } else {
                        // Show loading state
                        const submitBtn = this.querySelector('.search-btn');
                        const originalHTML = submitBtn.innerHTML;
                        submitBtn.innerHTML = '<i class="bi bi-arrow-clockwise spin-animation"></i> Đang tìm...';
                        submitBtn.disabled = true;

                        // Re-enable after delay (form will submit)
                        setTimeout(() => {
                            submitBtn.innerHTML = originalHTML;
                            submitBtn.disabled = false;
                        }, 2000);
                    }
                });
            }

            // Add search suggestions click tracking
            document.querySelectorAll('.suggestion-tag').forEach(tag => {
                tag.addEventListener('click', function(e) {
                    // Add loading state to clicked suggestion
                    this.style.background = 'var(--primary-color)';
                    this.style.color = 'white';
                    this.innerHTML = '<i class="bi bi-arrow-clockwise"></i> ' + this.textContent.trim();
                });
            });
        });

        // Product interaction functions
        function addToCart(productId) {
            // Show loading state
            event.target.innerHTML = '<i class="bi bi-arrow-clockwise spin-animation"></i> Đang thêm...';
            event.target.disabled = true;

            // Simulate API call
            setTimeout(() => {
                // Reset button
                event.target.innerHTML = '<i class="bi bi-cart-plus"></i> Thêm vào giỏ';
                event.target.disabled = false;
                
                // Show success notification
showNotification('Đã thêm sản phẩm vào giỏ hàng!', 'success');
            }, 1000);
        }

        function quickView(productId) {
            showNotification('Tính năng xem nhanh đang được phát triển!', 'info');
        }

        // Notification system
        function showNotification(message, type) {
    type = type || 'info';

    var iconClass = type === 'success' 
        ? 'check-circle' 
        : (type === 'warning' ? 'exclamation-triangle' : 'info-circle');

    var notification = document.createElement('div');
    notification.className = 'alert alert-' + type;
    notification.style.position = 'fixed';
    notification.style.top = '20px';
    notification.style.right = '20px';
    notification.style.zIndex = '9999';
    notification.style.minWidth = '300px';
    notification.style.animation = 'slideInRight 0.3s ease-out';

    notification.innerHTML = '<div class="d-flex align-items-center">' +
        '<i class="bi bi-' + iconClass + ' me-2"></i>' +
        message +
        '<button type="button" class="btn-close ms-2" onclick="this.parentElement.parentElement.remove()"></button>' +
        '</div>';

    document.body.appendChild(notification);

    setTimeout(function () {
        notification.style.animation = 'slideOutRight 0.3s ease-out';
        setTimeout(function () {
            notification.remove();
        }, 300);
    }, 3000);
}


        // Add CSS animations
        const style = document.createElement('style');
        style.textContent = `
            .spin-animation {
                animation: spin 1s linear infinite;
            }
            
            @keyframes slideInRight {
                from {
                    transform: translateX(100%);
                    opacity: 0;
                }
                to {
                    transform: translateX(0);
                    opacity: 1;
                }
            }
            
            @keyframes slideOutRight {
                from {
                    transform: translateX(0);
                    opacity: 1;
                }
                to {
                    transform: translateX(100%);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);

        // Performance optimization - lazy load images
        if ('IntersectionObserver' in window) {
            const imageObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        img.src = img.dataset.src || img.src;
                        img.classList.remove('lazy');
                        imageObserver.unobserve(img);
                    }
                });
            });

            document.querySelectorAll('.product-image').forEach(img => {
                imageObserver.observe(img);
            });
        }
    </script>
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />