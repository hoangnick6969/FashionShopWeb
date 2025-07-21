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
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: #000;
            color: #fff;
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
        }

        /* Animated Background */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #000 0%, #1a1a1a 50%, #000 100%);
            z-index: -2;
        }

        body::after {
            content: '';
            position: fixed;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="white" opacity="0.05"/><circle cx="75" cy="75" r="1" fill="white" opacity="0.03"/><circle cx="50" cy="10" r="0.5" fill="white" opacity="0.04"/><circle cx="10" cy="60" r="0.5" fill="white" opacity="0.02"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            animation: float 30s infinite linear;
            pointer-events: none;
            z-index: -1;
        }

        @keyframes float {
            0% { transform: translateX(-50px) translateY(-50px); }
            100% { transform: translateX(-50px) translateY(-150px); }
        }

        /* Floating Elements */
        .bg-element {
            position: fixed;
            background: rgba(0, 212, 255, 0.1);
            border-radius: 50%;
            animation: floatElement 8s ease-in-out infinite;
            pointer-events: none;
            z-index: -1;
        }

        .bg-element:nth-child(1) {
            width: 300px;
            height: 300px;
            top: 10%;
            left: 5%;
            animation-delay: 0s;
        }

        .bg-element:nth-child(2) {
            width: 200px;
            height: 200px;
            top: 60%;
            right: 10%;
            animation-delay: 3s;
        }
