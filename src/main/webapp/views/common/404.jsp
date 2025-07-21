<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Trang không tìm thấy | FashionShop</title>
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
        .error-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 2rem;
            position: relative;
            z-index: 10;
            text-align: center;
        }

        /* 404 Number */
        .error-number {
            font-size: clamp(8rem, 15vw, 20rem);
            font-weight: 900;
            line-height: 0.8;
            background: linear-gradient(45deg, #00d4ff, #0099cc, #00d4ff);
            background-size: 200% 100%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: shimmer 3s infinite, glitch 4s infinite;
            position: relative;
            margin-bottom: 1rem;
        }

        @keyframes shimmer {
            0% { background-position: -200% 0; }
            100% { background-position: 200% 0; }
        }

        @keyframes glitch {
            0%, 100% { transform: translate(0); }
            10% { transform: translate(-2px, -1px); }
            20% { transform: translate(2px, 1px); }
            30% { transform: translate(-1px, 2px); }
            40% { transform: translate(1px, -2px); }
            50% { transform: translate(-2px, 1px); }
            60% { transform: translate(2px, -1px); }
            70% { transform: translate(-1px, -2px); }
            80% { transform: translate(1px, 2px); }
            90% { transform: translate(-2px, -1px); }
        }

        /* Error Title */
        .error-title {
            font-size: clamp(2rem, 4vw, 4rem);
            font-weight: 800;
            margin-bottom: 1rem;
            text-transform: uppercase;
            letter-spacing: 3px;
            color: #fff;
            text-shadow: 0 0 20px rgba(0, 212, 255, 0.5);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.8; }
        }

        /* Error Subtitle */
        .error-subtitle {
            font-size: clamp(1rem, 2vw, 1.5rem);
            font-weight: 300;
            color: #999;
            margin-bottom: 3rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            max-width: 600px;
        }

        /* Glitch Effect */
        .glitch {
            position: relative;
            display: inline-block;
        }

        .glitch::before,
