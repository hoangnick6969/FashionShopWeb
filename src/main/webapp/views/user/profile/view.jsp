<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../common/header.jsp" />

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Viết đánh giá sản phẩm - FashionShop</title>
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
            --transition-slow: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
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
            max-width: 800px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        /* Page Header */
        .page-header {
            background: white;
            border-radius: var(--border-radius-lg);
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

        /* Alert Messages */
        .alert {
            border-radius: var(--border-radius);
            padding: 1rem 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-weight: 500;
            position: relative;
            overflow: hidden;
        }

        .alert::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            width: 4px;
        }

        .alert-success {
            background: #ecfdf5;
            color: #047857;
            border-color: #a7f3d0;
        }

        .alert-success::before {
            background: var(--success-color);
        }

        .alert-danger {
            background: #fef2f2;
            color: #991b1b;
            border-color: #fecaca;
        }

        .alert-danger::before {
            background: var(--danger-color);
        }

        .alert i {
            font-size: 1.25rem;
        }

        /* Main Form Container */
        .review-form-container {
            background: white;
            border-radius: var(--border-radius-lg);
            box-shadow: var(--shadow-md);
            border: 1px solid var(--gray-200);
            overflow: hidden;
        }

        /* Product Info Section */
        .product-info-section {
            background: var(--gray-50);
            padding: 2rem;
            border-bottom: 1px solid var(--gray-200);
        }

        .product-info {
            display: flex;
            gap: 1.5rem;
            align-items: center;
        }

        .product-image {
            width: 120px;
            height: 120px;
            border-radius: var(--border-radius);
            object-fit: cover;
            box-shadow: var(--shadow-sm);
            border: 2px solid white;
        }

        .product-details h3 {
            font-size: 1.5rem;
            font-weight: 700;
color: var(--gray-900);
            margin-bottom: 0.5rem;
        }

        .product-meta {
            color: var(--gray-600);
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Form Section */
        .form-section {
            padding: 2rem;
        }

        .form-section-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-section-title i {
            color: var(--primary-color);
        }

        /* Form Groups */
        .form-group {
            margin-bottom: 2rem;
        }

        .form-label {
            display: block;
            font-size: 0.95rem;
            font-weight: 600;
            color: var(--gray-700);
            margin-bottom: 0.75rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-label i {
            color: var(--primary-color);
            font-size: 1rem;
        }

        .required {
            color: var(--danger-color);
            margin-left: 0.25rem;
        }

        /* Star Rating */
        .star-rating {
            display: flex;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }

        .star-option {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 1rem;
            border: 2px solid var(--gray-200);
            border-radius: var(--border-radius);
            cursor: pointer;
            transition: var(--transition);
            background: white;
            min-width: 80px;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .star-option::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(37, 99, 235, 0.1), transparent);
            transition: left 0.5s ease;
        }

        .star-option:hover::before {
            left: 100%;
        }

        .star-option:hover {
            border-color: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .star-option input[type="radio"] {
            display: none;
        }

        .star-option input[type="radio"]:checked + .star-content {
            color: #fbbf24;
        }

        .star-option input[type="radio"]:checked ~ .star-option,
        .star-option input[type="radio"]:checked {
            border-color: var(--primary-color);
            background: var(--primary-light);
        }

        .star-content {
            display: flex;
            align-items: center;
gap: 0.25rem;
            color: var(--gray-400);
            transition: var(--transition);
            font-weight: 500;
        }

        .star-content i {
            font-size: 1.25rem;
        }

        /* Rating Labels */
        .rating-labels {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 0.5rem;
            margin-top: 0.5rem;
        }

        .rating-label {
            text-align: center;
            font-size: 0.75rem;
            color: var(--gray-500);
            font-weight: 500;
        }

        /* Comment Textarea */
        .form-control {
            width: 100%;
            padding: 1rem;
            border: 2px solid var(--gray-200);
            border-radius: var(--border-radius);
            font-size: 1rem;
            font-family: inherit;
            transition: var(--transition);
            background: white;
            resize: vertical;
            min-height: 120px;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px var(--primary-light);
        }

        .form-control::placeholder {
            color: var(--gray-400);
        }

        .character-count {
            text-align: right;
            font-size: 0.875rem;
            color: var(--gray-500);
            margin-top: 0.5rem;
        }

        /* Guidelines */
        .review-guidelines {
            background: var(--gray-50);
            border-radius: var(--border-radius);
            padding: 1.5rem;
            margin: 1.5rem 0;
            border-left: 4px solid var(--info-color);
        }

        .guidelines-title {
            font-size: 1rem;
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .guidelines-title i {
            color: var(--info-color);
        }

        .guidelines-list {
            list-style: none;
            space-y: 0.5rem;
        }

        .guidelines-list li {
            display: flex;
            align-items: flex-start;
            gap: 0.5rem;
            font-size: 0.9rem;
            color: var(--gray-600);
            margin-bottom: 0.5rem;
        }

        .guidelines-list li i {
            color: var(--success-color);
            margin-top: 0.125rem;
            font-size: 0.875rem;
        }

        /* Action Buttons */
        .form-actions {
            background: var(--gray-50);
            padding: 2rem;
            border-top: 1px solid var(--gray-200);
            display: flex;
            gap: 1rem;
            justify-content: flex-end;
            flex-wrap: wrap;
        }

        .btn {
            padding: 0.875rem 2rem;
            border-radius: var(--border-radius);
            font-size: 1rem;
            font-weight: 600;
text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition);
            border: 2px solid;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            min-width: 140px;
            justify-content: center;
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
            background: linear-gradient(135deg, var(--primary-color), #3b82f6);
            color: white;
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
            color: white;
            text-decoration: none;
        }

        .btn-secondary {
            background: white;
            color: var(--gray-700);
            border-color: var(--gray-300);
        }

        .btn-secondary:hover {
            background: var(--gray-50);
            border-color: var(--gray-400);
            color: var(--gray-700);
            text-decoration: none;
            transform: translateY(-1px);
        }

        .btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none !important;
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

        .loading-content {
            background: white;
            padding: 2rem;
            border-radius: var(--border-radius-lg);
            text-align: center;
            box-shadow: var(--shadow-xl);
        }

        .loading-spinner {
            width: 48px;
            height: 48px;
            border: 4px solid var(--gray-200);
            border-radius: 50%;
            border-top: 4px solid var(--primary-color);
            animation: spin 1s linear infinite;
            margin: 0 auto 1rem;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .review-container {
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

            .product-info {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            .product-image {
                width: 100px;
                height: 100px;
            }

            .star-rating {
                flex-direction: column;
                gap: 0.75rem;
            }

            .star-option {
                justify-content: flex-start;
                min-width: auto;
                width: 100%;
            }

            .rating-labels {
                display: none;
            }

            .form-actions {
                flex-direction: column;
                padding: 1.5rem;
            }

            .btn {
                width: 100%;
            }
        }

        /* Accessibility */
        .btn:focus,
        .form-control:focus,
        .star-option:focus-within {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        /* Animation */
        .review-form-container {
            animation: slideInUp 0.6s ease-out;
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

        /* Form validation styles */
        .form-control:invalid {
            border-color: var(--danger-color);
        }

        .form-control:valid {
            border-color: var(--success-color);
        }

        .validation-message {
            font-size: 0.875rem;
            margin-top: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .validation-message.error {
            color: var(--danger-color);
        }

        .validation-message.success {
            color: var(--success-color);
        }
    </style>
</head>
<body>
    <div class="review-container">
        <!-- Page Header -->
        <div class="page-header">
            <div class="page-title">
                <i class="bi bi-star-fill"></i>
                <div>
                    <h1>Viết đánh giá sản phẩm</h1>
                    <p class="page-subtitle">Chia sẻ trải nghiệm của bạn để giúp người khác mua sắm tốt hơn</p>
                </div>
            </div>
        </div>

        <!-- Alert Messages -->
        <c:if test="${not empty success}">
            <div class="alert alert-success">
<i class="bi bi-check-circle-fill"></i>
                <span>${success}</span>
            </div>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                <i class="bi bi-exclamation-triangle-fill"></i>
                <span>${error}</span>
            </div>
        </c:if>

        <!-- Review Form -->
        <div class="review-form-container">
            <!-- Product Info Section -->
            <div class="product-info-section">
                <div class="product-info">
                    <img src="${pageContext.request.contextPath}/${product.mainImage}" 
                         alt="${product.name}" 
                         class="product-image"
                         onerror="this.src='${pageContext.request.contextPath}/images/default.jpg'">
                    <div class="product-details">
                        <h3>${product.name}</h3>
                        <div class="product-meta">
                            <i class="bi bi-tag"></i>
                            <span>Sản phẩm bạn đã mua</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Form Section -->
            <form action="${pageContext.request.contextPath}/submit-review" method="post" id="reviewForm">
                <input type="hidden" name="productId" value="${product.id}" />
                
                <div class="form-section">
                    <div class="form-section-title">
                        <i class="bi bi-star"></i>
                        Đánh giá của bạn
                    </div>

                    <!-- Rating Selection -->
                    <div class="form-group">
                        <label class="form-label">
                            <i class="bi bi-stars"></i>
                            Mức độ hài lòng
                            <span class="required">*</span>
                        </label>
                        
                        <div class="star-rating">
                            <c:forEach var="i" begin="1" end="5">
                                <label class="star-option">
                                    <input type="radio" name="rating" value="${i}" required>
                                    <div class="star-content">
                                        <c:forEach var="j" begin="1" end="${i}">
                                            <i class="bi bi-star-fill"></i>
                                        </c:forEach>
                                        <c:forEach var="j" begin="${i + 1}" end="5">
                                            <i class="bi bi-star"></i>
                                        </c:forEach>
                                    </div>
                                </label>
                            </c:forEach>
                        </div>
<div class="rating-labels">
                            <div class="rating-label">Rất tệ</div>
                            <div class="rating-label">Tệ</div>
                            <div class="rating-label">Bình thường</div>
                            <div class="rating-label">Tốt</div>
                            <div class="rating-label">Xuất sắc</div>
                        </div>
                    </div>

                    <!-- Comment Section -->
                    <div class="form-group">
                        <label for="comment" class="form-label">
                            <i class="bi bi-chat-text"></i>
                            Nhận xét chi tiết
                            <span class="required">*</span>
                        </label>
                        
                        <textarea 
                            id="comment" 
                            name="comment" 
                            class="form-control" 
                            placeholder="Hãy chia sẻ chi tiết về trải nghiệm của bạn với sản phẩm này. Chất lượng thế nào? Có phù hợp với mong đợi không?" 
                            required
                            maxlength="1000"
                            oninput="updateCharacterCount(this)"></textarea>
                        
                        <div class="character-count">
                            <span id="charCount">0</span> / 1000 ký tự
                        </div>
                        
                        <div id="commentValidation" class="validation-message" style="display: none;">
                            <i class="bi bi-info-circle"></i>
                            <span></span>
                        </div>
                    </div>

                    <!-- Review Guidelines -->
                    <div class="review-guidelines">
                        <div class="guidelines-title">
                            <i class="bi bi-lightbulb"></i>
                            Gợi ý viết đánh giá hay
                        </div>
                        <ul class="guidelines-list">
                            <li>
                                <i class="bi bi-check"></i>
                                Mô tả chất lượng sản phẩm một cách cụ thể
                            </li>
                            <li>
                                <i class="bi bi-check"></i>
                                Chia sẻ về độ vừa vặn, chất liệu, màu sắc
                            </li>
                            <li>
                                <i class="bi bi-check"></i>
                                Đề cập đến dịch vụ giao hàng và đóng gói
                            </li>
                            <li>
                                <i class="bi bi-check"></i>
                                Giữ thái độ tích cực và xây dựng
                            </li>
                        </ul>
</div>
                </div>

                <!-- Form Actions -->
                <div class="form-actions">
                    <a href="${pageContext.request.contextPath}/product-detail?id=${product.id}" 
                       class="btn btn-secondary">
                        <i class="bi bi-arrow-left"></i>
                        Quay lại
                    </a>
                    
                    <button type="submit" class="btn btn-primary" id="submitBtn">
                        <i class="bi bi-send"></i>
                        Gửi đánh giá
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Loading Overlay -->
    <div class="loading-overlay" id="loadingOverlay">
        <div class="loading-content">
            <div class="loading-spinner"></div>
            <p>Đang gửi đánh giá của bạn...</p>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Character count functionality
        function updateCharacterCount(textarea) {
            const count = textarea.value.length;
            const maxLength = 1000;
            const charCountElement = document.getElementById('charCount');
            const validation = document.getElementById('commentValidation');
            
            charCountElement.textContent = count;
            
            if (count < 10) {
                validation.style.display = 'flex';
                validation.className = 'validation-message error';
                validation.querySelector('span').textContent = 'Vui lòng viết ít nhất 10 ký tự';
                validation.querySelector('i').className = 'bi bi-exclamation-circle';
            } else if (count > maxLength - 50) {
                validation.style.display = 'flex';
                validation.className = 'validation-message error';
                validation.querySelector('span').textContent = `Còn ${maxLength - count} ký tự`;
                validation.querySelector('i').className = 'bi bi-exclamation-triangle';
            } else {
                validation.style.display = 'flex';
                validation.className = 'validation-message success';
                validation.querySelector('span').textContent = 'Độ dài phù hợp';
                validation.querySelector('i').className = 'bi bi-check-circle';
            }
        }

        // Form submission handling
        document.getElementById('reviewForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const rating = document.querySelector('input[name="rating"]:checked');
            const comment = document.getElementById('comment').value.trim();
            
            // Validation
            if (!rating) {
                alert('Vui lòng chọn số sao đánh giá!');
                return;
            }
if (comment.length < 10) {
                alert('Vui lòng viết ít nhất 10 ký tự cho nhận xét!');
                document.getElementById('comment').focus();
                return;
            }
            
            // Show loading
            showLoading();
            
            // Submit form
            this.submit();
        });

        // Show loading overlay
        function showLoading() {
            document.getElementById('loadingOverlay').classList.add('active');
            document.getElementById('submitBtn').disabled = true;
        }

        // Hide loading overlay
        function hideLoading() {
            document.getElementById('loadingOverlay').classList.remove('active');
            document.getElementById('submitBtn').disabled = false;
        }

        // Star rating interactions
        document.addEventListener('DOMContentLoaded', function() {
            // Add enhanced interactions for star ratings
            const starOptions = document.querySelectorAll('.star-option');
            
            starOptions.forEach((option, index) => {
                option.addEventListener('mouseenter', function() {
                    // Highlight stars up to this one
                    starOptions.forEach((opt, i) => {
                        if (i <= index) {
                            opt.style.borderColor = 'var(--primary-color)';
                            opt.style.background = 'var(--primary-light)';
                        } else {
                            opt.style.borderColor = 'var(--gray-200)';
                            opt.style.background = 'white';
                        }
                    });
                });
                
                option.addEventListener('mouseleave', function() {
                    // Reset to selected state or default
                    const selected = document.querySelector('input[name="rating"]:checked');
                    starOptions.forEach((opt, i) => {
                        if (selected && i < selected.value) {
                            opt.style.borderColor = 'var(--primary-color)';
                            opt.style.background = 'var(--primary-light)';
                        } else {
                            opt.style.borderColor = 'var(--gray-200)';
                            opt.style.background = 'white';
                        }
                    });
                });
                
                option.addEventListener('click', function() {
                    const radio = this.querySelector('input[type="radio"]');
                    radio.checked = true;
                    
                    // Update visual state
                    starOptions.forEach((opt, i) => {
                        if (i < radio.value) {
                            opt.style.borderColor = 'var(--primary-color)';
                            opt.style.background = 'var(--primary-light)';
                        } else {
opt.style.borderColor = 'var(--gray-200)';
                            opt.style.background = 'white';
                        }
                    });
                });
            });

            // Auto-hide loading after page load
            setTimeout(hideLoading, 500);

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

            // Auto-resize textarea
            const textarea = document.getElementById('comment');
            textarea.addEventListener('input', function() {
                this.style.height = 'auto';
                this.style.height = Math.max(120, this.scrollHeight) + 'px';
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

        // Keyboard navigation
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                hideLoading();
            }
        });

        // Prevent double submission
        let isSubmitting = false;
        document.getElementById('reviewForm').addEventListener('submit', function(e) {
            if (isSubmitting) {
                e.preventDefault();
                return false;
            }
            isSubmitting = true;
            setTimeout(() => isSubmitting = false, 2000);
        });
    </script>
</body>
</html>

<jsp:include page="../../common/footer.jsp" />