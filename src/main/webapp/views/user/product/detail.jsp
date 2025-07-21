<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../common/header.jsp" />

<style>
    :root {
        --primary-color: #2563eb;
        --primary-dark: #1d4ed8;
        --primary-light: #dbeafe;
        --secondary-color: #64748b;
        --accent-color: #f59e0b;
        --success-color: #10b981;
        --warning-color: #f59e0b;
        --danger-color: #ef4444;
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
        --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        --border-radius: 12px;
        --border-radius-lg: 16px;
        --border-radius-xl: 24px;
        --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        --gradient-primary: linear-gradient(135deg, var(--primary-color), #3b82f6);
        --gradient-success: linear-gradient(135deg, var(--success-color), #059669);
    }

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
        color: var(--gray-900);
        line-height: 1.6;
    }

    .product-detail-container {
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

    .breadcrumb {
        background: var(--white);
        padding: 1rem 1.5rem;
        border-radius: var(--border-radius);
        margin-bottom: 2rem;
        box-shadow: var(--shadow-sm);
        border: 1px solid var(--gray-200);
    }

    .breadcrumb-list {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        list-style: none;
        font-size: 0.9rem;
        color: var(--gray-600);
    }

    .breadcrumb-item a {
        color: var(--primary-color);
        text-decoration: none;
        transition: var(--transition);
    }

    .breadcrumb-item a:hover {
        color: var(--primary-dark);
        text-decoration: underline;
    }

    .breadcrumb-separator {
        color: var(--gray-400);
    }

    .product-detail {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 3rem;
        background: var(--white);
        border-radius: var(--border-radius-lg);
padding: 2.5rem;
        box-shadow: var(--shadow-lg);
        border: 1px solid var(--gray-200);
        margin-bottom: 3rem;
    }

    .product-gallery {
        position: relative;
    }

    .main-image-container {
        position: relative;
        border-radius: var(--border-radius-lg);
        overflow: hidden;
        background: var(--gray-50);
        border: 2px solid var(--gray-200);
        transition: var(--transition);
        box-shadow: var(--shadow-md);
        aspect-ratio: 1;
        margin-bottom: 1.5rem;
    }

    .main-image-container:hover {
        transform: scale(1.02);
        box-shadow: var(--shadow-xl);
    }

    .main-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: var(--transition);
    }

    .image-zoom-indicator {
        position: absolute;
        top: 1rem;
        right: 1rem;
        background: rgba(0, 0, 0, 0.7);
        color: var(--white);
        padding: 0.5rem;
        border-radius: 50%;
        font-size: 1.2rem;
        opacity: 0;
        transition: var(--transition);
    }

    .main-image-container:hover .image-zoom-indicator {
        opacity: 1;
    }

    .thumbnail-gallery {
        display: flex;
        gap: 1rem;
        overflow-x: auto;
        padding: 0.5rem 0;
    }

    .thumbnail {
        width: 80px;
        height: 80px;
        border-radius: var(--border-radius);
        overflow: hidden;
        border: 2px solid var(--gray-300);
        cursor: pointer;
        transition: var(--transition);
        flex-shrink: 0;
    }

    .thumbnail:hover,
    .thumbnail.active {
        border-color: var(--primary-color);
        transform: scale(1.05);
    }

    .thumbnail img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .product-info {
        display: flex;
        flex-direction: column;
        gap: 1.5rem;
    }

    .product-title {
        font-size: 2.25rem;
        font-weight: 700;
        color: var(--gray-900);
        line-height: 1.2;
        margin-bottom: 0.5rem;
    }

    .product-rating {
        display: flex;
        align-items: center;
        gap: 1rem;
        margin-bottom: 1rem;
    }

    .stars {
        display: flex;
        gap: 0.25rem;
    }

    .star {
        color: var(--accent-color);
        font-size: 1.2rem;
    }

    .rating-text {
        color: var(--gray-600);
        font-size: 0.9rem;
    }

    .product-price {
        display: flex;
        align-items: center;
        gap: 1rem;
        margin-bottom: 1.5rem;
    }

    .price-current {
        font-size: 2.5rem;
        font-weight: 700;
        color: var(--success-color);
    }

    .price-currency {
        font-size: 1.25rem;
        color: var(--gray-600);
        font-weight: 500;
    }

    .product-description {
        color: var(--gray-700);
        font-size: 1.1rem;
        line-height: 1.7;
        padding: 1.5rem;
        background: var(--gray-50);
border-radius: var(--border-radius);
        border-left: 4px solid var(--primary-color);
        margin-bottom: 2rem;
    }

    .product-actions {
        display: flex;
        flex-direction: column;
        gap: 1.5rem;
        padding: 2rem;
        background: var(--gray-50);
        border-radius: var(--border-radius-lg);
        border: 1px solid var(--gray-200);
    }

    .quantity-section {
        display: flex;
        flex-direction: column;
        gap: 0.75rem;
    }

    .quantity-label {
        font-weight: 600;
        color: var(--gray-700);
        font-size: 1rem;
    }

    .quantity-controls {
        display: flex;
        align-items: center;
        gap: 0;
        width: fit-content;
        border: 2px solid var(--gray-300);
        border-radius: var(--border-radius);
        overflow: hidden;
        background: var(--white);
    }

    .quantity-btn {
        width: 48px;
        height: 48px;
        border: none;
        background: var(--white);
        color: var(--gray-700);
        font-size: 1.25rem;
        font-weight: 600;
        cursor: pointer;
        transition: var(--transition);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .quantity-btn:hover {
        background: var(--primary-color);
        color: var(--white);
    }

    .quantity-input {
        width: 80px;
        height: 48px;
        border: none;
        border-left: 1px solid var(--gray-300);
        border-right: 1px solid var(--gray-300);
        text-align: center;
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--gray-900);
        background: var(--white);
        outline: none;
    }

    .action-buttons {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }

    .btn {
        padding: 1rem 2rem;
        border: none;
        border-radius: var(--border-radius);
        font-weight: 600;
        font-size: 1.1rem;
        cursor: pointer;
        transition: var(--transition);
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.75rem;
        text-decoration: none;
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
        background: var(--gradient-primary);
        color: var(--white);
        box-shadow: var(--shadow-md);
    }

    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: var(--shadow-lg);
        text-decoration: none;
        color: var(--white);
    }

    .btn-secondary {
        background: var(--white);
        color: var(--gray-700);
border: 2px solid var(--gray-300);
    }

    .btn-secondary:hover {
        border-color: var(--primary-color);
        color: var(--primary-color);
        transform: translateY(-2px);
        box-shadow: var(--shadow-md);
        text-decoration: none;
    }

    .btn-icon {
        font-size: 1.25rem;
    }

    .product-features {
        background: var(--white);
        border-radius: var(--border-radius-lg);
        padding: 2rem;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--gray-200);
        margin-bottom: 3rem;
    }

    .features-title {
        font-size: 1.5rem;
        font-weight: 700;
        color: var(--gray-900);
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .features-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 1.5rem;
    }

    .feature-item {
        display: flex;
        align-items: center;
        gap: 1rem;
        padding: 1rem;
        background: var(--gray-50);
        border-radius: var(--border-radius);
        border: 1px solid var(--gray-200);
        transition: var(--transition);
    }

    .feature-item:hover {
        transform: translateY(-2px);
        box-shadow: var(--shadow-md);
    }

    .feature-icon {
        width: 48px;
        height: 48px;
        background: var(--primary-light);
        color: var(--primary-color);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.25rem;
        flex-shrink: 0;
    }

    .feature-content h4 {
        font-weight: 600;
        color: var(--gray-900);
        margin-bottom: 0.25rem;
    }

    .feature-content p {
        color: var(--gray-600);
        font-size: 0.9rem;
    }

    .reviews-section {
        background: var(--white);
        border-radius: var(--border-radius-lg);
        padding: 2rem;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--gray-200);
    }

    .reviews-header {
        display: flex;
        justify-content: between;
        align-items: center;
        margin-bottom: 2rem;
        flex-wrap: wrap;
        gap: 1rem;
    }

    .reviews-title {
        font-size: 1.5rem;
        font-weight: 700;
        color: var(--gray-900);
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .alert {
        padding: 1rem 1.5rem;
        border-radius: var(--border-radius);
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        gap: 0.75rem;
        font-weight: 500;
    }

    .alert-success {
        background: #ecfdf5;
        color: #065f46;
        border: 1px solid #a7f3d0;
    }

    .alert-error {
        background: #fef2f2;
        color: #991b1b;
        border: 1px solid #fecaca;
    }

    .alert-icon {
        font-size: 1.25rem;
    }

    .review-list {
display: flex;
        flex-direction: column;
        gap: 1.5rem;
    }

    .review-item {
        padding: 1.5rem;
        background: var(--gray-50);
        border-radius: var(--border-radius);
        border: 1px solid var(--gray-200);
        transition: var(--transition);
    }

    .review-item:hover {
        transform: translateY(-1px);
        box-shadow: var(--shadow-md);
    }

    .review-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 1rem;
    }

    .reviewer-info {
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .reviewer-avatar {
        width: 48px;
        height: 48px;
        background: var(--primary-light);
        color: var(--primary-color);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 600;
        font-size: 1.25rem;
    }

    .reviewer-name {
        font-weight: 600;
        color: var(--gray-900);
    }

    .review-stars {
        display: flex;
        gap: 0.25rem;
    }

    .review-comment {
        color: var(--gray-700);
        line-height: 1.6;
    }

    .write-review-btn {
        margin-top: 2rem;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .product-detail-container {
            margin: 1rem auto;
            padding: 0 0.5rem;
        }

        .product-detail {
            grid-template-columns: 1fr;
            gap: 2rem;
            padding: 1.5rem;
        }

        .product-title {
            font-size: 1.75rem;
        }

        .price-current {
            font-size: 2rem;
        }

        .action-buttons {
            gap: 0.75rem;
        }

        .btn {
            padding: 0.875rem 1.5rem;
            font-size: 1rem;
        }

        .features-grid {
            grid-template-columns: 1fr;
        }

        .reviews-header {
            flex-direction: column;
            align-items: flex-start;
        }
    }

    @media (max-width: 480px) {
        .breadcrumb {
            padding: 0.75rem 1rem;
        }

        .product-detail {
            padding: 1rem;
        }

        .product-title {
            font-size: 1.5rem;
        }

        .price-current {
            font-size: 1.75rem;
        }

        .thumbnail {
            width: 60px;
            height: 60px;
        }

        .quantity-controls {
            width: 100%;
        }

        .quantity-input {
            flex: 1;
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

    /* Accessibility */
    .btn:focus,
    .quantity-btn:focus,
    .quantity-input:focus {
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

<div class="product-detail-container">
    <!-- Breadcrumb Navigation -->
    <nav class="breadcrumb" aria-label="Breadcrumb">
        <ol class="breadcrumb-list">
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/home">
                    <i class="bi bi-house"></i> Trang chủ
                </a>
            </li>
            <li class="breadcrumb-separator">
                <i class="bi bi-chevron-right"></i>
            </li>
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/products">Sản phẩm</a>
            </li>
            <li class="breadcrumb-separator">
                <i class="bi bi-chevron-right"></i>
            </li>
            <li class="breadcrumb-item">
                <c:if test="${not empty product.category}">
                    <a href="${pageContext.request.contextPath}/products?category=${product.category.id}">
                        ${product.category.name}
                    </a>
                </c:if>
            </li>
            <li class="breadcrumb-separator">
                <i class="bi bi-chevron-right"></i>
            </li>
            <li class="breadcrumb-item" aria-current="page">${product.name}</li>
        </ol>
    </nav>

    <!-- Product Detail -->
    <div class="product-detail">
        <!-- Product Gallery -->
        <div class="product-gallery">
            <div class="main-image-container">
                <c:choose>
                    <c:when test="${not empty product.mainImage}">
                        <img src="${pageContext.request.contextPath}/${product.mainImage}" 
                             alt="${product.name}" 
                             class="main-image"
                             id="mainImage"
                             onerror="this.src='${pageContext.request.contextPath}/images/default.jpg'">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/images/default.jpg"
alt="${product.name}" 
                             class="main-image"
                             id="mainImage">
                    </c:otherwise>
                </c:choose>
                <div class="image-zoom-indicator">
                    <i class="bi bi-zoom-in"></i>
                </div>
            </div>

            <!-- Thumbnail Gallery -->
            <div class="thumbnail-gallery">
                <div class="thumbnail active" onclick="changeMainImage('${pageContext.request.contextPath}/${product.mainImage}', this)">
                    <c:choose>
                        <c:when test="${not empty product.mainImage}">
                            <img src="${pageContext.request.contextPath}/${product.mainImage}" 
                                 alt="${product.name}"
                                 onerror="this.src='${pageContext.request.contextPath}/images/default.jpg'">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/images/default.jpg" alt="${product.name}">
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <c:forEach var="img" items="${images}" varStatus="status">
                    <div class="thumbnail" onclick="changeMainImage('${pageContext.request.contextPath}/${img.imagePath}', this)">
                        <img src="${pageContext.request.contextPath}/${img.imagePath}" 
                             alt="${product.name} - ${status.index + 2}"
                             onerror="this.src='${pageContext.request.contextPath}/images/default.jpg'">
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Product Information -->
        <div class="product-info">
            <h1 class="product-title">${product.name}</h1>

            <!-- Product Rating -->
            <div class="product-rating">
                <div class="stars">
                    <i class="bi bi-star-fill star"></i>
                    <i class="bi bi-star-fill star"></i>
                    <i class="bi bi-star-fill star"></i>
                    <i class="bi bi-star-fill star"></i>
                    <i class="bi bi-star-half star"></i>
                </div>
                <span class="rating-text">(4.5 trên 5 - 128 đánh giá)</span>
            </div>

            <!-- Product Price -->
            <div class="product-price">
                <span class="price-current">
                    <c:choose>
                        <c:when test="${product.price % 1 == 0}">
                            ${String.format("%.0f", product.price)}
                        </c:when>
                        <c:otherwise>
                            ${String.format("%.2f", product.price)}
                        </c:otherwise>
                    </c:choose>
                </span>
<span class="price-currency">VND</span>
            </div>

            <!-- Product Description -->
            <div class="product-description">
                <c:choose>
                    <c:when test="${not empty product.description}">
                        ${product.description}
                    </c:when>
                    <c:otherwise>
                        Sản phẩm chất lượng cao với thiết kế hiện đại và tính năng vượt trội. 
                        Đây là lựa chọn hoàn hảo cho những ai tìm kiếm sự kết hợp giữa phong cách và chất lượng.
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Product Actions -->
            <div class="product-actions">
                <form action="${pageContext.request.contextPath}/add-to-cart" method="post" id="addToCartForm">
                    <input type="hidden" name="productId" value="${product.id}" />
                    
                    <div class="quantity-section">
                        <label for="quantity" class="quantity-label">
                            <i class="bi bi-box"></i> Số lượng
                        </label>
                        <div class="quantity-controls">
                            <button type="button" class="quantity-btn" onclick="updateQuantity(-1)" aria-label="Giảm số lượng">
                                <i class="bi bi-dash"></i>
                            </button>
                            <input type="number" 
                                   name="quantity" 
                                   id="quantity" 
                                   value="1" 
                                   min="1" 
                                   max="99"
                                   class="quantity-input"
                                   aria-label="Số lượng sản phẩm">
                            <button type="button" class="quantity-btn" onclick="updateQuantity(1)" aria-label="Tăng số lượng">
                                <i class="bi bi-plus"></i>
                            </button>
                        </div>
                    </div>

                    <div class="action-buttons">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-cart-plus btn-icon"></i>
                            Thêm vào giỏ hàng
                        </button>
                    </div>
                </form>

                <form action="${pageContext.request.contextPath}/add-to-wishlist" method="post" style="margin: 0;">
                    <input type="hidden" name="productId" value="${product.id}" />
                    <button type="submit" class="btn btn-secondary">
                        <i class="bi bi-heart btn-icon"></i>
                        Thêm vào yêu thích
                    </button>
                </form>
            </div>
        </div>
    </div>
<!-- Product Features -->
    <div class="product-features">
        <h2 class="features-title">
            <i class="bi bi-shield-check"></i>
            Ưu điểm nổi bật
        </h2>
        <div class="features-grid">
            <div class="feature-item">
                <div class="feature-icon">
                    <i class="bi bi-truck"></i>
                </div>
                <div class="feature-content">
                    <h4>Giao hàng miễn phí</h4>
                    <p>Miễn phí vận chuyển cho đơn hàng trên 500,000 VND</p>
                </div>
            </div>
            <div class="feature-item">
                <div class="feature-icon">
                    <i class="bi bi-arrow-clockwise"></i>
                </div>
                <div class="feature-content">
                    <h4>Đổi trả dễ dàng</h4>
                    <p>Chính sách đổi trả trong vòng 30 ngày</p>
                </div>
            </div>
            <div class="feature-item">
                <div class="feature-icon">
                    <i class="bi bi-award"></i>
                </div>
                <div class="feature-content">
                    <h4>Bảo hành chính hãng</h4>
                    <p>Bảo hành 12 tháng từ nhà sản xuất</p>
                </div>
            </div>
            <div class="feature-item">
                <div class="feature-icon">
                    <i class="bi bi-headset"></i>
                </div>
                <div class="feature-content">
                    <h4>Hỗ trợ 24/7</h4>
                    <p>Đội ngũ chăm sóc khách hàng luôn sẵn sàng</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Reviews Section -->
    <div class="reviews-section">
        <!-- Review Success/Error Messages -->
        <c:if test="${param.reviewSuccess == '1'}">
            <div class="alert alert-success">
                <i class="bi bi-check-circle alert-icon"></i>
                <span>Đánh giá của bạn đã được gửi thành công! Cảm ơn bạn đã chia sẻ.</span>
            </div>
        </c:if>
        <c:if test="${param.reviewError == '1'}">
            <div class="alert alert-error">
                <i class="bi bi-exclamation-circle alert-icon"></i>
                <span>Có lỗi xảy ra khi gửi đánh giá. Vui lòng thử lại sau.</span>
            </div>
        </c:if>

        <div class="reviews-header">
            <h2 class="reviews-title">
                <i class="bi bi-chat-square-quote"></i>
                Đánh giá sản phẩm
            </h2>
            <c:if test="${not empty sessionScope.user}">
                <a href="${pageContext.request.contextPath}/review-form?productId=${product.id}" 
                   class="btn btn-primary write-review-btn">
                    <i class="bi bi-pencil btn-icon"></i>
                    Viết đánh giá
                </a>
            </c:if>
        </div>

        <c:choose>
<c:when test="${not empty reviews}">
                <div class="review-list">
                    <c:forEach var="r" items="${reviews}">
                        <div class="review-item">
                            <div class="review-header">
                                <div class="reviewer-info">
                                    <div class="reviewer-avatar">
                                        ${r.customer.name.substring(0, 1).toUpperCase()}
                                    </div>
                                    <div class="reviewer-name">${r.customer.name}</div>
                                </div>
                                <div class="review-stars">
                                    <c:forEach begin="1" end="5" var="i">
                                        <c:choose>
                                            <c:when test="${i <= r.rating}">
                                                <i class="bi bi-star-fill star"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="bi bi-star star"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div>
                            </div>
                            <p class="review-comment">${r.comment}</p>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="review-item">
                    <div style="text-align: center; color: var(--gray-600); padding: 2rem;">
                        <i class="bi bi-chat-square-quote" style="font-size: 3rem; margin-bottom: 1rem; display: block;"></i>
                        <p>Chưa có đánh giá nào cho sản phẩm này.</p>
                        <c:if test="${not empty sessionScope.user}">
                            <p>Hãy là người đầu tiên chia sẻ cảm nhận của bạn!</p>
                        </c:if>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
    // Quantity Controls
    function updateQuantity(change) {
        const quantityInput = document.getElementById('quantity');
        let currentValue = parseInt(quantityInput.value);
        let newValue = currentValue + change;
        
        if (newValue < 1) newValue = 1;
        if (newValue > 99) newValue = 99;
        
        quantityInput.value = newValue;
        
        // Add visual feedback
        quantityInput.style.transform = 'scale(1.1)';
        setTimeout(() => {
            quantityInput.style.transform = 'scale(1)';
        }, 150);
    }

    // Image Gallery
    function changeMainImage(imageSrc, thumbnail) {
        const mainImage = document.getElementById('mainImage');
const currentThumbnail = document.querySelector('.thumbnail.active');
        
        // Remove active class from current thumbnail
        if (currentThumbnail) {
            currentThumbnail.classList.remove('active');
        }
        
        // Add active class to clicked thumbnail
        thumbnail.classList.add('active');
        
        // Change main image with fade effect
        mainImage.style.opacity = '0.5';
        setTimeout(() => {
            mainImage.src = imageSrc;
            mainImage.style.opacity = '1';
        }, 200);
    }

    // Form Submission Enhancement
    document.getElementById('addToCartForm').addEventListener('submit', function(e) {
        const submitBtn = this.querySelector('button[type="submit"]');
        const originalText = submitBtn.innerHTML;
        
        // Add loading state
        submitBtn.classList.add('loading');
        submitBtn.innerHTML = '<i class="bi bi-arrow-clockwise" style="animation: spin 1s linear infinite;"></i> Đang thêm...';
        submitBtn.disabled = true;
        
        // Simulate processing time (you can remove this in production)
        setTimeout(() => {
            // Reset button state after form submission
            submitBtn.classList.remove('loading');
            submitBtn.innerHTML = originalText;
            submitBtn.disabled = false;
        }, 2000);
    });

    // Keyboard Navigation for Quantity
    document.getElementById('quantity').addEventListener('keydown', function(e) {
        if (e.key === 'ArrowUp') {
            e.preventDefault();
            updateQuantity(1);
        } else if (e.key === 'ArrowDown') {
            e.preventDefault();
            updateQuantity(-1);
        }
    });

    // Image Zoom on Click (Simple modal-like behavior)
    document.getElementById('mainImage').addEventListener('click', function() {
        const overlay = document.createElement('div');
        overlay.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.9);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
            cursor: pointer;
        `;
        
        const zoomedImage = document.createElement('img');
        zoomedImage.src = this.src;
        zoomedImage.style.cssText = `
            max-width: 90%;
            max-height: 90%;
            object-fit: contain;
            border-radius: 12px;
        `;
        
        overlay.appendChild(zoomedImage);
        document.body.appendChild(overlay);
        
        // Close on click
        overlay.addEventListener('click', function() {
            document.body.removeChild(overlay);
        });
        
        // Close on escape key
        document.addEventListener('keydown', function escapeHandler(e) {
            if (e.key === 'Escape') {
document.body.removeChild(overlay);
                document.removeEventListener('keydown', escapeHandler);
            }
        });
    });

    // Smooth scroll to reviews when clicking rating
    document.querySelector('.product-rating').addEventListener('click', function() {
        document.querySelector('.reviews-section').scrollIntoView({
            behavior: 'smooth',
            block: 'start'
        });
    });

    // Add to wishlist with feedback
    document.querySelector('form[action*="add-to-wishlist"] button').addEventListener('click', function(e) {
        const btn = this;
        const originalText = btn.innerHTML;
        
        // Visual feedback
        btn.style.transform = 'scale(0.95)';
        setTimeout(() => {
            btn.style.transform = 'scale(1)';
        }, 150);
        
        // Change text temporarily
        btn.innerHTML = '<i class="bi bi-heart-fill btn-icon"></i> Đã thêm!';
        btn.style.background = 'var(--gradient-success)';
        btn.style.color = 'var(--white)';
        btn.style.borderColor = 'transparent';
        
        setTimeout(() => {
            btn.innerHTML = originalText;
            btn.style.background = '';
            btn.style.color = '';
            btn.style.borderColor = '';
        }, 2000);
    });

    // Initialize page
    document.addEventListener('DOMContentLoaded', function() {
        // Add entrance animations to review items
        const reviewItems = document.querySelectorAll('.review-item');
        reviewItems.forEach((item, index) => {
            item.style.animationDelay = (index * 0.1) + 's';
            item.style.animation = 'fadeInUp 0.6s ease-out forwards';
        });

        // Auto-scroll to top
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
</script>

<jsp:include page="../../common/footer.jsp" />