
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - FashionShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #e91e63;
            --primary-dark: #c2185b;
            --primary-light: #f8bbd9;
            --secondary-color: #2c3e50;
            --accent-color: #3498db;
            --gradient-primary: linear-gradient(135deg, #e91e63, #f06292);
            --gradient-secondary: linear-gradient(135deg, #667eea, #764ba2);
            --gradient-bg: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --shadow-soft: 0 10px 40px rgba(0,0,0,0.1);
            --shadow-medium: 0 20px 60px rgba(0,0,0,0.15);
            --shadow-strong: 0 30px 80px rgba(0,0,0,0.2);
            --border-radius: 1rem;
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            min-height: 100vh;
            background: var(--gradient-bg);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
            position: relative;
            overflow-x: hidden;
        }

        /* Animated Background Elements */
        body::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="white" opacity="0.1"/><circle cx="75" cy="75" r="1" fill="white" opacity="0.05"/><circle cx="50" cy="10" r="0.5" fill="white" opacity="0.1"/><circle cx="10" cy="60" r="0.5" fill="white" opacity="0.08"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            animation: float 20s infinite linear;
            pointer-events: none;
        }

        @keyframes float {
            0% { transform: translateX(-50px) translateY(-50px); }
            100% { transform: translateX(-50px) translateY(-150px); }
        }

        /* Main Login Container */
        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-strong);
            padding: 3rem 2.5rem;
            width: 100%;
            max-width: 440px;
            position: relative;
            overflow: hidden;
            animation: slideInUp 0.8s cubic-bezier(0.4, 0, 0.2, 1);
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(40px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient-primary);
        }

        /* Brand Header */
        .login-header {
            text-align: center;
            margin-bottom: 2.5rem;
            position: relative;
        }

        .brand-logo {
            width: 80px;
            height: 80px;
            background: var(--gradient-primary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            box-shadow: var(--shadow-medium);
            position: relative;
            overflow: hidden;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .brand-logo::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.3), transparent);
            transform: rotate(-45deg) translateX(-100%);
            animation: shine 3s infinite;
        }

        @keyframes shine {
            0% { transform: rotate(-45deg) translateX(-100%); }
            50% { transform: rotate(-45deg) translateX(100%); }
            100% { transform: rotate(-45deg) translateX(100%); }
        }

        .brand-logo i {
            color: white;
            font-size: 2.5rem;
            z-index: 1;
        }

        .login-title {
            font-size: 2rem;
            font-weight: 700;
            color: var(--secondary-color);
            margin-bottom: 0.5rem;
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .login-subtitle {
            color: #6c757d;
            font-size: 1rem;
            font-weight: 400;
            margin-bottom: 0;
        }

        /* Error/Success Alerts */
        .alert {
            border: none;
            border-radius: var(--border-radius);
            padding: 1rem 1.5rem;
            margin-bottom: 1.5rem;
            font-weight: 500;
            position: relative;
            animation: slideInDown 0.5s ease;
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

        .alert-danger {
            background: linear-gradient(135deg, #ff6b6b, #ee5a24);
            color: white;
            box-shadow: 0 8px 32px rgba(255, 107, 107, 0.3);
        }

        .alert-success {
            background: linear-gradient(135deg, #00d2d3, #54a0ff);
            color: white;
            box-shadow: 0 8px 32px rgba(0, 210, 211, 0.3);
        }

        /* Form Styling */
        .login-form {
            margin-bottom: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-label {
            font-weight: 600;
            color: var(--secondary-color);
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-control {
            border: 2px solid #e9ecef;
            border-radius: var(--border-radius);
            padding: 1rem 1rem 1rem 3rem;
            font-size: 1rem;
            transition: var(--transition);
            background: rgba(248, 249, 250, 0.8);
            backdrop-filter: blur(10px);
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(233, 30, 99, 0.15);
            background: white;
            outline: none;
        }

        .form-control:valid {
            border-color: #28a745;
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 2.2rem;
            color: #6c757d;
            font-size: 1.2rem;
            transition: var(--transition);
            pointer-events: none;
        }

        .form-control:focus + .input-icon {
            color: var(--primary-color);
        }

        /* Password Toggle */
        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 2.2rem;
            background: none;
            border: none;
            color: #6c757d;
            font-size: 1.2rem;
            cursor: pointer;
            transition: var(--transition);
            z-index: 10;
        }

        .password-toggle:hover {
            color: var(--primary-color);
        }

        /* Enhanced Button */
        .btn-login {
            background: var(--gradient-primary);
            border: none;
            color: white;
            font-weight: 600;
            font-size: 1rem;
            padding: 1rem 2rem;
            border-radius: var(--border-radius);
            width: 100%;
            position: relative;
            overflow: hidden;
            transition: var(--transition);
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: var(--shadow-soft);
        }

        .btn-login::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s ease;
        }

        .btn-login:hover::before {
            left: 100%;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-medium);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        /* Loading State */
        .btn-login.loading {
            pointer-events: none;
            opacity: 0.8;
        }

        .btn-login.loading::after {
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

        /* Divider */
        .divider {
            display: flex;
            align-items: center;
            text-align: center;
            margin: 2rem 0;
            color: #6c757d;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: linear-gradient(90deg, transparent, #dee2e6, transparent);
        }

        .divider span {
            padding: 0 1rem;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
        }

        /* Google Login Button */
        .btn-google {
            background: white;
            border: 2px solid #e9ecef;
            color: #5f6368;
            font-weight: 500;
            padding: 1rem;
            border-radius: var(--border-radius);
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: var(--transition);
            margin-bottom: 1.5rem;
            position: relative;
            overflow: hidden;
        }

        .btn-google::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(66, 133, 244, 0.1), transparent);
            transition: left 0.5s ease;
        }

        .btn-google:hover::before {
            left: 100%;
        }

        .btn-google:hover {
            border-color: #4285f4;
            color: #4285f4;
            transform: translateY(-2px);
            box-shadow: var(--shadow-soft);
            text-decoration: none;
        }

        .google-logo {
            width: 24px;
            height: 24px;
            margin-right: 12px;
            background: url('https://developers.google.com/identity/images/g-logo.png') no-repeat center;
            background-size: contain;
        }

        /* Footer Links */
        .login-footer {
            text-align: center;
            margin-top: 2rem;
        }

        .login-footer a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            position: relative;
        }

        .login-footer a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--gradient-primary);
            transition: width 0.3s ease;
        }

        .login-footer a:hover::after {
            width: 100%;
        }

        .login-footer a:hover {
            color: var(--primary-dark);
        }

        /* Back to Home */
        .back-to-home {
            position: absolute;
            top: 2rem;
            left: 2rem;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: var(--secondary-color);
            padding: 0.75rem 1rem;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            box-shadow: var(--shadow-soft);
            z-index: 100;
        }

        .back-to-home:hover {
            background: white;
            color: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: var(--shadow-medium);
            text-decoration: none;
        }

        .back-to-home i {
            margin-right: 0.5rem;
        }

        /* Responsive Design */
        @media (max-width: 576px) {
            body {
                padding: 1rem;
            }

            .login-container {
                padding: 2rem 1.5rem;
            }

            .login-title {
                font-size: 1.75rem;
            }

            .back-to-home {
                top: 1rem;
                left: 1rem;
                padding: 0.5rem 0.75rem;
            }
        }

        /* Dark Mode Support */
        @media (prefers-color-scheme: dark) {
            .login-container {
                background: rgba(30, 30, 30, 0.95);
                color: #e9ecef;
            }

            .login-title {
                color: #e9ecef;
            }

            .form-control {
                background: rgba(40, 40, 40, 0.8);
                border-color: #495057;
                color: #e9ecef;
            }

            .form-control:focus {
                background: rgba(50, 50, 50, 0.9);
            }
        }

        /* Accessibility Improvements */
        .form-control:focus,
        .btn-login:focus,
        .btn-google:focus {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        /* Animation for form validation */
        .was-validated .form-control:invalid {
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }
    </style>
</head>
<body>
    <!-- Back to Home Button -->
    <a href="${pageContext.request.contextPath}/home" class="back-to-home">
        <i class="bi bi-arrow-left"></i>
        Về trang chủ
    </a>

    <div class="login-container">
        <!-- Brand Header -->
        <div class="login-header">
            <div class="brand-logo">
                <i class="bi bi-bag-heart-fill"></i>
            </div>
            <h1 class="login-title">Đăng nhập</h1>
            <p class="login-subtitle">Chào mừng bạn quay trở lại FashionShop</p>
        </div>

        <!-- Error/Success Messages -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                ${error}
            </div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                ${errorMessage}
            </div>
        </c:if>

        <c:if test="${not empty success}">
            <div class="alert alert-success" role="alert">
                <i class="bi bi-check-circle-fill me-2"></i>
                ${success}
            </div>
        </c:if>

        <!-- Login Form -->
        <form class="login-form needs-validation" action="${pageContext.request.contextPath}/login" method="post" novalidate>
            <div class="form-group">
                <label for="email" class="form-label">
                    <i class="bi bi-envelope me-1"></i>
                    Email hoặc tên đăng nhập
                </label>
                <input type="text" class="form-control" id="email" name="email" required
                       placeholder="Nhập email hoặc tên đăng nhập của bạn"
                       autocomplete="username">
                <i class="bi bi-person input-icon"></i>
            </div>

            <div class="form-group">
                <label for="password" class="form-label">
                    <i class="bi bi-lock me-1"></i>
                    Mật khẩu
                </label>
                <input type="password" class="form-control" id="password" name="password" required
                       placeholder="Nhập mật khẩu của bạn"
                       autocomplete="current-password">
                <i class="bi bi-lock input-icon"></i>
                <button type="button" class="password-toggle" onclick="togglePassword()">
                    <i class="bi bi-eye" id="passwordToggleIcon"></i>
                </button>
            </div>

            <div class="form-check mb-4">
                <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                <label class="form-check-label" for="rememberMe">
                    Ghi nhớ đăng nhập
                </label>
            </div>

            <button type="submit" class="btn btn-login" id="loginBtn">
                <i class="bi bi-box-arrow-in-right me-2"></i>
                Đăng nhập
            </button>
        </form>

        <!-- Divider -->
        <div class="divider">
            <span>hoặc đăng nhập với</span>
        </div>

        <!-- Google Login -->
        <a href="${pageContext.request.contextPath}/login-google" class="btn-google">
            <div class="google-logo"></div>
            Đăng nhập với Google
        </a>

        <!-- Footer Links -->
        <div class="login-footer">
            <p class="mb-2">
                <a href="${pageContext.request.contextPath}/forgot-password">
                    Quên mật khẩu?
                </a>
            </p>
            <p class="mb-0">
                Bạn chưa có tài khoản? 
                <a href="${pageContext.request.contextPath}/register">
                    Đăng ký ngay
                </a>
            </p>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Password toggle functionality
        function togglePassword() {
            const passwordField = document.getElementById('password');
            const toggleIcon = document.getElementById('passwordToggleIcon');
            
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                toggleIcon.className = 'bi bi-eye-slash';
            } else {
                passwordField.type = 'password';
                toggleIcon.className = 'bi bi-eye';
            }
        }

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
                            const btn = document.getElementById('loginBtn');
                            btn.classList.add('loading');
                            btn.disabled = true;
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

        // Enhanced form interactions
        document.querySelectorAll('.form-control').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });

            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('focused');
            });

            input.addEventListener('input', function() {
                if (this.value.length > 0) {
                    this.classList.add('has-content');
                } else {
                    this.classList.remove('has-content');
                }
            });
        });

        // Auto-hide alerts after 5 seconds
        document.querySelectorAll('.alert').forEach(alert => {
            setTimeout(() => {
                alert.style.animation = 'slideOutUp 0.5s ease forwards';
                setTimeout(() => alert.remove(), 500);
            }, 5000);
        });

        // Keyboard shortcuts
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                window.location.href = '${pageContext.request.contextPath}/home';
            }
        });

        // Loading simulation for demo
        document.querySelector('.login-form').addEventListener('submit', function(e) {
            const btn = document.getElementById('loginBtn');
            if (btn.classList.contains('loading')) return;
            
            btn.classList.add('loading');
            setTimeout(() => {
                btn.classList.remove('loading');
            }, 2000);
        });
    </script>
</body>
</html>
