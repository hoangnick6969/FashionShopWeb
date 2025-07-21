<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đã xảy ra lỗi - FashionShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    
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
            position: relative;
            overflow-x: hidden;
        }

        /* Animated Background Elements */
        body::before {
            content: '';
            position: fixed;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="rgba(0,0,0,0.02)" stroke-width="1"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
            animation: drift 30s infinite linear;
            pointer-events: none;
            z-index: -1;
        }

        @keyframes drift {
0% { transform: translateX(-50px) translateY(-50px); }
            100% { transform: translateX(-50px) translateY(-150px); }
        }

        /* Floating Elements */
        .bg-element {
            position: fixed;
            background: rgba(37, 99, 235, 0.08);
            border-radius: 50%;
            animation: float 8s ease-in-out infinite;
            pointer-events: none;
            z-index: -1;
        }

        .bg-element:nth-child(1) {
            width: 200px;
            height: 200px;
            top: 10%;
            left: 5%;
            animation-delay: 0s;
        }

        .bg-element:nth-child(2) {
            width: 150px;
            height: 150px;
            top: 60%;
            right: 10%;
            animation-delay: 3s;
        }

        .bg-element:nth-child(3) {
            width: 100px;
            height: 100px;
            bottom: 20%;
            left: 15%;
            animation-delay: 6s;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px) rotate(0deg);
                opacity: 0.3;
            }
            50% {
                transform: translateY(-30px) rotate(180deg);
                opacity: 0.6;
            }
        }

        /* Main Container */
        .error-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 2rem;
            position: relative;
            z-index: 10;
        }

        /* Error Card */
        .error-card {
            background: white;
            border-radius: var(--border-radius);
            padding: 3rem 2rem;
            text-align: center;
            box-shadow: var(--shadow-xl);
            border: 1px solid var(--gray-200);
            position: relative;
            overflow: hidden;
            max-width: 600px;
            width: 100%;
            animation: slideInUp 0.8s ease-out;
        }

        .error-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--danger-color), #ef4444);
        }

        /* Error Icon */
        .error-icon {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, var(--danger-color), #ef4444);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            font-size: 2.5rem;
            animation: pulse 2s infinite;
            position: relative;
        }

        .error-icon::after {
            content: '';
            position: absolute;
            top: -10px;
            left: -10px;
            right: -10px;
            bottom: -10px;
border: 2px solid rgba(220, 38, 38, 0.3);
            border-radius: 50%;
            animation: ripple 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        @keyframes ripple {
            0% {
                transform: scale(0.8);
                opacity: 1;
            }
            100% {
                transform: scale(1.4);
                opacity: 0;
            }
        }

        /* Error Title */
        .error-title {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--gray-900);
            margin-bottom: 1rem;
            background: linear-gradient(135deg, var(--danger-color), #ef4444);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Error Message */
        .error-message {
            color: var(--gray-600);
            font-size: 1.1rem;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        /* Error Details */
        .error-details {
            background: var(--gray-50);
            border: 1px solid var(--gray-200);
            border-radius: var(--border-radius-sm);
            padding: 1.5rem;
            margin: 2rem 0;
            text-align: left;
        }

        .error-details h6 {
            color: var(--gray-700);
            font-weight: 600;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .error-details small {
            color: var(--gray-600);
            font-family: 'Courier New', monospace;
            background: white;
            padding: 0.5rem;
            border-radius: 0.25rem;
            border: 1px solid var(--gray-200);
            display: block;
            margin-top: 0.5rem;
        }

        /* Action Buttons */
        .error-actions {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.75rem 2rem;
            border-radius: var(--border-radius-sm);
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
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
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
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        /* Support Section */
        .support-section {
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid var(--gray-200);
            text-align: center;
        }

        .support-title {
            color: var(--gray-600);
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .support-links {
            display: flex;
            justify-content: center;
            gap: 2rem;
            flex-wrap: wrap;
        }

        .support-link {
            color: var(--primary-color);
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.25rem;
            transition: var(--transition);
        }

        .support-link:hover {
            color: var(--primary-dark);
            text-decoration: none;
            transform: translateY(-1px);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .error-container {
                padding: 1rem;
            }

            .error-card {
                padding: 2rem 1.5rem;
                margin: 1rem 0;
            }

            .error-title {
                font-size: 2rem;
            }

            .error-actions {
                flex-direction: column;
                align-items: center;
            }

            .btn {
                width: 100%;
                max-width: 300px;
                justify-content: center;
            }

            .support-links {
                flex-direction: column;
                gap: 1rem;
            }

            .bg-element {
                display: none;
            }
        }

        /* Animation */
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

        /* Focus States */
        .btn:focus {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }
/* Loading State */
        .loading {
            pointer-events: none;
            opacity: 0.7;
        }

        .loading::after {
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
    </style>
</head>
<body>
    <!-- Animated Background Elements -->
    <div class="bg-element"></div>
    <div class="bg-element"></div>
    <div class="bg-element"></div>

    <div class="error-container">
        <div class="error-card">
            <!-- Error Icon -->
            <div class="error-icon">
                <i class="bi bi-exclamation-triangle"></i>
            </div>

            <!-- Error Title -->
            <h1 class="error-title">Đã xảy ra lỗi</h1>

            <!-- Error Message -->
            <p class="error-message">
                <strong>Xin lỗi!</strong> Có vẻ như đã xảy ra sự cố không mong muốn. 
                Vui lòng kiểm tra lại thao tác của bạn hoặc thử lại sau ít phút.
            </p>

            <!-- Error Details (if available) -->
            <c:if test="${not empty errorMessage || not empty exception}">
                <div class="error-details">
                    <h6>
                        <i class="bi bi-info-circle"></i>
                        Thông tin chi tiết:
                    </h6>
                    <c:if test="${not empty errorMessage}">
                        <small>${errorMessage}</small>
                    </c:if>
                    <c:if test="${not empty exception}">
                        <small>${exception.message}</small>
                    </c:if>
                </div>
            </c:if>

            <!-- Action Buttons -->
            <div class="error-actions">
                <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">
                    <i class="bi bi-house-fill"></i>
                    Về trang chủ
                </a>

                <a href="javascript:history.back()" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i>
                    Quay lại
                </a>
            </div>

            <!-- Support Section -->
            <div class="support-section">
                <p class="support-title">
                    Nếu vấn đề vẫn tiếp tục, vui lòng liên hệ với chúng tôi:
                </p>
                <div class="support-links">
                    <a href="${pageContext.request.contextPath}/contact" class="support-link">
<i class="bi bi-envelope"></i>
                        Liên hệ hỗ trợ
                    </a>
                    <a href="tel:+84123456789" class="support-link">
                        <i class="bi bi-telephone"></i>
                        Hotline: 0123-456-789
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
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

            // Keyboard shortcuts
            document.addEventListener('keydown', function(event) {
                if (event.key === 'Escape') {
                    history.back();
                } else if (event.key === 'Enter' && event.ctrlKey) {
                    window.location.href = '${pageContext.request.contextPath}/home';
                }
            });

            // Add loading state to navigation buttons
            document.querySelectorAll('.btn').forEach(btn => {
                btn.addEventListener('click', function(e) {
                    if (this.href && !this.href.includes('javascript:')) {
                        this.classList.add('loading');
                        setTimeout(() => {
                            this.classList.remove('loading');
                        }, 2000);
                    }
                });
            });

            // Auto-refresh suggestion after 30 seconds
            setTimeout(function() {
                const supportSection = document.querySelector('.support-section');
const refreshSuggestion = document.createElement('div');
                refreshSuggestion.className = 'mt-3 p-3 bg-light border border-info rounded';
                refreshSuggestion.innerHTML = `
                    <div class="d-flex align-items-center justify-content-center gap-2">
                        <i class="bi bi-arrow-clockwise text-info"></i>
                        <span class="text-muted">Bạn có muốn thử tải lại trang?</span>
                        <button class="btn btn-sm btn-outline-info" onclick="location.reload()">
                            <i class="bi bi-arrow-clockwise"></i>
                            Tải lại
                        </button>
                    </div>
                `;
                supportSection.appendChild(refreshSuggestion);
            }, 30000);

            // Dynamic background elements
            const elements = document.querySelectorAll('.bg-element');
            elements.forEach((element, index) => {
                const randomDelay = Math.random() * 2;
                element.style.animationDelay = `${randomDelay}s`;
                
                setInterval(() => {
                    const randomScale = 0.8 + Math.random() * 0.4;
                    element.style.transform = `scale(${randomScale})`;
                }, 3000 + index * 1000);
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
    </script>
</body>
</html>