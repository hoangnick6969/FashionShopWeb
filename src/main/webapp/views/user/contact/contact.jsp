
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên hệ với chúng tôi - FashionShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #3b82f6;
            --primary-dark: #2563eb;
            --primary-light: #dbeafe;
            --secondary-color: #1f2937;
            --accent-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
            --success-color: #22c55e;
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
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            --gradient-primary: linear-gradient(135deg, #3b82f6, #1d4ed8);
            --gradient-secondary: linear-gradient(135deg, #10b981, #059669);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            color: var(--gray-800);
            line-height: 1.6;
            min-height: 100vh;
        }

        /* Header Styles */
        .contact-header {
            background: white;
            box-shadow: var(--shadow-sm);
            border-bottom: 1px solid var(--gray-200);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .navbar {
            padding: 1rem 0;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            color: var(--primary-color) !important;
            text-decoration: none;
        }

        .navbar-nav .nav-link {
            color: var(--gray-600);
            font-weight: 500;
            transition: var(--transition);
            padding: 0.5rem 1rem;
            border-radius: var(--border-radius-sm);
        }

        .navbar-nav .nav-link:hover {
            color: var(--primary-color);
            background: var(--primary-light);
        }

        /* Main Content */
        .main-content {
            padding: 3rem 0;
        }

        .contact-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        /* Hero Section */
        .hero-section {
            text-align: center;
            margin-bottom: 4rem;
            padding: 2rem 0;
            background: white;
            border-radius: var(--border-radius-lg);
            box-shadow: var(--shadow-sm);
        }

        .hero-icon {
            width: 80px;
            height: 80px;
            background: var(--gradient-primary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            box-shadow: var(--shadow-lg);
        }

        .hero-icon i {
            color: white;
            font-size: 2.5rem;
        }

        .hero-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--gray-900);
            margin-bottom: 1rem;
            background: linear-gradient(135deg, var(--gray-900), var(--primary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero-subtitle {
            font-size: 1.2rem;
            color: var(--gray-600);
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.7;
        }

        /* Success Message */
        .success-message {
            background: var(--gradient-secondary);
            color: white;
            padding: 1.5rem 2rem;
            border-radius: var(--border-radius);
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            box-shadow: var(--shadow-md);
            animation: slideInDown 0.6s ease;
        }

        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .success-message i {
            font-size: 1.5rem;
            margin-right: 1rem;
        }

        /* Contact Content */
        .contact-content {
            display: grid;
            grid-template-columns: 1fr 1.2fr;
            gap: 3rem;
            align-items: start;
        }

        /* Contact Info */
        .contact-info {
            background: white;
            padding: 2.5rem;
            border-radius: var(--border-radius-lg);
            box-shadow: var(--shadow-md);
            height: fit-content;
        }

        .contact-info-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }

        .contact-info-title i {
            color: var(--primary-color);
            margin-right: 0.75rem;
        }

        .contact-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 2rem;
            padding: 1.5rem;
            background: var(--gray-50);
            border-radius: var(--border-radius);
            border-left: 4px solid var(--primary-color);
            transition: var(--transition);
        }

        .contact-item:hover {
            transform: translateX(5px);
            box-shadow: var(--shadow-sm);
        }

        .contact-item-icon {
            width: 50px;
            height: 50px;
            background: var(--primary-light);
            color: var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            flex-shrink: 0;
        }

        .contact-item-content h4 {
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: 0.5rem;
        }

        .contact-item-content p {
            color: var(--gray-600);
            margin: 0;
            line-height: 1.5;
        }

        /* Contact Form */
        .contact-form-container {
            background: white;
            padding: 2.5rem;
            border-radius: var(--border-radius-lg);
            box-shadow: var(--shadow-md);
        }

        .form-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--gray-900);
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
        }

        .form-title i {
            color: var(--primary-color);
            margin-right: 0.75rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            font-weight: 600;
            color: var(--gray-700);
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }

        .form-label .required {
            color: var(--danger-color);
            margin-left: 0.25rem;
        }

        .form-control {
            width: 100%;
            padding: 1rem 1.25rem;
            border: 2px solid var(--gray-200);
            border-radius: var(--border-radius);
            font-size: 1rem;
            transition: var(--transition);
            background: var(--gray-50);
            color: var(--gray-800);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            background: white;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .form-control:valid {
            border-color: var(--success-color);
        }

        .form-control::placeholder {
            color: var(--gray-400);
        }

        textarea.form-control {
            resize: vertical;
            min-height: 120px;
            max-height: 200px;
        }

        /* Submit Button */
        .btn-submit {
            background: var(--gradient-primary);
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: var(--border-radius);
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            width: 100%;
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            box-shadow: var(--shadow-md);
        }

        .btn-submit::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s ease;
        }

        .btn-submit:hover::before {
            left: 100%;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-xl);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        .btn-submit.loading {
            pointer-events: none;
            opacity: 0.8;
        }

        .btn-submit.loading::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            border: 2px solid rgba(255,255,255,0.3);
            border-radius: 50%;
            border-top: 2px solid white;
            animation: spin 1s linear infinite;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }

        @keyframes spin {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }

        /* Form Validation */
        .form-control.is-invalid {
            border-color: var(--danger-color);
            background: #fef2f2;
        }

        .form-control.is-valid {
            border-color: var(--success-color);
            background: #f0fdf4;
        }

        .invalid-feedback {
            display: block;
            color: var(--danger-color);
            font-size: 0.875rem;
            margin-top: 0.5rem;
        }

        .valid-feedback {
            display: block;
            color: var(--success-color);
            font-size: 0.875rem;
            margin-top: 0.5rem;
        }

        /* Back to Home Button */
        .back-button {
            position: fixed;
            top: 2rem;
            right: 2rem;
            background: white;
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
            padding: 0.75rem 1.5rem;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
            box-shadow: var(--shadow-md);
            z-index: 1000;
        }

        .back-button:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
            text-decoration: none;
        }

        .back-button i {
            margin-right: 0.5rem;
        }

        /* Footer */
        .contact-footer {
            text-align: center;
            padding: 3rem 0;
            color: var(--gray-600);
            background: white;
            margin-top: 4rem;
            border-top: 1px solid var(--gray-200);
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .contact-content {
                grid-template-columns: 1fr;
                gap: 2rem;
            }

            .hero-title {
                font-size: 2rem;
            }

            .contact-info,
            .contact-form-container {
                padding: 2rem;
            }
        }

        @media (max-width: 768px) {
            .main-content {
                padding: 2rem 0;
            }

            .hero-section {
                margin-bottom: 2rem;
                padding: 1.5rem 1rem;
            }

            .hero-title {
                font-size: 1.75rem;
            }

            .hero-subtitle {
                font-size: 1rem;
            }

            .contact-info,
            .contact-form-container {
                padding: 1.5rem;
            }

            .back-button {
                top: 1rem;
                right: 1rem;
                padding: 0.5rem 1rem;
            }
        }

        /* Accessibility Improvements */
        .form-control:focus,
        .btn-submit:focus {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        /* Animation for form submission */
        .form-submitted {
            animation: pulse 0.6s ease;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.02); }
        }

        /* Character Counter */
        .char-counter {
            font-size: 0.8rem;
            color: var(--gray-500);
            text-align: right;
            margin-top: 0.25rem;
        }

        .char-counter.warning {
            color: var(--warning-color);
        }

        .char-counter.danger {
            color: var(--danger-color);
        }
    </style>
