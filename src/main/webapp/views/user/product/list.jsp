<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../../common/header.jsp" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${category.name} - Danh mục sản phẩm | FashionShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #2563eb;
            --primary-dark: #1d4ed8;
            --primary-light: #dbeafe;
            --secondary-color: #64748b;
            --accent-color: #0ea5e9;
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --error-color: #ef4444;
            --gray-50: #f8fafc;
            --gray-100: #f1f5f9;
            --gray-200: #e2e8f0;
            --gray-300: #cbd5e1;
            --gray-400: #94a3b8;
            --gray-500: #64748b;
            --gray-600: #475569;
            --gray-700: #334155;
            --gray-800: #1e293b;
            --gray-900: #0f172a;
            --white: #ffffff;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            --border-radius: 0.75rem;
            --border-radius-sm: 0.5rem;
            --border-radius-lg: 1rem;
            --transition-fast: all 0.15s cubic-bezier(0.4, 0, 0.2, 1);
            --transition-normal: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            --transition-slow: all 0.35s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, var(--gray-50) 0%, var(--gray-100) 100%);
            min-height: 100vh;
            line-height: 1.6;
            color: var(--gray-800);
            scroll-behavior: smooth;
        }

        /* Main Container */
        .product-list-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }

        /* Page Header */
        .page-header {
            background: var(--white);
            border-radius: var(--border-radius-lg);
            padding: 2.5rem;
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
            height: 5px;
            background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        }

        .category-info {
            display: flex;
            align-items: center;
            gap: 1.5rem;
            margin-bottom: 1rem;
        }

        .category-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border-radius: var(--border-radius);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--white);
            font-size: 1.75rem;
            box-shadow: var(--shadow-md);
        }

        .category-title {
            flex: 1;
        }

        .category-title h1 {
            font-size: 2.25rem;
            font-weight: 800;
            color: var(--gray-900);
            margin-bottom: 0.5rem;
            line-height: 1.2;
        }

        .category-subtitle {
            font-size: 1.125rem;
            color: var(--gray-600);
            font-weight: 500;
        }

        .product-count {
            background: var(--primary-light);
            color: var(--primary-dark);
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-size: 0.875rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Controls Bar */
        .controls-bar {
            background: var(--white);
            border-radius: var(--border-radius);
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-200);
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .view-toggles {
            display: flex;
            background: var(--gray-100);
            border-radius: var(--border-radius-sm);
            padding: 0.25rem;
            gap: 0.25rem;
        }

        .view-toggle {
            padding: 0.5rem 1rem;
            border: none;
            background: none;
            border-radius: var(--border-radius-sm);
            cursor: pointer;
            transition: var(--transition-fast);
            color: var(--gray-600);
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .view-toggle.active {
            background: var(--white);
            color: var(--primary-color);
            box-shadow: var(--shadow-sm);
        }
.sort-dropdown {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .sort-dropdown label {
            font-weight: 600;
            color: var(--gray-700);
            white-space: nowrap;
        }

        .sort-select {
            padding: 0.5rem 1rem;
            border: 1px solid var(--gray-300);
            border-radius: var(--border-radius-sm);
            background: var(--white);
            color: var(--gray-700);
            font-size: 0.875rem;
            transition: var(--transition-fast);
            min-width: 150px;
        }

        .sort-select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        /* Product Grid */
        .products-grid {
            display: grid;
            gap: 1.5rem;
            margin-bottom: 3rem;
            transition: var(--transition-normal);
        }

        .products-grid.grid-view {
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        }

        .products-grid.list-view {
            grid-template-columns: 1fr;
        }

        /* Product Card */
        .product-card {
            background: var(--white);
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-200);
            transition: var(--transition-normal);
            position: relative;
            height: fit-content;
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-xl);
            border-color: var(--primary-color);
        }

        .product-image-container {
            position: relative;
            overflow: hidden;
            aspect-ratio: 1;
            background: var(--gray-100);
        }

        .list-view .product-image-container {
            aspect-ratio: 16/9;
            max-width: 300px;
        }

        .product-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: var(--transition-slow);
        }

        .product-card:hover .product-image {
            transform: scale(1.05);
        }

        .product-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(to bottom, transparent 0%, rgba(0,0,0,0.3) 100%);
            opacity: 0;
            transition: var(--transition-normal);
        }

        .product-card:hover .product-overlay {
            opacity: 1;
        }

        .product-actions {
            position: absolute;
            top: 1rem;
            right: 1rem;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            opacity: 0;
            transform: translateX(10px);
transition: var(--transition-normal);
        }

        .product-card:hover .product-actions {
            opacity: 1;
            transform: translateX(0);
        }

        .action-btn {
            width: 40px;
            height: 40px;
            background: var(--white);
            border: none;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: var(--transition-fast);
            box-shadow: var(--shadow-md);
            color: var(--gray-600);
        }

        .action-btn:hover {
            background: var(--primary-color);
            color: var(--white);
            transform: scale(1.1);
        }

        .product-info {
            padding: 1.5rem;
        }

        .list-view .product-card {
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }

        .list-view .product-info {
            flex: 1;
            padding: 1rem;
        }

        .product-category {
            font-size: 0.75rem;
            color: var(--gray-500);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .product-name {
            font-size: 1.125rem;
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: 0.75rem;
            line-height: 1.4;
            transition: var(--transition-fast);
        }

        .product-card:hover .product-name {
            color: var(--primary-color);
        }

        .product-price {
            display: flex;
            align-items: baseline;
            gap: 0.75rem;
            margin-bottom: 1rem;
        }

        .current-price {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--primary-color);
        }

        .original-price {
            font-size: 0.875rem;
            color: var(--gray-500);
            text-decoration: line-through;
        }

        .price-badge {
            background: var(--error-color);
            color: var(--white);
            padding: 0.25rem 0.5rem;
            border-radius: 0.25rem;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .product-meta {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1rem;
            font-size: 0.875rem;
            color: var(--gray-600);
        }

        .rating {
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .stars {
            display: flex;
            gap: 1px;
        }

        .star {
            color: var(--warning-color);
        }

        .star.empty {
            color: var(--gray-300);
        }

        .rating-count {
            margin-left: 0.25rem;
        }

        .product-cta {
display: flex;
            gap: 0.75rem;
            align-items: center;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: var(--white);
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: var(--border-radius-sm);
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition-fast);
            cursor: pointer;
            flex: 1;
            justify-content: center;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
            color: var(--white);
            text-decoration: none;
        }

        .btn-secondary {
            background: var(--white);
            color: var(--gray-700);
            border: 1px solid var(--gray-300);
            padding: 0.75rem 1rem;
            border-radius: var(--border-radius-sm);
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition-fast);
            cursor: pointer;
        }

        .btn-secondary:hover {
            background: var(--gray-50);
            border-color: var(--gray-400);
            color: var(--gray-700);
            text-decoration: none;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            background: var(--white);
            border-radius: var(--border-radius-lg);
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-200);
        }

        .empty-state-icon {
            width: 120px;
            height: 120px;
            margin: 0 auto 2rem;
            background: linear-gradient(135deg, var(--gray-100), var(--gray-200));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            color: var(--gray-400);
        }

        .empty-state h3 {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--gray-900);
            margin-bottom: 1rem;
        }

        .empty-state p {
            font-size: 1.125rem;
            color: var(--gray-600);
            margin-bottom: 2rem;
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
        }

        .btn-explore {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: var(--white);
            padding: 1rem 2rem;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
gap: 0.75rem;
            transition: var(--transition-normal);
            font-size: 1.125rem;
        }

        .btn-explore:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-xl);
            color: var(--white);
            text-decoration: none;
        }

        /* Loading Animation */
        .loading {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 3rem;
        }

        .spinner {
            width: 40px;
            height: 40px;
            border: 4px solid var(--gray-200);
            border-top: 4px solid var(--primary-color);
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .products-grid.grid-view {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            }
        }

        @media (max-width: 768px) {
            .product-list-container {
                padding: 1rem 0.5rem;
            }

            .page-header {
                padding: 1.5rem;
                margin-bottom: 1.5rem;
            }

            .category-info {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            .category-title h1 {
                font-size: 1.75rem;
            }

            .controls-bar {
                flex-direction: column;
                align-items: stretch;
                gap: 1rem;
            }

            .view-toggles {
                justify-content: center;
            }

            .products-grid.grid-view {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            }

            .list-view .product-card {
                flex-direction: column;
            }

            .list-view .product-image-container {
                aspect-ratio: 1;
                max-width: none;
                width: 100%;
            }

            .product-cta {
                flex-direction: column;
            }
        }

        @media (max-width: 640px) {
            .products-grid.grid-view {
                grid-template-columns: 1fr;
            }

            .category-title h1 {
                font-size: 1.5rem;
            }

            .product-info {
                padding: 1rem;
            }
        }

        /* Animation */
        .product-card {
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

        /* Staggered animation delay */
.product-card:nth-child(1) { animation-delay: 0.1s; }
        .product-card:nth-child(2) { animation-delay: 0.2s; }
        .product-card:nth-child(3) { animation-delay: 0.3s; }
        .product-card:nth-child(4) { animation-delay: 0.4s; }
        .product-card:nth-child(5) { animation-delay: 0.5s; }
        .product-card:nth-child(6) { animation-delay: 0.6s; }

        /* Accessibility */
        .product-card:focus-within {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        .btn-primary:focus,
        .btn-secondary:focus,
        .action-btn:focus {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        /* Print styles */
        @media print {
            .controls-bar,
            .product-actions {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="product-list-container">
        <!-- Page Header -->
        <div class="page-header">
            <div class="category-info">
                <div class="category-icon">
                    <i class="bi bi-grid"></i>
                </div>
                <div class="category-title">
                    <h1>${category.name}</h1>
                    <p class="category-subtitle">Khám phá bộ sưu tập đặc biệt dành cho bạn</p>
                </div>
                <c:if test="${not empty products}">
                    <div class="product-count">
                        <i class="bi bi-box"></i>
                        ${products.size()} sản phẩm
                    </div>
                </c:if>
            </div>
        </div>

        <!-- Controls Bar -->
        <c:if test="${not empty products}">
            <div class="controls-bar">
                <div class="view-toggles">
                    <button class="view-toggle active" onclick="switchView('grid')" data-view="grid">
                        <i class="bi bi-grid-3x3-gap"></i>
                        Lưới
                    </button>
                    <button class="view-toggle" onclick="switchView('list')" data-view="list">
                        <i class="bi bi-list"></i>
                        Danh sách
                    </button>
                </div>
                
                <div class="sort-dropdown">
                    <label for="sortSelect">Sắp xếp theo:</label>
                    <select class="sort-select" id="sortSelect" onchange="sortProducts()">
                        <option value="default">Mặc định</option>
                        <option value="name-asc">Tên A-Z</option>
                        <option value="name-desc">Tên Z-A</option>
                        <option value="price-asc">Giá thấp đến cao</option>
                        <option value="price-desc">Giá cao đến thấp</option>
                    </select>
                </div>
            </div>
        </c:if>

        <!-- Products Content -->
        <c:choose>
<c:when test="${empty products}">
                <!-- Empty State -->
                <div class="empty-state">
                    <div class="empty-state-icon">
                        <i class="bi bi-box2"></i>
                    </div>
                    <h3>Không có sản phẩm nào</h3>
                    <p>Hiện tại danh mục này chưa có sản phẩm nào. Hãy quay lại sau hoặc khám phá các danh mục khác!</p>
                    <a href="${pageContext.request.contextPath}/home" class="btn-explore">
                        <i class="bi bi-arrow-left"></i>
                        Khám phá thêm
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Products Grid -->
                <div class="products-grid grid-view" id="productsGrid">
                    <c:forEach var="p" items="${products}" varStatus="status">
                        <div class="product-card" data-name="${p.name}" data-price="${p.price}">
                            <div class="product-image-container">
                                <a href="${pageContext.request.contextPath}/product-detail?id=${p.id}">
                                    <img src="${pageContext.request.contextPath}/${p.mainImage}" 
                                         alt="${p.name}" 
                                         class="product-image"
                                         onerror="this.src='${pageContext.request.contextPath}/images/default.jpg'" />
                                </a>
                                <div class="product-overlay"></div>
                                <div class="product-actions">
                                    <button class="action-btn" title="Yêu thích" onclick="toggleWishlist(${p.id})">
                                        <i class="bi bi-heart"></i>
                                    </button>
                                    <button class="action-btn" title="Xem nhanh" onclick="quickView(${p.id})">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                    <button class="action-btn" title="So sánh" onclick="addToCompare(${p.id})">
                                        <i class="bi bi-arrow-left-right"></i>
                                    </button>
                                </div>
                            </div>
                            
                            <div class="product-info">
                                <div class="product-category">${category.name}</div>
                                
                                <h4 class="product-name">
                                    <a href="${pageContext.request.contextPath}/product-detail?id=${p.id}" style="text-decoration: none; color: inherit;">
                                        ${p.name}
                                    </a>
                                </h4>
<div class="product-price">
                                    <span class="current-price">
                                        <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="" />₫
                                    </span>
                                    <!-- Add original price and discount if available -->
                                    <c:if test="${p.originalPrice != null && p.originalPrice > p.price}">
                                        <span class="original-price">
                                            <fmt:formatNumber value="${p.originalPrice}" type="currency" currencySymbol="" />₫
                                        </span>
                                        <span class="price-badge">
                                            -<fmt:formatNumber value="${((p.originalPrice - p.price) / p.originalPrice) * 100}" maxFractionDigits="0"/>%
                                        </span>
                                    </c:if>
                                </div>
                                
                                <div class="product-meta">
                                    <div class="rating">
                                        <div class="stars">
                                            <c:forEach begin="1" end="5" var="i">
                                                <i class="bi bi-star-fill star ${i <= 4 ? '' : 'empty'}"></i>
                                            </c:forEach>
                                        </div>
                                        <span class="rating-count">(4.0)</span>
                                    </div>
                                    <span class="availability">
                                        <i class="bi bi-check-circle"></i>
                                        Còn hàng
                                    </span>
                                </div>
                                
                                <div class="product-cta">
                                    <a href="${pageContext.request.contextPath}/product-detail?id=${p.id}" class="btn-primary">
                                        <i class="bi bi-eye"></i>
                                        Xem chi tiết
                                    </a>
                                    <button class="btn-secondary" onclick="addToCart(${p.id})" title="Thêm vào giỏ">
                                        <i class="bi bi-bag-plus"></i>
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
        // View switching functionality
function switchView(viewType) {
            const grid = document.getElementById('productsGrid');
            const toggles = document.querySelectorAll('.view-toggle');
            
            // Update grid class
            grid.className = `products-grid ${viewType}-view`;
            
            // Update active toggle
            toggles.forEach(toggle => {
                toggle.classList.remove('active');
                if (toggle.dataset.view === viewType) {
                    toggle.classList.add('active');
                }
            });
            
            // Save preference
            localStorage.setItem('preferredView', viewType);
        }

        // Sort products functionality
        function sortProducts() {
            const select = document.getElementById('sortSelect');
            const grid = document.getElementById('productsGrid');
            const cards = Array.from(grid.querySelectorAll('.product-card'));
            
            const sortValue = select.value;
            
            cards.sort((a, b) => {
                switch (sortValue) {
                    case 'name-asc':
                        return a.dataset.name.localeCompare(b.dataset.name);
                    case 'name-desc':
                        return b.dataset.name.localeCompare(a.dataset.name);
                    case 'price-asc':
                        return parseFloat(a.dataset.price) - parseFloat(b.dataset.price);
                    case 'price-desc':
                        return parseFloat(b.dataset.price) - parseFloat(a.dataset.price);
                    default:
                        return 0;
                }
            });
            
            // Re-append sorted cards
            cards.forEach(card => grid.appendChild(card));
            
            // Add animation
            cards.forEach((card, index) => {
                card.style.animation = 'none';
                setTimeout(() => {
                    card.style.animation = `fadeInUp 0.4s ease-out ${index * 0.1}s both`;
                }, 10);
            });
        }

        // Wishlist functionality
        function toggleWishlist(productId) {
            const btn = event.target.closest('.action-btn');
            const icon = btn.querySelector('i');
            
            // Toggle visual state
            if (icon.classList.contains('bi-heart')) {
                icon.className = 'bi bi-heart-fill';
                btn.style.backgroundColor = 'var(--error-color)';
                btn.style.color = 'white';
                showToast('Đã thêm vào danh sách yêu thích!', 'success');
            } else {
                icon.className = 'bi bi-heart';
                btn.style.backgroundColor = '';
                btn.style.color = '';
                showToast('Đã xóa khỏi danh sách yêu thích!', 'info');
            }
            
            // Here you would make an AJAX call to update the server
// updateWishlist(productId, isAdded);
        }

        // Quick view functionality
        function quickView(productId) {
            showToast('Chức năng xem nhanh đang phát triển!', 'info');
            // Here you would open a modal with product quick view
        }

        // Compare functionality
        function addToCompare(productId) {
            showToast('Đã thêm vào danh sách so sánh!', 'success');
            // Here you would add to compare functionality
        }

        // Add to cart functionality
        function addToCart(productId) {
            showToast('Đang thêm vào giỏ hàng...', 'info');
            
            // Simulate API call
            setTimeout(() => {
                showToast('Đã thêm vào giỏ hàng thành công!', 'success');
            }, 1000);
            
            // Here you would make an AJAX call to add to cart
        }

        // Toast notification system
        function showToast(message, type = 'info') {
            const toast = document.createElement('div');
            toast.className = `toast toast-${type}`;
            toast.innerHTML = `
                <div class="toast-content">
                    <i class="bi bi-${getToastIcon(type)}"></i>
                    <span>${message}</span>
                </div>
            `;
            
            // Toast styles
            Object.assign(toast.style, {
                position: 'fixed',
                top: '20px',
                right: '20px',
                background: getToastColor(type),
                color: 'white',
                padding: '1rem 1.5rem',
                borderRadius: 'var(--border-radius)',
                boxShadow: 'var(--shadow-lg)',
                zIndex: '9999',
                transform: 'translateX(100%)',
                transition: 'transform 0.3s ease'
            });
            
            document.body.appendChild(toast);
            
            // Animate in
            setTimeout(() => {
                toast.style.transform = 'translateX(0)';
            }, 10);
            
            // Remove after delay
            setTimeout(() => {
                toast.style.transform = 'translateX(100%)';
                setTimeout(() => {
                    document.body.removeChild(toast);
                }, 300);
            }, 3000);
        }

        function getToastIcon(type) {
            switch (type) {
                case 'success': return 'check-circle';
                case 'error': return 'x-circle';
                case 'warning': return 'exclamation-triangle';
                default: return 'info-circle';
            }
        }

        function getToastColor(type) {
            switch (type) {
                case 'success': return 'var(--success-color)';
                case 'error': return 'var(--error-color)';
                case 'warning': return 'var(--warning-color)';
                default: return 'var(--primary-color)';
            }
        }
// Initialize page
        document.addEventListener('DOMContentLoaded', function() {
            // Restore preferred view
            const preferredView = localStorage.getItem('preferredView') || 'grid';
            switchView(preferredView);
            
            // Add loading animation to images
            const images = document.querySelectorAll('.product-image');
            images.forEach(img => {
                img.addEventListener('load', function() {
                    this.style.opacity = '1';
                });
                
                // Set initial opacity
                img.style.opacity = '0';
                img.style.transition = 'opacity 0.3s ease';
            });
            
            // Add keyboard navigation
            document.addEventListener('keydown', function(e) {
                if (e.key === 'g') {
                    switchView('grid');
                } else if (e.key === 'l') {
                    switchView('list');
                }
            });
            
            // Add scroll animations
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };
            
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                    }
                });
            }, observerOptions);
            
            // Observe product cards
            document.querySelectorAll('.product-card').forEach(card => {
                observer.observe(card);
            });
        });

        // Add ripple effect to buttons
        document.addEventListener('click', function(e) {
            if (e.target.matches('.btn-primary, .btn-secondary, .action-btn')) {
                createRipple(e, e.target);
            }
        });

        function createRipple(event, button) {
            const ripple = document.createElement('span');
            const rect = button.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            const x = event.clientX - rect.left - size / 2;
            const y = event.clientY - rect.top - size / 2;
            
            ripple.style.cssText = `
                position: absolute;
                width: ${size}px;
                height: ${size}px;
                left: ${x}px;
                top: ${y}px;
                background: rgba(255,255,255,0.4);
                border-radius: 50%;
                transform: scale(0);
                animation: ripple-animation 0.6s linear;
                pointer-events: none;
            `;
            
            button.style.position = 'relative';
            button.style.overflow = 'hidden';
            button.appendChild(ripple);
setTimeout(() => {
                if (ripple.parentNode) {
                    ripple.parentNode.removeChild(ripple);
                }
            }, 600);
        }

        // CSS for ripple animation
        const rippleStyle = document.createElement('style');
        rippleStyle.textContent = `
            @keyframes ripple-animation {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }
            
            .toast-content {
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }
        `;
        document.head.appendChild(rippleStyle);
    </script>
</body>
</html>

<jsp:include page="../../common/footer.jsp" />