.bg-element:nth-child(3) {
            width: 150px;
            height: 150px;
            bottom: 20%;
            left: 15%;
            animation-delay: 6s;
        }

        @keyframes floatElement {
            0%, 100% {
                transform: translateY(0px) rotate(0deg);
                opacity: 0.1;
            }
            50% {
                transform: translateY(-30px) rotate(180deg);
                opacity: 0.2;
            }
        }

        /* Main Container */
        .login-container {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 2rem 1rem;
            position: relative;
            z-index: 10;
        }

        .login-card {
            background: rgba(20, 20, 20, 0.95);
            backdrop-filter: blur(20px);
            border: 2px solid rgba(0, 212, 255, 0.2);
            border-radius: 0;
            padding: 3rem 2.5rem;
            width: 100%;
            max-width: 450px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.5);
            animation: slideInUp 0.8s cubic-bezier(0.4, 0, 0.2, 1);
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(50px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .login-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #00d4ff, #0099cc, #00d4ff);
            background-size: 200% 100%;
            animation: shimmer 2s infinite;
        }

        @keyframes shimmer {
            0% { background-position: -200% 0; }
            100% { background-position: 200% 0; }
        }

        /* Brand Header */
        .brand-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .brand-logo {
            width: 80px;
            height: 80px;
            background: linear-gradient(45deg, #00d4ff, #0099cc);
            margin: 0 auto 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            clip-path: polygon(25% 0%, 75% 0%, 100% 50%, 75% 100%, 25% 100%, 0% 50%);
            animation: pulse 3s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        .brand-logo i {
            color: #000;
            font-size: 2.5rem;
            font-weight: 900;
        }

        .login-title {
            font-size: 2.5rem;
            font-weight: 900;
            margin-bottom: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 3px;
background: linear-gradient(45deg, #fff, #00d4ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-align: center;
        }

        .login-subtitle {
            color: #999;
            font-size: 1rem;
            font-weight: 300;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Alert Styling */
        .alert {
            background: rgba(220, 53, 69, 0.9);
            border: 2px solid #dc3545;
            border-radius: 0;
            color: #fff;
            padding: 1rem 1.5rem;
            margin-bottom: 1.5rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            animation: slideInDown 0.5s ease;
            position: relative;
            overflow: hidden;
        }

        .alert-success {
            background: rgba(0, 212, 255, 0.9);
            border-color: #00d4ff;
            color: #000;
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

        /* Form Styling */
        .login-form {
            margin-bottom: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-label {
            color: #00d4ff;
            font-weight: 700;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 0.5rem;
            display: block;
        }

        .form-control {
            background: rgba(0, 0, 0, 0.5);
            border: 2px solid rgba(255, 255, 255, 0.1);
            border-radius: 0;
            color: #fff;
            padding: 1rem 1rem 1rem 3rem;
            font-size: 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
            width: 100%;
        }

        .form-control:focus {
            background: rgba(0, 0, 0, 0.8);
            border-color: #00d4ff;
            box-shadow: 0 0 20px rgba(0, 212, 255, 0.3);
            outline: none;
            color: #fff;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.5);
            font-weight: 400;
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 2.2rem;
            color: rgba(255, 255, 255, 0.5);
            font-size: 1.2rem;
            transition: all 0.3s ease;
            pointer-events: none;
        }

        .form-control:focus + .input-icon {
            color: #00d4ff;
        }

        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 2.2rem;
            background: none;
            border: none;
color: rgba(255, 255, 255, 0.5);
            font-size: 1.2rem;
            cursor: pointer;
            transition: all 0.3s ease;
            z-index: 10;
        }

        .password-toggle:hover {
            color: #00d4ff;
        }

        /* Remember Me Checkbox */
        .form-check {
            margin-bottom: 2rem;
        }

        .form-check-input {
            background: rgba(0, 0, 0, 0.5);
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 0;
        }

        .form-check-input:checked {
            background: #00d4ff;
            border-color: #00d4ff;
        }

        .form-check-label {
            color: #ccc;
            font-weight: 500;
            margin-left: 0.5rem;
        }

        /* Login Button */
        .btn-login {
            background: linear-gradient(45deg, #00d4ff, #0099cc);
            border: none;
            color: #000;
            font-weight: 800;
            font-size: 1rem;
            padding: 1rem 2rem;
            width: 100%;
            text-transform: uppercase;
            letter-spacing: 2px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            cursor: pointer;
            border-radius: 0;
        }

        .btn-login::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s ease;
        }

        .btn-login:hover::before {
            left: 100%;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 15px 35px rgba(0, 212, 255, 0.4);
            background: linear-gradient(45deg, #0099cc, #00d4ff);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .btn-login.loading {
            pointer-events: none;
            opacity: 0.8;
        }

        .btn-login.loading::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            border: 2px solid rgba(0,0,0,0.3);
            border-radius: 50%;
            border-top: 2px solid #000;
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
            margin: 2rem 0;
            color: #666;
            font-size: 0.9rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .divider::before,
        .divider::after {
content: '';
            flex: 1;
            height: 2px;
            background: linear-gradient(90deg, transparent, rgba(0, 212, 255, 0.3), transparent);
        }

        .divider span {
            padding: 0 1rem;
            color: #999;
        }

        /* Google Button */
        .btn-google {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            color: #fff;
            font-weight: 600;
            padding: 1rem;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: all 0.3s ease;
            margin-bottom: 1.5rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-radius: 0;
        }

        .btn-google:hover {
            background: rgba(255, 255, 255, 0.2);
            border-color: #00d4ff;
            color: #00d4ff;
            transform: translateY(-2px);
            text-decoration: none;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
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
            color: #00d4ff;
            text-decoration: none;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            position: relative;
        }

        .login-footer a::after {
            content: '';
            position: absolute;
            bottom: -4px;
            left: 0;
            width: 0;
            height: 2px;
            background: #00d4ff;
            transition: width 0.3s ease;
        }

        .login-footer a:hover::after {
            width: 100%;
        }

        .login-footer a:hover {
            color: #fff;
            text-decoration: none;
        }

        .login-footer p {
            margin-bottom: 0.5rem;
            color: #999;
        }

        /* Back to Home */
        .back-to-home {
            position: fixed;
            top: 2rem;
            left: 2rem;
            background: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(10px);
            border: 2px solid rgba(0, 212, 255, 0.3);
            color: #00d4ff;
            padding: 0.75rem 1rem;
            text-decoration: none;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            z-index: 100;
            font-size: 0.9rem;
            border-radius: 0;
        }

        .back-to-home:hover {
background: rgba(0, 212, 255, 0.1);
            color: #fff;
            border-color: #00d4ff;
            transform: translateY(-2px);
            text-decoration: none;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        .back-to-home i {
            margin-right: 0.5rem;
        }

        /* Responsive Design */
        @media (max-width: 576px) {
            .login-container {
                padding: 1rem;
            }

            .login-card {
                padding: 2rem 1.5rem;
            }

            .login-title {
                font-size: 2rem;
                letter-spacing: 2px;
            }

            .back-to-home {
                top: 1rem;
                left: 1rem;
                padding: 0.5rem 0.75rem;
                font-size: 0.8rem;
            }

            .bg-element {
                display: none;
            }
        }

        /* Form Validation */
        .was-validated .form-control:invalid {
            border-color: #dc3545;
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }

        /* Focus States */
        .form-control:focus,
        .btn-login:focus,
        .btn-google:focus {
            outline: 2px solid #00d4ff;
            outline-offset: 2px;
        }
    </style>
</head>
<body>
    <!-- Animated Background Elements -->
    <div class="bg-element"></div>
    <div class="bg-element"></div>
    <div class="bg-element"></div>

    <!-- Back to Home Button -->
    <a href="${pageContext.request.contextPath}/home" class="back-to-home">
        <i class="bi bi-arrow-left"></i>
        Back to Home
    </a>

    <div class="login-container">
        <div class="login-card">
            <!-- Brand Header -->
            <div class="brand-header">
                <div class="brand-logo">
                    <i class="bi bi-lightning-charge-fill"></i>
                </div>
                <h1 class="login-title">Login</h1>
                <p class="login-subtitle">Unleash Your Style</p>
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
                        Email / Username
                    </label>
                    <input type="text" class="form-control" id="email" name="email" required
                           placeholder="Enter your email or username"
                           autocomplete="username">
                    <i class="bi bi-person input-icon"></i>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">
                        Password
                    </label>
                    <input type="password" class="form-control" id="password" name="password" required
                           placeholder="Enter your password"
                           autocomplete="current-password">
                    <i class="bi bi-lock input-icon"></i>
                    <button type="button" class="password-toggle" onclick="togglePassword()">
                        <i class="bi bi-eye" id="passwordToggleIcon"></i>
                    </button>
                </div>

                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                    <label class="form-check-label" for="rememberMe">
                        Remember me
                    </label>
                </div>

                <button type="submit" class="btn btn-login" id="loginBtn">
                    <i class="bi bi-box-arrow-in-right me-2"></i>
                    Sign In
                </button>
            </form>

            <!-- Divider -->
            <div class="divider">
                <span>or sign in with</span>
            </div>

            <!-- Google Login -->
            <a href="${pageContext.request.contextPath}/login-google" class="btn-google">
                <div class="google-logo"></div>
                Continue with Google
            </a>

            <!-- Footer Links -->
            <div class="login-footer">
                <p>
                    <a href="${pageContext.request.contextPath}/forgot-password">
                        Forgot Password?
                    </a>
                </p>
                <p>
                    New to FashionShop? 
                    <a href="${pageContext.request.contextPath}/register">
                        Create Account
                    </a>
                </p>
            </div>
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

        // Add loading animation for demo
        document.querySelector('.login-form').addEventListener('submit', function(e) {
            const btn = document.getElementById('loginBtn');
            if (!btn.classList.contains('loading')) {
                btn.classList.add('loading');
                setTimeout(() => {
btn.classList.remove('loading');
                }, 2000);
            }
        });

        // Add entrance animations to form elements
        document.addEventListener('DOMContentLoaded', function() {
            const elements = document.querySelectorAll('.form-group, .form-check, .btn-login, .btn-google, .login-footer');
            elements.forEach((element, index) => {
                element.style.opacity = '0';
                element.style.transform = 'translateY(20px)';
                element.style.transition = 'all 0.5s ease';
                
                setTimeout(() => {
                    element.style.opacity = '1';
                    element.style.transform = 'translateY(0)';
                }, 300 + (index * 100));
            });
        });
    </script>
</body>
</html>