</head>
<body>
    <!-- Back to Home Button -->
    <a href="${pageContext.request.contextPath}/home" class="back-button">
        <i class="bi bi-arrow-left"></i>
        Về trang chủ
    </a>

    <!-- Header -->
    <header class="contact-header">
        <div class="container">
            <nav class="navbar">
                <div class="d-flex justify-content-between align-items-center w-100">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                        <i class="bi bi-bag-heart-fill me-2"></i>
                        FashionShop
                    </a>
                    <ul class="navbar-nav d-flex flex-row">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/home">Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/products">Sản phẩm</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="${pageContext.request.contextPath}/contact">Liên hệ</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main-content">
        <div class="contact-container">
            <!-- Hero Section -->
            <section class="hero-section">
                <div class="hero-icon">
                    <i class="bi bi-chat-dots-fill"></i>
                </div>
                <h1 class="hero-title">Liên hệ với chúng tôi</h1>
                <p class="hero-subtitle">
                    Chúng tôi luôn sẵn sàng lắng nghe và hỗ trợ bạn. Hãy để lại thông tin, 
                    chúng tôi sẽ phản hồi trong thời gian sớm nhất.
                </p>
            </section>

            <!-- Success Message -->
            <c:if test="${not empty success}">
                <div class="success-message">
                    <i class="bi bi-check-circle-fill"></i>
                    <div>
                        <strong>Gửi thành công!</strong>
                        <p class="mb-0">${success}</p>
                    </div>
                </div>
            </c:if>

            <!-- Contact Content -->
            <div class="contact-content">
                <!-- Contact Information -->
                <div class="contact-info">
                    <h2 class="contact-info-title">
                        <i class="bi bi-info-circle-fill"></i>
                        Thông tin liên hệ
                    </h2>

                    <div class="contact-item">
                        <div class="contact-item-icon">
                            <i class="bi bi-geo-alt-fill"></i>
                        </div>
                        <div class="contact-item-content">
                            <h4>Địa chỉ</h4>
                            <p>
                                Tòa nhà FPT University,<br>
                                Khu Công nghệ cao Hòa Lạc,<br>
                                Thạch Thất, Hà Nội
                            </p>
                        </div>
                    </div>

                    <div class="contact-item">
                        <div class="contact-item-icon">
                            <i class="bi bi-telephone-fill"></i>
                        </div>
                        <div class="contact-item-content">
                            <h4>Số điện thoại</h4>
                            <p>
                                Hotline: 1900 6789<br>
                                Di động: 0123 456 789
                            </p>
                        </div>
                    </div>

                    <div class="contact-item">
                        <div class="contact-item-icon">
                            <i class="bi bi-envelope-fill"></i>
                        </div>
                        <div class="contact-item-content">
                            <h4>Email</h4>
                            <p>
                                support@fashionshop.com<br>
                                info@fashionshop.com
                            </p>
                        </div>
                    </div>

                    <div class="contact-item">
                        <div class="contact-item-icon">
                            <i class="bi bi-clock-fill"></i>
                        </div>
                        <div class="contact-item-content">
                            <h4>Giờ làm việc</h4>
                            <p>
                                Thứ 2 - Thứ 6: 8:00 - 18:00<br>
                                Thứ 7 - Chủ nhật: 9:00 - 17:00
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Contact Form -->
                <div class="contact-form-container">
                    <h2 class="form-title">
                        <i class="bi bi-envelope-paper-fill"></i>
                        Gửi tin nhắn
                    </h2>

                    <form action="${pageContext.request.contextPath}/contact" method="post" class="contact-form needs-validation" novalidate>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="name" class="form-label">
                                        Họ và tên <span class="required">*</span>
                                    </label>
                                    <input type="text" class="form-control" id="name" name="name" required
                                           placeholder="Nhập họ và tên của bạn"
                                           autocomplete="name">
                                    <div class="invalid-feedback">
                                        Vui lòng nhập họ và tên của bạn.
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="email" class="form-label">
                                        Email <span class="required">*</span>
                                    </label>
                                    <input type="email" class="form-control" id="email" name="email" required
                                           placeholder="example@email.com"
                                           autocomplete="email">
                                    <div class="invalid-feedback">
                                        Vui lòng nhập địa chỉ email hợp lệ.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="subject" class="form-label">Chủ đề</label>
                            <input type="text" class="form-control" id="subject" name="subject"
                                   placeholder="Nhập chủ đề tin nhắn (không bắt buộc)">
                        </div>

                        <div class="form-group">
                            <label for="message" class="form-label">
                                Nội dung tin nhắn <span class="required">*</span>
                            </label>
                            <textarea class="form-control" id="message" name="message" required
                                      placeholder="Nhập nội dung tin nhắn bạn muốn gửi..."
                                      maxlength="1000"></textarea>
                            <div class="char-counter" id="charCounter">0/1000 ký tự</div>
                            <div class="invalid-feedback">
                                Vui lòng nhập nội dung tin nhắn.
                            </div>
                        </div>

                        <button type="submit" class="btn-submit" id="submitBtn">
                            <i class="bi bi-send-fill me-2"></i>
                            Gửi tin nhắn
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="contact-footer">
        <div class="container">
            <p>&copy; 2024 FashionShop. Tất cả quyền được bảo lưu.</p>
            <p>Cảm ơn bạn đã tin tưởng và lựa chọn FashionShop!</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Form validation
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                const forms = document.getElementsByClassName('needs-validation');
                const validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        } else {
                            // Add loading state
                            const btn = document.getElementById('submitBtn');
                            btn.classList.add('loading');
                            btn.disabled = true;
                            form.classList.add('form-submitted');
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

        // Character counter for message field
        const messageField = document.getElementById('message');
        const charCounter = document.getElementById('charCounter');

        messageField.addEventListener('input', function() {
            const currentLength = this.value.length;
            const maxLength = 1000;
            
            charCounter.textContent = `${currentLength}/${maxLength} ký tự`;
            
            if (currentLength > maxLength * 0.9) {
                charCounter.classList.add('warning');
            } else {
                charCounter.classList.remove('warning');
            }
            
            if (currentLength >= maxLength) {
                charCounter.classList.add('danger');
            } else {
                charCounter.classList.remove('danger');
            }
        });

        // Enhanced form interactions
        document.querySelectorAll('.form-control').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });

            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('focused');
                
                // Real-time validation
                if (this.value.length > 0) {
                    if (this.checkValidity()) {
                        this.classList.add('is-valid');
                        this.classList.remove('is-invalid');
                    } else {
                        this.classList.add('is-invalid');
                        this.classList.remove('is-valid');
                    }
                }
            });

            input.addEventListener('input', function() {
                if (this.classList.contains('is-invalid') || this.classList.contains('is-valid')) {
                    if (this.checkValidity()) {
                        this.classList.add('is-valid');
                        this.classList.remove('is-invalid');
                    } else {
                        this.classList.add('is-invalid');
                        this.classList.remove('is-valid');
                    }
                }
            });
        });

        // Auto-hide success message after 5 seconds
        const successMessage = document.querySelector('.success-message');
        if (successMessage) {
            setTimeout(() => {
                successMessage.style.animation = 'slideInDown 0.5s ease reverse';
                setTimeout(() => successMessage.remove(), 500);
            }, 5000);
        }

        // Smooth scroll to form on page load if there's an error
        window.addEventListener('load', function() {
            if (window.location.hash === '#form') {
                document.querySelector('.contact-form-container').scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });

        // Keyboard shortcuts
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                window.location.href = '${pageContext.request.contextPath}/home';
            }
        });

        // Animate elements on scroll
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver(function(entries) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.animation = 'fadeInUp 0.6s ease forwards';
                }
            });
        }, observerOptions);

        document.querySelectorAll('.contact-item, .form-group').forEach(el => {
            observer.observe(el);
        });

        // Add fade in animation
        const style = document.createElement('style');
        style.textContent = `
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
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>
