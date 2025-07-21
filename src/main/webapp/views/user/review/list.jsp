<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../../common/header.jsp" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đánh giá sản phẩm - ${product.name}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #2563eb;
            --primary-light: #dbeafe;
            --secondary-color: #1f2937;
            --success-color: #059669;
            --warning-color: #d97706;
            --danger-color: #dc2626;
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
            --border-radius-lg: 1rem;
            --transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
            --gradient-primary: linear-gradient(135deg, #2563eb, #3b82f6);
            --gradient-gold: linear-gradient(135deg, #f59e0b, #fbbf24);
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
        .review-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        /* Product Header */
        .product-header {
            background: white;
            border-radius: var(--border-radius-lg);
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-200);
            position: relative;
            overflow: hidden;
        }

        .product-header::before {
content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient-primary);
        }

        .product-info {
            display: flex;
            align-items: center;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .product-icon {
            width: 64px;
            height: 64px;
            background: var(--gradient-primary);
            border-radius: var(--border-radius);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            flex-shrink: 0;
        }

        .product-details h1 {
            font-size: 1.875rem;
            font-weight: 700;
            color: var(--gray-900);
            margin-bottom: 0.5rem;
        }

        .product-subtitle {
            color: var(--gray-600);
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Review Stats */
        .review-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            background: var(--gray-50);
            padding: 1.5rem;
            border-radius: var(--border-radius);
            border: 1px solid var(--gray-200);
        }

        .stat-item {
            text-align: center;
            padding: 1rem;
            background: white;
            border-radius: var(--border-radius-sm);
            border: 1px solid var(--gray-200);
            transition: var(--transition);
        }

        .stat-item:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-color);
            display: block;
        }

        .stat-label {
            font-size: 0.875rem;
            color: var(--gray-600);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            font-weight: 500;
        }

        /* Reviews Section */
        .reviews-section {
            background: white;
            border-radius: var(--border-radius-lg);
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--gray-200);
            overflow: hidden;
        }

        .reviews-header {
            background: var(--gray-50);
            padding: 1.5rem 2rem;
            border-bottom: 1px solid var(--gray-200);
            display: flex;
            justify-content: space-between;
            align-items: center;
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

        .reviews-title i {
            color: var(--primary-color);
        }

        .review-filters {
            display: flex;
            gap: 0.75rem;
            align-items: center;
        }

        .filter-btn {
            padding: 0.5rem 1rem;
            border: 2px solid var(--gray-300);
            background: white;
            border-radius: var(--border-radius-sm);
            font-size: 0.875rem;
            font-weight: 500;
            color: var(--gray-700);
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .filter-btn:hover,
        .filter-btn.active {
            border-color: var(--primary-color);
            background: var(--primary-light);
            color: var(--primary-color);
        }

        /* Empty State */
        .empty-state {
            padding: 4rem 2rem;
            text-align: center;
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
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
        }

        .btn-primary {
            background: var(--gradient-primary);
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

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
            color: white;
            text-decoration: none;
        }

        /* Review Cards */
        .reviews-list {
            padding: 2rem;
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .review-card {
            background: var(--gray-50);
            border-radius: var(--border-radius);
            padding: 1.5rem;
            border: 1px solid var(--gray-200);
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .review-card::before {
            content: '';
position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: var(--gradient-gold);
            transform: scaleY(0);
            transition: var(--transition);
        }

        .review-card:hover {
            background: white;
            box-shadow: var(--shadow-md);
            transform: translateY(-2px);
        }

        .review-card:hover::before {
            transform: scaleY(1);
        }

        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 1rem;
            gap: 1rem;
        }

        .reviewer-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .reviewer-avatar {
            width: 48px;
            height: 48px;
            background: var(--gradient-primary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 1.2rem;
            flex-shrink: 0;
        }

        .reviewer-details h4 {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: 0.25rem;
        }

        .review-date {
            font-size: 0.875rem;
            color: var(--gray-500);
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .rating-display {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .stars {
            display: flex;
            gap: 0.125rem;
        }

        .star {
            color: #fbbf24;
            font-size: 1.125rem;
        }

        .star.empty {
            color: var(--gray-300);
        }

        .rating-value {
            font-weight: 600;
            color: var(--gray-700);
            font-size: 0.875rem;
        }

        .review-content {
            color: var(--gray-700);
            line-height: 1.7;
            font-size: 1rem;
        }

        /* Helpful Actions */
        .review-actions {
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 1px solid var(--gray-200);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .helpful-section {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .helpful-btn {
            background: none;
            border: 1px solid var(--gray-300);
            padding: 0.5rem 1rem;
            border-radius: var(--border-radius-sm);
            font-size: 0.875rem;
            color: var(--gray-600);
            cursor: pointer;
            transition: var(--transition);
display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .helpful-btn:hover {
            border-color: var(--primary-color);
            color: var(--primary-color);
            background: var(--primary-light);
        }

        .verified-badge {
            background: linear-gradient(135deg, var(--success-color), #10b981);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 1rem;
            font-size: 0.75rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        /* Loading Animation */
        .loading-skeleton {
            background: linear-gradient(90deg, var(--gray-200) 25%, var(--gray-100) 50%, var(--gray-200) 75%);
            background-size: 200% 100%;
            animation: loading 1.5s infinite;
        }

        @keyframes loading {
            0% { background-position: 200% 0; }
            100% { background-position: -200% 0; }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .review-container {
                margin: 1rem auto;
                padding: 0 0.5rem;
            }

            .product-header {
                padding: 1.5rem;
                margin-bottom: 1.5rem;
            }

            .product-info {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            .product-details h1 {
                font-size: 1.5rem;
            }

            .review-stats {
                grid-template-columns: repeat(2, 1fr);
                gap: 0.75rem;
                padding: 1rem;
            }

            .reviews-header {
                flex-direction: column;
                align-items: stretch;
                gap: 1rem;
            }

            .review-filters {
                justify-content: center;
                flex-wrap: wrap;
            }

            .reviews-list {
                padding: 1rem;
                gap: 1rem;
            }

            .review-card {
                padding: 1rem;
            }

            .review-header {
                flex-direction: column;
                align-items: stretch;
                gap: 0.75rem;
            }

            .reviewer-info {
                justify-content: center;
            }

            .rating-display {
                justify-content: center;
            }

            .review-actions {
                flex-direction: column;
                align-items: stretch;
                gap: 0.75rem;
            }

            .helpful-section {
                justify-content: center;
            }
        }

        /* Accessibility */
        .review-card:focus-within,
        .filter-btn:focus,
        .helpful-btn:focus {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        /* Animation */
.review-card {
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

        /* Staggered animation */
        .review-card:nth-child(1) { animation-delay: 0.1s; }
        .review-card:nth-child(2) { animation-delay: 0.2s; }
        .review-card:nth-child(3) { animation-delay: 0.3s; }
        .review-card:nth-child(4) { animation-delay: 0.4s; }
        .review-card:nth-child(5) { animation-delay: 0.5s; }
    </style>
</head>
<body>
    <div class="review-container">
        <!-- Product Header -->
        <div class="product-header">
            <div class="product-info">
                <div class="product-icon">
                    <i class="bi bi-box-seam"></i>
                </div>
                <div class="product-details">
                    <h1>${product.name}</h1>
                    <p class="product-subtitle">
                        <i class="bi bi-star-fill"></i>
                        Đánh giá từ khách hàng
                    </p>
                </div>
            </div>

            <!-- Review Statistics -->
            <div class="review-stats">
                <div class="stat-item">
                    <span class="stat-value">${reviews.size()}</span>
                    <span class="stat-label">Tổng đánh giá</span>
                </div>
                <div class="stat-item">
                    <span class="stat-value">
                        <c:choose>
                            <c:when test="${not empty reviews}">
                                <fmt:formatNumber value="${reviews.stream().mapToInt(r -> r.rating).average().orElse(0)}" 
                                                pattern="0.0" />
                            </c:when>
                            <c:otherwise>0.0</c:otherwise>
                        </c:choose>
                    </span>
                    <span class="stat-label">Điểm trung bình</span>
                </div>
                <div class="stat-item">
                    <span class="stat-value">
                        ${reviews.stream().filter(r -> r.rating == 5).count()}
                    </span>
                    <span class="stat-label">5 sao</span>
                </div>
                <div class="stat-item">
                    <span class="stat-value">
                        ${reviews.stream().filter(r -> r.comment != null && !r.comment.trim().isEmpty()).count()}
                    </span>
                    <span class="stat-label">Có bình luận</span>
                </div>
            </div>
        </div>

        <!-- Reviews Section -->
        <div class="reviews-section">
            <!-- Reviews Header -->
            <div class="reviews-header">
<h2 class="reviews-title">
                    <i class="bi bi-chat-square-text"></i>
                    Đánh giá khách hàng
                </h2>
                <div class="review-filters">
                    <button class="filter-btn active" onclick="filterReviews('all')">
                        <i class="bi bi-list"></i>
                        Tất cả
                    </button>
                    <button class="filter-btn" onclick="filterReviews('5')">
                        <i class="bi bi-star-fill"></i>
                        5 sao
                    </button>
                    <button class="filter-btn" onclick="filterReviews('4')">
                        <i class="bi bi-star-fill"></i>
                        4 sao
                    </button>
                    <button class="filter-btn" onclick="filterReviews('with-comment')">
                        <i class="bi bi-chat-dots"></i>
                        Có bình luận
                    </button>
                </div>
            </div>

            <!-- Reviews Content -->
            <c:choose>
                <c:when test="${empty reviews}">
                    <!-- Empty State -->
                    <div class="empty-state">
                        <div class="empty-state-icon">
                            <i class="bi bi-chat-square-text"></i>
                        </div>
                        <h3>Chưa có đánh giá nào</h3>
                        <p>Sản phẩm này chưa có đánh giá từ khách hàng. Hãy là người đầu tiên chia sẻ trải nghiệm của bạn!</p>
                        <a href="${pageContext.request.contextPath}/product/detail?id=${product.id}" class="btn-primary">
                            <i class="bi bi-arrow-left"></i>
                            Quay lại sản phẩm
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- Reviews List -->
                    <div class="reviews-list">
                        <c:forEach var="review" items="${reviews}" varStatus="status">
                            <div class="review-card" data-rating="${review.rating}" data-has-comment="${not empty review.comment}">
                                <!-- Review Header -->
                                <div class="review-header">
                                    <div class="reviewer-info">
                                        <div class="reviewer-avatar">
                                            ${review.customer.name.substring(0, 1).toUpperCase()}
                                        </div>
                                        <div class="reviewer-details">
                                            <h4>${review.customer.name}</h4>
                                            <div class="review-date">
                                                <i class="bi bi-calendar3"></i>
<fmt:formatDate value="${review.createdAt}" pattern="dd/MM/yyyy" />
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="rating-display">
                                        <div class="stars">
                                            <c:forEach begin="1" end="5" var="i">
                                                <i class="bi bi-star-fill star ${i <= review.rating ? '' : 'empty'}"></i>
                                            </c:forEach>
                                        </div>
                                        <span class="rating-value">${review.rating}/5</span>
                                    </div>
                                </div>

                                <!-- Review Content -->
                                <c:if test="${not empty review.comment}">
                                    <div class="review-content">
                                        ${review.comment}
                                    </div>
                                </c:if>

                                <!-- Review Actions -->
                                <div class="review-actions">
                                    <div class="helpful-section">
                                        <button class="helpful-btn" onclick="markHelpful(${review.id}, true)">
                                            <i class="bi bi-hand-thumbs-up"></i>
                                            Hữu ích
                                        </button>
                                        <button class="helpful-btn" onclick="markHelpful(${review.id}, false)">
                                            <i class="bi bi-hand-thumbs-down"></i>
                                            Không hữu ích
                                        </button>
                                    </div>
                                    
                                    <c:if test="${review.approved}">
                                        <div class="verified-badge">
                                            <i class="bi bi-patch-check-fill"></i>
                                            Đã xác minh
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Filter reviews functionality
        function filterReviews(filter) {
            const reviewCards = document.querySelectorAll('.review-card');
const filterBtns = document.querySelectorAll('.filter-btn');
            
            // Update active filter button
            filterBtns.forEach(btn => btn.classList.remove('active'));
            event.target.classList.add('active');
            
            // Show/hide reviews based on filter
            reviewCards.forEach(card => {
                const rating = parseInt(card.dataset.rating);
                const hasComment = card.dataset.hasComment === 'true';
                let show = false;
                
                switch(filter) {
                    case 'all':
                        show = true;
                        break;
                    case '5':
                        show = rating === 5;
                        break;
                    case '4':
                        show = rating === 4;
                        break;
                    case 'with-comment':
                        show = hasComment;
                        break;
                }
                
                if (show) {
                    card.style.display = 'block';
                    card.style.animation = 'slideInUp 0.3s ease-out';
                } else {
                    card.style.display = 'none';
                }
            });
            
            // Update empty state if no reviews match filter
            updateEmptyState(filter);
        }

        // Mark review as helpful
        function markHelpful(reviewId, isHelpful) {
            // Add loading state
            const btn = event.target.closest('.helpful-btn');
            const originalText = btn.innerHTML;
            btn.innerHTML = '<i class="bi bi-hourglass-split"></i> Đang xử lý...';
            btn.disabled = true;
            
            // Simulate API call
            setTimeout(() => {
                btn.innerHTML = originalText;
                btn.disabled = false;
                
                // Show feedback
                showToast(isHelpful ? 'Cảm ơn phản hồi của bạn!' : 'Đã ghi nhận phản hồi');
            }, 1000);
        }

        // Update empty state when filtering
        function updateEmptyState(filter) {
            const visibleReviews = document.querySelectorAll('.review-card[style*="block"]').length;
            const reviewsList = document.querySelector('.reviews-list');
            
            if (visibleReviews === 0 && filter !== 'all') {
                if (!document.querySelector('.filter-empty-state')) {
                    const emptyState = document.createElement('div');
                    emptyState.className = 'filter-empty-state empty-state';
                    emptyState.innerHTML = `
                        <div class="empty-state-icon">
                            <i class="bi bi-funnel"></i>
                        </div>
                        <h3>Không tìm thấy đánh giá</h3>
                        <p>Không có đánh giá nào phù hợp với bộ lọc đã chọn.</p>
`;
                    reviewsList.appendChild(emptyState);
                }
            } else {
                const filterEmptyState = document.querySelector('.filter-empty-state');
                if (filterEmptyState) {
                    filterEmptyState.remove();
                }
            }
        }

        // Show toast notification
        function showToast(message) {
            const toast = document.createElement('div');
            toast.className = 'toast-notification';
            toast.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                background: var(--success-color);
                color: white;
                padding: 1rem 1.5rem;
                border-radius: var(--border-radius-sm);
                box-shadow: var(--shadow-lg);
                z-index: 1000;
                animation: slideInRight 0.3s ease-out;
            `;
            toast.textContent = message;
            
            document.body.appendChild(toast);
            
            setTimeout(() => {
                toast.style.animation = 'slideOutRight 0.3s ease-out';
                setTimeout(() => toast.remove(), 300);
            }, 3000);
        }

        // Enhanced interactions
        document.addEventListener('DOMContentLoaded', function() {
            // Add hover effects to review cards
            document.querySelectorAll('.review-card').forEach((card, index) => {
                card.style.animationDelay = `${index * 0.1}s`;
                
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-4px)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(-2px)';
                });
            });

            // Add ripple effect to buttons
            document.querySelectorAll('.filter-btn, .helpful-btn, .btn-primary').forEach(button => {
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

            // Keyboard navigation
            document.addEventListener('keydown', function(e) {
                if (e.key === 'Escape') {
                    // Reset filters
                    filterReviews('all');
                    document.querySelector('.filter-btn').classList.add('active');
                }
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
    </script>
</body>
</html>

<jsp:include page="../../common/footer.jsp" />