.glitch::after {
            content: attr(data-text);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .glitch::before {
            animation: glitchTop 1s linear infinite;
            clip-path: polygon(0 0, 100% 0, 100% 33%, 0 33%);
            -webkit-clip-path: polygon(0 0, 100% 0, 100% 33%, 0 33%);
        }

        .glitch::after {
            animation: glitchBottom 1.5s linear infinite;
            clip-path: polygon(0 67%, 100% 67%, 100% 100%, 0 100%);
            -webkit-clip-path: polygon(0 67%, 100% 67%, 100% 100%, 0 100%);
        }

        @keyframes glitchTop {
            2%, 64% { transform: translate(2px, -2px); }
            4%, 60% { transform: translate(-2px, 2px); }
            62% { transform: translate(13px, -1px) skew(-13deg); }
        }

        @keyframes glitchBottom {
            2%, 64% { transform: translate(-2px, 0); }
            4%, 60% { transform: translate(-2px, 0); }
            62% { transform: translate(-22px, 5px) skew(21deg); }
        }

        /* Action Buttons */
        .error-actions {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn-primary {
            background: linear-gradient(45deg, #00d4ff, #0099cc);
            border: none;
            color: #000;
            font-weight: 800;
            font-size: 1.1rem;
            padding: 1rem 3rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            cursor: pointer;
            border-radius: 0;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
        }

        .btn-primary::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s ease;
        }

        .btn-primary:hover::before {
            left: 100%;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 20px 40px rgba(0, 212, 255, 0.4);
            background: linear-gradient(45deg, #0099cc, #00d4ff);
            color: #000;
            text-decoration: none;
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(0, 212, 255, 0.3);
            color: #00d4ff;
            font-weight: 700;
            font-size: 1rem;
            padding: 0.875rem 2.5rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            border-radius: 0;
text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-secondary:hover {
            background: rgba(0, 212, 255, 0.1);
            border-color: #00d4ff;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            text-decoration: none;
        }

        /* Search Box */
        .search-container {
            max-width: 500px;
            width: 100%;
            margin: 2rem 0;
            position: relative;
        }

        .search-form {
            display: flex;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(20px);
            border: 2px solid rgba(0, 212, 255, 0.2);
            overflow: hidden;
        }

        .search-input {
            flex: 1;
            background: none;
            border: none;
            color: #fff;
            padding: 1rem 1.5rem;
            font-size: 1rem;
            font-weight: 500;
            outline: none;
        }

        .search-input::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .search-input:focus {
            background: rgba(0, 212, 255, 0.05);
        }

        .search-btn {
            background: linear-gradient(45deg, #00d4ff, #0099cc);
            border: none;
            color: #000;
            padding: 1rem 1.5rem;
            cursor: pointer;
            font-size: 1.2rem;
            font-weight: 700;
            transition: all 0.3s ease;
        }

        .search-btn:hover {
            background: linear-gradient(45deg, #0099cc, #00d4ff);
            transform: scale(1.05);
        }

        /* Status Indicator */
        .status-indicator {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 2rem;
            font-size: 0.9rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #ff4757;
        }

        .status-dot {
            width: 12px;
            height: 12px;
            background: #ff4757;
            border-radius: 50%;
            animation: blink 2s infinite;
        }

        @keyframes blink {
            0%, 50% { opacity: 1; }
            51%, 100% { opacity: 0.3; }
        }

        /* Back Button */
        .back-button {
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
        }

        .back-button:hover {
background: rgba(0, 212, 255, 0.1);
            color: #fff;
            border-color: #00d4ff;
            transform: translateY(-2px);
            text-decoration: none;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        }

        .back-button i {
            margin-right: 0.5rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .error-container {
                padding: 1rem;
            }

            .error-actions {
                width: 100%;
            }

            .btn-primary,
            .btn-secondary {
                width: 100%;
                max-width: 300px;
                justify-content: center;
            }

            .search-container {
                margin: 1.5rem 0;
            }

            .back-button {
                top: 1rem;
                left: 1rem;
                padding: 0.5rem 0.75rem;
                font-size: 0.8rem;
            }

            .bg-element {
                display: none;
            }
        }

        @media (max-width: 480px) {
            .error-number {
                font-size: 8rem;
            }

            .error-title {
                font-size: 1.5rem;
                letter-spacing: 1px;
            }

            .error-subtitle {
                font-size: 0.9rem;
            }

            .search-form {
                flex-direction: column;
            }

            .search-btn {
                padding: 0.75rem;
            }
        }

        /* Animation Delays */
        .error-number {
            animation-delay: 0.2s;
        }

        .error-title {
            animation-delay: 0.4s;
        }

        .error-subtitle {
            animation-delay: 0.6s;
        }

        .status-indicator {
            animation-delay: 0.8s;
        }

        .search-container {
            animation: slideInUp 0.8s ease 1s both;
        }

        .error-actions {
            animation: slideInUp 0.8s ease 1.2s both;
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

        /* Focus States */
        .btn-primary:focus,
        .btn-secondary:focus,
        .search-btn:focus,
        .search-input:focus {
            outline: 2px solid #00d4ff;
            outline-offset: 2px;
        }

        /* Loading Animation */
        .loading {
            pointer-events: none;
            opacity: 0.7;
        }

        .loading::after {
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
    </style>
</head>
<body>
    <!-- Animated Background Elements -->
    <div class="bg-element"></div>
    <div class="bg-element"></div>
    <div class="bg-element"></div>

    <!-- Back Button -->
    <a href="javascript:history.back()" class="back-button">
        <i class="bi bi-arrow-left"></i>
        Go Back
    </a>

    <div class="error-container">
        <!-- Status Indicator -->
        <div class="status-indicator">
            <div class="status-dot"></div>
            System Alert: Page Not Found
        </div>

        <!-- 404 Number with Glitch Effect -->
        <div class="error-number glitch" data-text="404">404</div>
        
        <!-- Error Title -->
        <h1 class="error-title">Page Not Found</h1>
        
        <!-- Error Subtitle -->
        <p class="error-subtitle">
            The page you're looking for has been moved, deleted, or doesn't exist in our digital universe.
        </p>

        <!-- Search Box -->
        <div class="search-container">
            <form class="search-form" action="${pageContext.request.contextPath}/search" method="get">
                <input type="text" name="query" class="search-input" 
                       placeholder="Search for products, categories..." 
                       autocomplete="off">
                <button type="submit" class="search-btn">
                    <i class="bi bi-search"></i>
                </button>
            </form>
        </div>

        <!-- Action Buttons -->
        <div class="error-actions">
            <a href="${pageContext.request.contextPath}/home" class="btn-primary">
                <i class="bi bi-house-fill"></i>
                Return Home
            </a>
            
            <a href="${pageContext.request.contextPath}/products" class="btn-secondary">
                <i class="bi bi-grid-3x3-gap-fill"></i>
                Browse Products
            </a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Enhanced interactions
        document.addEventListener('DOMContentLoaded', function() {
            // Add ripple effect to buttons
            document.querySelectorAll('.btn-primary, .btn-secondary').forEach(button => {
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

            // Auto-focus search input
            const searchInput = document.querySelector('.search-input');
            if (searchInput) {
                setTimeout(() => searchInput.focus(), 2000);
            }

            // Keyboard shortcuts
            document.addEventListener('keydown', function(event) {
                if (event.key === 'Escape') {
                    history.back();
                } else if (event.key === 'Enter' && event.ctrlKey) {
                    window.location.href = '${pageContext.request.contextPath}/home';
                } else if (event.key === '/' && !event.ctrlKey && !event.altKey) {
                    event.preventDefault();
                    searchInput?.focus();
                }
            });

            // Add loading state to search
            document.querySelector('.search-form')?.addEventListener('submit', function(e) {
                const btn = this.querySelector('.search-btn');
                btn.classList.add('loading');
                btn.disabled = true;
                
                setTimeout(() => {
                    btn.classList.remove('loading');
                    btn.disabled = false;
                }, 2000);
            });

            // Add entrance animations with staggered timing
            const elements = document.querySelectorAll('.error-number, .error-title, .error-subtitle, .status-indicator');
            elements.forEach((element, index) => {
                element.style.opacity = '0';
                element.style.transform = 'translateY(30px)';
                element.style.transition = 'all 0.8s ease';
                
                setTimeout(() => {
                    element.style.opacity = '1';
                    element.style.transform = 'translateY(0)';
                }, 200 + (index * 200));
            });

            // Dynamic glitch effect intensity
            const glitchElement = document.querySelector('.glitch');
            let glitchIntensity = 1;
            
            setInterval(() => {
                glitchIntensity = Math.random() > 0.7 ? 2 : 1;
                glitchElement.style.animationDuration = `${4 / glitchIntensity}s`;
            }, 3000);

            // Error code typing effect
const errorNumber = document.querySelector('.error-number');
            const originalText = errorNumber.textContent;
            errorNumber.textContent = '';
            
            let i = 0;
            const typingInterval = setInterval(() => {
                if (i < originalText.length) {
                    errorNumber.textContent += originalText.charAt(i);
                    i++;
                } else {
                    clearInterval(typingInterval);
                }
            }, 200);
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

        // Console easter egg
        console.log('%c404 - Lost in the digital void!', 
                   'color: #00d4ff; font-size: 24px; font-weight: bold;');
        console.log('%cLooks like you found a page that doesn\'t exist. Try searching for what you need!', 
                   'color: #999; font-size: 14px;');
    </script>
</body>
</html>