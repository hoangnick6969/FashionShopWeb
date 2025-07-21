
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi mật khẩu - FashionShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2563eb;
            --primary-light: #3b82f6;
            --primary-dark: #1d4ed8;
            --success-color: #059669;
            --error-color: #dc2626;
            --warning-color: #d97706;
            --text-primary: #1f2937;
            --text-secondary: #6b7280;
            --bg-soft: #f8fafc;
            --border-light: #e5e7eb;
            --shadow-soft: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);
            --shadow-medium: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --shadow-large: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            --transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            margin: 0;
            padding: 0;
            color: var(--text-primary);
            line-height: 1.6;
        }

        .change-password-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }

        .change-password-card {
            background: white;
            border-radius: 1rem;
            box-shadow: var(--shadow-large);
            width: 100%;
            max-width: 480px;
            overflow: hidden;
            position: relative;
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-light));
            color: white;
            padding: 2rem 2rem 1.5rem;
            text-align: center;
            position: relative;
        }

        .card-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.05'%3E%3Ccircle cx='30' cy='30' r='30'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E") repeat;
            opacity: 0.1;
        }

        .header-icon {
            width: 60px;
            height: 60px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            font-size: 1.5rem;
            position: relative;
            z-index: 1;
        }

        .header-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 1;
        }

        .header-subtitle {
            font-size: 0.9rem;
            opacity: 0.9;
            margin: 0;
            position: relative;
            z-index: 1;
        }

        .card-body {
            padding: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-label {
            display: block;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--text-primary);
            font-size: 0.875rem;
            letter-spacing: 0.025em;
        }

        .form-control-wrapper {
            position: relative;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.75rem;
            border: 2px solid var(--border-light);
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: var(--transition);
            background: white;
            color: var(--text-primary);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        }

        .form-control.is-invalid {
            border-color: var(--error-color);
            background-image: none;
        }

        .form-control.is-invalid:focus {
            box-shadow: 0 0 0 3px rgba(220, 38, 38, 0.1);
        }

        .form-control.is-valid {
            border-color: var(--success-color);
        }

        .form-control.is-valid:focus {
            box-shadow: 0 0 0 3px rgba(5, 150, 105, 0.1);
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-secondary);
            font-size: 1.1rem;
            transition: var(--transition);
            z-index: 2;
        }

        .form-control:focus + .input-icon {
            color: var(--primary-color);
        }

        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: var(--text-secondary);
            cursor: pointer;
            padding: 0.25rem;
            border-radius: 0.25rem;
            transition: var(--transition);
            z-index: 2;
        }

        .password-toggle:hover {
            color: var(--primary-color);
            background: rgba(37, 99, 235, 0.05);
        }

        .password-strength {
            margin-top: 0.5rem;
            display: none;
        }

        .strength-bar {
            height: 4px;
            background: var(--border-light);
            border-radius: 2px;
            overflow: hidden;
            margin-bottom: 0.5rem;
        }

        .strength-fill {
            height: 100%;
            transition: var(--transition);
            border-radius: 2px;
        }

        .strength-text {
            font-size: 0.75rem;
            color: var(--text-secondary);
        }

        .alert {
            padding: 1rem;
            border-radius: 0.5rem;
            margin-bottom: 1.5rem;
            border: none;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .alert-success {
            background: rgba(5, 150, 105, 0.1);
            color: var(--success-color);
        }

        .alert-danger {
            background: rgba(220, 38, 38, 0.1);
            color: var(--error-color);
        }

        .alert-icon {
            font-size: 1.25rem;
        }

        .btn-primary {
            width: 100%;
            padding: 0.875rem 1.5rem;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-light));
            border: none;
            border-radius: 0.5rem;
            color: white;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: var(--transition);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            position: relative;
            overflow: hidden;
        }

        .btn-primary:hover {
            transform: translateY(-1px);
            box-shadow: var(--shadow-medium);
            background: linear-gradient(135deg, var(--primary-dark), var(--primary-color));
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        .btn-primary:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        .btn-loading {
            color: transparent;
        }

        .btn-loading::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            top: 50%;
            left: 50%;
            margin-left: -10px;
            margin-top: -10px;
            border: 2px solid transparent;
            border-top-color: white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--text-secondary);
            text-decoration: none;
            font-size: 0.875rem;
            font-weight: 500;
            margin-top: 1.5rem;
            transition: var(--transition);
        }

        .back-link:hover {
            color: var(--primary-color);
            text-decoration: none;
        }

        .security-tips {
            background: var(--bg-soft);
            border-radius: 0.5rem;
            padding: 1rem;
            margin-top: 1.5rem;
        }

        .security-tips h6 {
            color: var(--text-primary);
            font-size: 0.875rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .security-tips ul {
            margin: 0;
            padding-left: 1.25rem;
            list-style: none;
        }

        .security-tips li {
            font-size: 0.75rem;
            color: var(--text-secondary);
            margin-bottom: 0.25rem;
            position: relative;
        }

        .security-tips li::before {
            content: '•';
            color: var(--primary-color);
            position: absolute;
            left: -1rem;
        }

        /* Responsive Design */
        @media (max-width: 576px) {
            .change-password-container {
                padding: 1rem;
            }

            .card-body {
                padding: 1.5rem;
            }

            .card-header {
                padding: 1.5rem 1.5rem 1rem;
            }

            .header-title {
                font-size: 1.25rem;
            }
        }

        /* Form validation feedback */
        .invalid-feedback {
            display: block;
            width: 100%;
            margin-top: 0.25rem;
            font-size: 0.75rem;
            color: var(--error-color);
            font-weight: 500;
        }

        .valid-feedback {
            display: block;
            width: 100%;
            margin-top: 0.25rem;
            font-size: 0.75rem;
            color: var(--success-color);
            font-weight: 500;
        }

        /* Animation for form appearance */
        .change-password-card {
            animation: slideInUp 0.4s cubic-bezier(0.4, 0, 0.2, 1);
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
    </style>
</head>
<body>
    <div class="change-password-container">
        <div class="change-password-card">
            <div class="card-header">
                <div class="header-icon">
                    <i class="bi bi-shield-lock"></i>
                </div>
                <h1 class="header-title">Đổi mật khẩu</h1>
                <p class="header-subtitle">Cập nhật mật khẩu để bảo vệ tài khoản của bạn</p>
            </div>

            <div class="card-body">
                <!-- Alert Messages -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">
                        <i class="bi bi-exclamation-triangle-fill alert-icon"></i>
                        <span>${error}</span>
                    </div>
                </c:if>

                <c:if test="${not empty success}">
                    <div class="alert alert-success">
                        <i class="bi bi-check-circle-fill alert-icon"></i>
                        <span>${success}</span>
                    </div>
                </c:if>

                <form id="changePasswordForm" action="${pageContext.request.contextPath}/change-password" method="post" novalidate>
                    <!-- Current Password -->
                    <div class="form-group">
                        <label for="currentPassword" class="form-label">
                            <i class="bi bi-lock-fill me-1"></i>
                            Mật khẩu hiện tại
                        </label>
                        <div class="form-control-wrapper">
                            <input type="password" 
                                   id="currentPassword" 
                                   name="currentPassword" 
                                   class="form-control" 
                                   placeholder="Nhập mật khẩu hiện tại"
                                   required
                                   autocomplete="current-password">
                            <i class="bi bi-key input-icon"></i>
                            <button type="button" class="password-toggle" data-target="currentPassword">
                                <i class="bi bi-eye"></i>
                            </button>
                        </div>
                        <div class="invalid-feedback"></div>
                    </div>

                    <!-- New Password -->
                    <div class="form-group">
                        <label for="newPassword" class="form-label">
                            <i class="bi bi-shield-plus me-1"></i>
                            Mật khẩu mới
                        </label>
                        <div class="form-control-wrapper">
                            <input type="password" 
                                   id="newPassword" 
                                   name="newPassword" 
                                   class="form-control" 
                                   placeholder="Nhập mật khẩu mới"
                                   required
                                   autocomplete="new-password">
                            <i class="bi bi-lock input-icon"></i>
                            <button type="button" class="password-toggle" data-target="newPassword">
                                <i class="bi bi-eye"></i>
                            </button>
                        </div>
                        <div class="password-strength" id="passwordStrength">
                            <div class="strength-bar">
                                <div class="strength-fill" id="strengthFill"></div>
                            </div>
                            <div class="strength-text" id="strengthText">Độ mạnh mật khẩu</div>
                        </div>
                        <div class="invalid-feedback"></div>
                    </div>

                    <!-- Confirm Password -->
                    <div class="form-group">
                        <label for="confirmPassword" class="form-label">
                            <i class="bi bi-shield-check me-1"></i>
                            Xác nhận mật khẩu mới
                        </label>
                        <div class="form-control-wrapper">
                            <input type="password" 
                                   id="confirmPassword" 
                                   name="confirmPassword" 
                                   class="form-control" 
                                   placeholder="Nhập lại mật khẩu mới"
                                   required
                                   autocomplete="new-password">
                            <i class="bi bi-check-square input-icon"></i>
                            <button type="button" class="password-toggle" data-target="confirmPassword">
                                <i class="bi bi-eye"></i>
                            </button>
                        </div>
                        <div class="invalid-feedback"></div>
                        <div class="valid-feedback">Mật khẩu khớp!</div>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn-primary" id="submitBtn">
                        <i class="bi bi-shield-check me-2"></i>
                        Cập nhật mật khẩu
                    </button>

                    <!-- Security Tips -->
                    <div class="security-tips">
                        <h6>
                            <i class="bi bi-info-circle"></i>
                            Lời khuyên bảo mật
                        </h6>
                        <ul>
                            <li>Sử dụng ít nhất 8 ký tự</li>
                            <li>Kết hợp chữ hoa, chữ thường, số và ký tự đặc biệt</li>
                            <li>Không sử dụng thông tin cá nhân dễ đoán</li>
                            <li>Đổi mật khẩu định kỳ để tăng cường bảo mật</li>
                        </ul>
                    </div>

                    <!-- Back Link -->
                    <a href="${pageContext.request.contextPath}/profile" class="back-link">
                        <i class="bi bi-arrow-left"></i>
                        Quay lại trang cá nhân
                    </a>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('changePasswordForm');
            const currentPassword = document.getElementById('currentPassword');
            const newPassword = document.getElementById('newPassword');
            const confirmPassword = document.getElementById('confirmPassword');
            const submitBtn = document.getElementById('submitBtn');
            const strengthIndicator = document.getElementById('passwordStrength');
            const strengthFill = document.getElementById('strengthFill');
            const strengthText = document.getElementById('strengthText');

            // Password visibility toggle
            document.querySelectorAll('.password-toggle').forEach(toggle => {
                toggle.addEventListener('click', function() {
                    const targetId = this.getAttribute('data-target');
                    const targetInput = document.getElementById(targetId);
                    const icon = this.querySelector('i');
                    
                    if (targetInput.type === 'password') {
                        targetInput.type = 'text';
                        icon.className = 'bi bi-eye-slash';
                    } else {
                        targetInput.type = 'password';
                        icon.className = 'bi bi-eye';
                    }
                });
            });

            // Password strength checker
            newPassword.addEventListener('input', function() {
                const password = this.value;
                const strength = calculatePasswordStrength(password);
                
                if (password.length > 0) {
                    strengthIndicator.style.display = 'block';
                    updateStrengthIndicator(strength);
                } else {
                    strengthIndicator.style.display = 'none';
                }
                
                validatePassword();
            });

            function calculatePasswordStrength(password) {
                let score = 0;
                
                // Length check
                if (password.length >= 8) score += 1;
                if (password.length >= 12) score += 1;
                
                // Character type checks
                if (/[a-z]/.test(password)) score += 1;
                if (/[A-Z]/.test(password)) score += 1;
                if (/[0-9]/.test(password)) score += 1;
                if (/[^A-Za-z0-9]/.test(password)) score += 1;
                
                return Math.min(score, 5);
            }

            function updateStrengthIndicator(strength) {
                const colors = ['#dc2626', '#d97706', '#d97706', '#059669', '#059669'];
                const texts = ['Rất yếu', 'Yếu', 'Trung bình', 'Mạnh', 'Rất mạnh'];
                const widths = ['20%', '40%', '60%', '80%', '100%'];
                
                strengthFill.style.backgroundColor = colors[strength - 1] || '#dc2626';
                strengthFill.style.width = widths[strength - 1] || '20%';
                strengthText.textContent = texts[strength - 1] || 'Rất yếu';
                strengthText.style.color = colors[strength - 1] || '#dc2626';
            }

            // Real-time password confirmation validation
            confirmPassword.addEventListener('input', validatePassword);

            function validatePassword() {
                const newPass = newPassword.value;
                const confirmPass = confirmPassword.value;
                
                if (confirmPass.length > 0) {
                    if (newPass === confirmPass) {
                        confirmPassword.classList.remove('is-invalid');
                        confirmPassword.classList.add('is-valid');
                        confirmPassword.nextElementSibling.style.display = 'none';
                        confirmPassword.nextElementSibling.nextElementSibling.style.display = 'block';
                    } else {
                        confirmPassword.classList.remove('is-valid');
                        confirmPassword.classList.add('is-invalid');
                        confirmPassword.nextElementSibling.textContent = 'Mật khẩu xác nhận không khớp';
                        confirmPassword.nextElementSibling.style.display = 'block';
                        confirmPassword.nextElementSibling.nextElementSibling.style.display = 'none';
                    }
                } else {
                    confirmPassword.classList.remove('is-valid', 'is-invalid');
                    confirmPassword.nextElementSibling.style.display = 'none';
                    confirmPassword.nextElementSibling.nextElementSibling.style.display = 'none';
                }
            }

            // Form submission
            form.addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Validate all fields
                let isValid = true;
                
                // Check current password
                if (!currentPassword.value.trim()) {
                    showFieldError(currentPassword, 'Vui lòng nhập mật khẩu hiện tại');
                    isValid = false;
                } else {
                    clearFieldError(currentPassword);
                }
                
                // Check new password
                if (!newPassword.value.trim()) {
                    showFieldError(newPassword, 'Vui lòng nhập mật khẩu mới');
                    isValid = false;
                } else if (newPassword.value.length < 6) {
                    showFieldError(newPassword, 'Mật khẩu phải có ít nhất 6 ký tự');
                    isValid = false;
                } else {
                    clearFieldError(newPassword);
                }
                
                // Check confirm password
                if (!confirmPassword.value.trim()) {
                    showFieldError(confirmPassword, 'Vui lòng xác nhận mật khẩu mới');
                    isValid = false;
                } else if (newPassword.value !== confirmPassword.value) {
                    showFieldError(confirmPassword, 'Mật khẩu xác nhận không khớp');
                    isValid = false;
                } else {
                    clearFieldError(confirmPassword);
                }
                
                if (isValid) {
                    // Show loading state
                    submitBtn.disabled = true;
                    submitBtn.classList.add('btn-loading');
                    
                    // Submit form after a short delay to show loading state
                    setTimeout(() => {
                        form.submit();
                    }, 500);
                }
            });

            function showFieldError(field, message) {
                field.classList.add('is-invalid');
                field.classList.remove('is-valid');
                const feedback = field.parentNode.parentNode.querySelector('.invalid-feedback');
                if (feedback) {
                    feedback.textContent = message;
                    feedback.style.display = 'block';
                }
            }

            function clearFieldError(field) {
                field.classList.remove('is-invalid');
                const feedback = field.parentNode.parentNode.querySelector('.invalid-feedback');
                if (feedback) {
                    feedback.style.display = 'none';
                }
            }

            // Auto-hide alerts after 5 seconds
            setTimeout(() => {
                const alerts = document.querySelectorAll('.alert');
                alerts.forEach(alert => {
                    alert.style.animation = 'slideOutUp 0.3s ease-in-out forwards';
                    setTimeout(() => {
                        alert.remove();
                    }, 300);
                });
            }, 5000);
        });

        // Animation for slide out
        const style = document.createElement('style');
        style.textContent = `
            @keyframes slideOutUp {
                from {
                    opacity: 1;
                    transform: translateY(0);
                }
                to {
                    opacity: 0;
                    transform: translateY(-20px);
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>
