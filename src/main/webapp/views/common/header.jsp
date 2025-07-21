<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FashionShop - Athletic & Streetwear</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
    
    <style>
        :root {
            --primary-cyan: #00d4ff;
            --primary-dark: #0099cc;
            --bg-dark: #000;
            --bg-dark-secondary: #111;
            --bg-dark-tertiary: #1a1a1a;
            --text-light: #fff;
            --text-gray: #ccc;
            --text-dark-gray: #999;
            --shadow-glow: 0 0 20px rgba(0, 212, 255, 0.3);
            --shadow-strong: 0 8px 30px rgba(0, 0, 0, 0.5);
            --transition-smooth: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: var(--bg-dark);
            color: var(--text-light);
        }

        /* Athletic Header Design */
        .athletic-header {
            background: linear-gradient(135deg, rgba(0, 0, 0, 0.95) 0%, rgba(26, 26, 26, 0.9) 100%);
            backdrop-filter: blur(20px) saturate(180%);
            border-bottom: 1px solid rgba(0, 212, 255, 0.1);
            box-shadow: var(--shadow-strong);
            transition: var(--transition-smooth);
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1050;
        }

        .athletic-header.scrolled {
            background: linear-gradient(135deg, rgba(0, 0, 0, 0.98) 0%, rgba(17, 17, 17, 0.95) 100%);
            box-shadow: var(--shadow-glow);
        }

        /* Brand Enhancement */
        .brand-container {
            display: flex;
            align-items: center;
            transition: var(--transition-smooth);
        }

        .brand-container:hover {
            transform: translateY(-2px) scale(1.02);
        }

        .brand-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, var(--primary-cyan), var(--primary-dark));
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            box-shadow: var(--shadow-glow);
            position: relative;
            overflow: hidden;
            transition: var(--transition-smooth);
        }

        .brand-icon::before {
            content: '';
position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.3), transparent);
            transform: rotate(-45deg) translateX(-100%);
            transition: transform 0.6s ease;
        }

        .brand-container:hover .brand-icon::before {
            transform: rotate(-45deg) translateX(100%);
        }

        .brand-icon i {
            color: var(--bg-dark);
            font-size: 1.5rem;
            font-weight: 900;
            z-index: 1;
        }

        .brand-text {
            color: var(--text-light);
            font-size: 1.8rem;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: 2px;
            background: linear-gradient(45deg, var(--text-light), var(--primary-cyan));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-decoration: none;
            transition: var(--transition-smooth);
        }

        .brand-text:hover {
            -webkit-text-fill-color: var(--primary-cyan);
            color: var(--primary-cyan);
        }

        /* Navigation Links */
        .nav-link {
            color: var(--text-gray) !important;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.9rem;
            padding: 0.8rem 1.5rem !important;
            margin: 0 0.2rem;
            border-radius: 8px;
            transition: var(--transition-smooth);
            position: relative;
            overflow: hidden;
        }

        .nav-link::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(0, 212, 255, 0.1), rgba(0, 153, 204, 0.05));
            transition: left 0.3s ease;
            z-index: -1;
        }

        .nav-link:hover::before {
            left: 0;
        }

        .nav-link:hover {
            color: var(--primary-cyan) !important;
            transform: translateY(-2px);
            text-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
        }

        .nav-link.active {
            color: var(--primary-cyan) !important;
            background: rgba(0, 212, 255, 0.1);
            box-shadow: inset 0 2px 4px rgba(0, 212, 255, 0.2);
        }

        .nav-link i {
            margin-right: 8px;
            font-size: 1.1rem;
            transition: var(--transition-smooth);
        }

        .nav-link:hover i {
            transform: scale(1.2) rotate(-5deg);
        }

        /* Dropdown Enhancement */
        .dropdown-menu {
            background: linear-gradient(135deg, rgba(17, 17, 17, 0.98), rgba(0, 0, 0, 0.95));
            backdrop-filter: blur(20px);
            border: 1px solid rgba(0, 212, 255, 0.2);
border-radius: 12px;
            box-shadow: var(--shadow-strong);
            padding: 0.75rem 0;
            animation: slideInDown 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(-15px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .dropdown-item {
            color: var(--text-gray);
            padding: 0.8rem 1.5rem;
            font-weight: 500;
            transition: var(--transition-smooth);
            border-radius: 8px;
            margin: 0.2rem 0.5rem;
            position: relative;
            overflow: hidden;
        }

        .dropdown-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, var(--primary-cyan), var(--primary-dark));
            transition: left 0.3s ease;
            z-index: -1;
        }

        .dropdown-item:hover::before {
            left: 0;
        }

        .dropdown-item:hover {
            color: var(--bg-dark);
            transform: translateX(8px);
            font-weight: 600;
        }

        /* User Menu */
        .user-avatar {
            width: 45px;
            height: 45px;
            background: linear-gradient(135deg, var(--primary-cyan), var(--primary-dark));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            font-weight: 900;
            color: var(--bg-dark);
            box-shadow: var(--shadow-glow);
            transition: var(--transition-smooth);
            position: relative;
            overflow: hidden;
        }

        .user-avatar::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.2), transparent);
            transform: rotate(45deg) translateX(-100%);
            transition: transform 0.6s ease;
        }

        .dropdown-toggle:hover .user-avatar::before {
            transform: rotate(45deg) translateX(100%);
        }

        .dropdown-toggle:hover .user-avatar {
            transform: scale(1.1);
            box-shadow: 0 0 30px rgba(0, 212, 255, 0.6);
        }

        .user-name {
            color: var(--text-light);
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-left: 10px;
        }

        /* Cart Enhancement */
        .cart-container {
            position: relative;
            transition: var(--transition-smooth);
        }

        .cart-container:hover {
transform: translateY(-2px);
        }

        .cart-icon {
            font-size: 1.5rem;
            color: var(--text-light);
            transition: var(--transition-smooth);
        }

        .cart-container:hover .cart-icon {
            color: var(--primary-cyan);
            text-shadow: 0 0 15px rgba(0, 212, 255, 0.8);
        }

        .cart-badge {
            position: absolute;
            top: -8px;
            right: -8px;
            background: linear-gradient(135deg, #ff6b6b, #ee5a24);
            color: white;
            border-radius: 50%;
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.7rem;
            font-weight: 900;
            box-shadow: 0 2px 10px rgba(255, 107, 107, 0.5);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(255, 107, 107, 0.7);
            }
            70% {
                box-shadow: 0 0 0 10px rgba(255, 107, 107, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(255, 107, 107, 0);
            }
        }

        .cart-text {
            color: var(--text-light);
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-left: 8px;
        }

        /* Mobile Menu */
        .navbar-toggler {
            border: none;
            padding: 0.5rem;
            border-radius: 8px;
            background: rgba(0, 212, 255, 0.1);
            transition: var(--transition-smooth);
        }

        .navbar-toggler:focus {
            box-shadow: 0 0 0 0.2rem rgba(0, 212, 255, 0.25);
        }

        .hamburger-menu {
            width: 28px;
            height: 20px;
            position: relative;
            transform: rotate(0deg);
            transition: 0.5s ease-in-out;
            cursor: pointer;
        }

        .hamburger-menu span {
            display: block;
            position: absolute;
            height: 3px;
            width: 100%;
            background: var(--primary-cyan);
            border-radius: 2px;
            opacity: 1;
            left: 0;
            transform: rotate(0deg);
            transition: 0.25s ease-in-out;
        }

        .hamburger-menu span:nth-child(1) {
            top: 0px;
        }

        .hamburger-menu span:nth-child(2) {
            top: 8px;
        }

        .hamburger-menu span:nth-child(3) {
            top: 16px;
        }

        .navbar-toggler[aria-expanded="true"] .hamburger-menu span:nth-child(1) {
            top: 8px;
            transform: rotate(135deg);
        }

        .navbar-toggler[aria-expanded="true"] .hamburger-menu span:nth-child(2) {
            opacity: 0;
            left: -60px;
        }

        .navbar-toggler[aria-expanded="true"] .hamburger-menu span:nth-child(3) {
            top: 8px;
transform: rotate(-135deg);
        }

        /* Auth Buttons */
        .auth-btn {
            background: transparent;
            border: 2px solid var(--primary-cyan);
            color: var(--primary-cyan);
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 0.6rem 1.5rem;
            border-radius: 8px;
            text-decoration: none;
            transition: var(--transition-smooth);
            position: relative;
            overflow: hidden;
        }

        .auth-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, var(--primary-cyan), var(--primary-dark));
            transition: left 0.3s ease;
            z-index: -1;
        }

        .auth-btn:hover::before {
            left: 0;
        }

        .auth-btn:hover {
            color: var(--bg-dark);
            border-color: transparent;
            transform: translateY(-2px);
            box-shadow: var(--shadow-glow);
            text-decoration: none;
        }

        .auth-btn.register {
            background: linear-gradient(135deg, var(--primary-cyan), var(--primary-dark));
            color: var(--bg-dark);
            border-color: var(--primary-cyan);
        }

        .auth-btn.register:hover {
            background: linear-gradient(135deg, var(--primary-dark), var(--primary-cyan));
            transform: translateY(-2px) scale(1.05);
        }

        /* Mobile Responsive */
        @media (max-width: 991px) {
            .navbar-collapse {
                background: linear-gradient(145deg, rgba(17, 17, 17, 0.98), rgba(0, 0, 0, 0.95));
                border-radius: 12px;
                padding: 2rem;
                margin-top: 1rem;
                box-shadow: var(--shadow-strong);
                backdrop-filter: blur(20px);
                border: 1px solid rgba(0, 212, 255, 0.2);
                animation: slideInDown 0.3s ease;
            }

            .nav-link {
                margin: 0.5rem 0;
                text-align: center;
                border-radius: 8px;
            }

            .brand-text {
                font-size: 1.5rem;
            }

            .brand-icon {
                width: 40px;
                height: 40px;
                margin-right: 10px;
            }
        }

        /* Accessibility */
        .nav-link:focus,
        .dropdown-item:focus,
        .navbar-toggler:focus {
            outline: 2px solid var(--primary-cyan);
            outline-offset: 2px;
        }

        /* Performance Optimization */
        .navbar-nav {
            will-change: transform;
        }

        /* Loading State */
        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
background: rgba(0, 0, 0, 0.9);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
            opacity: 0;
            visibility: hidden;
            transition: var(--transition-smooth);
        }

        .loading-overlay.active {
            opacity: 1;
            visibility: visible;
        }

        .loading-spinner {
            width: 60px;
            height: 60px;
            border: 4px solid rgba(0, 212, 255, 0.3);
            border-radius: 50%;
            border-top: 4px solid var(--primary-cyan);
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>

<!-- Athletic Navigation Header -->
<nav class="navbar navbar-expand-lg athletic-header">
    <div class="container">
        <!-- Athletic Brand -->
        <a class="navbar-brand brand-container" href="${pageContext.request.contextPath}/home">
            <div class="brand-icon">
                <i class="bi bi-lightning-charge"></i>
            </div>
            <span class="brand-text">FashionShop</span>
        </a>

        <!-- Mobile Menu Toggle -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#athleticNav" 
                aria-controls="athleticNav" aria-expanded="false" aria-label="Toggle navigation">
            <div class="hamburger-menu">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </button>

        <!-- Navigation Menu -->
        <div class="collapse navbar-collapse" id="athleticNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/home">
                        <i class="bi bi-house"></i>Home
                    </a>
                </li>
                
                <c:forEach var="cate" items="${categories}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/products?cid=${cate.id}">
                            <i class="bi bi-tag"></i>${cate.name}
                        </a>
                    </li>
                </c:forEach>
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="shopDropdown" role="button" data-bs-toggle="dropdown">
                        <i class="bi bi-shop"></i>Shop
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/products">
                            <i class="bi bi-grid-3x3-gap me-2"></i>All Products
                        </a></li>
<li><a class="dropdown-item" href="${pageContext.request.contextPath}/products?sort=newest">
                            <i class="bi bi-star me-2"></i>New Arrivals
                        </a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/products?sort=bestseller">
                            <i class="bi bi-fire me-2"></i>Best Sellers
                        </a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/products?sale=true">
                            <i class="bi bi-percent me-2"></i>On Sale
                        </a></li>
                    </ul>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/blog">
                        <i class="bi bi-journal-text"></i>Blog
                    </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/contact">
                        <i class="bi bi-envelope"></i>Contact
                    </a>
                </li>
            </ul>

            <!-- User Menu & Actions -->
            <div class="navbar-nav ms-auto d-flex align-items-center">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <div class="nav-item dropdown me-4">
                            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="userDropdown" 
                               role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <div class="user-avatar">
                                    ${sessionScope.user.name.substring(0,1).toUpperCase()}
                                </div>
                                <span class="user-name d-none d-lg-block">${sessionScope.user.name}</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile">
                                    <i class="bi bi-person-gear me-2"></i>My Account
                                </a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/order-history">
                                    <i class="bi bi-clock-history me-2"></i>Order History
                                </a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/wishlist">
                                    <i class="bi bi-heart me-2"></i>Wishlist
                                </a></li>
                                <li><hr class="dropdown-divider"></li>
<li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout">
                                    <i class="bi bi-box-arrow-right me-2"></i>Logout
                                </a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a class="auth-btn me-3" href="${pageContext.request.contextPath}/login">
                            <i class="bi bi-box-arrow-in-right me-1"></i>Login
                        </a>
                        <a class="auth-btn register" href="${pageContext.request.contextPath}/register">
                            <i class="bi bi-person-plus me-1"></i>Register
                        </a>
                    </c:otherwise>
                </c:choose>

                <!-- Athletic Cart -->
                <a class="nav-link cart-container ms-4" href="${pageContext.request.contextPath}/cart">
                    <div class="d-flex align-items-center">
                        <i class="bi bi-bag cart-icon"></i>
                        <span class="cart-text d-none d-lg-block">Cart</span>
                        <span class="cart-badge">3</span>
                    </div>
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- Loading Overlay -->
<div class="loading-overlay" id="loadingOverlay">
    <div class="loading-spinner"></div>
</div>

<!-- Main Content Container -->
<div class="main-content">

<script>
// Enhanced scroll effects for athletic header
let lastScrollTop = 0;
const athleticHeader = document.querySelector('.athletic-header');

window.addEventListener('scroll', function() {
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    
    // Add scrolled class for background change
    if (scrollTop > 50) {
        athleticHeader.classList.add('scrolled');
    } else {
        athleticHeader.classList.remove('scrolled');
    }
    
    lastScrollTop = scrollTop <= 0 ? 0 : scrollTop;
});

// Enhanced mobile menu interactions
document.querySelectorAll('.navbar-nav .nav-link').forEach(link => {
    link.addEventListener('click', () => {
        const navbarCollapse = document.querySelector('.navbar-collapse');
        if (navbarCollapse.classList.contains('show')) {
            document.querySelector('.navbar-toggler').click();
        }
    });
});

// Cart badge animation
function updateCartBadge(count) {
    const badge = document.querySelector('.cart-badge');
    badge.style.animation = 'none';
    badge.textContent = count;
    setTimeout(() => {
        badge.style.animation = 'pulse 2s infinite';
    }, 10);
}

// Enhanced loading states
function showLoading() {
    document.getElementById('loadingOverlay').classList.add('active');
}

function hideLoading() {
    document.getElementById('loadingOverlay').classList.remove('active');
}

// Navigation link active state management
document.addEventListener('DOMContentLoaded', function() {
    const currentPath = window.location.pathname;
    const navLinks = document.querySelectorAll('.nav-link');
    
    navLinks.forEach(link => {
        const linkPath = new URL(link.href).pathname;
        if (currentPath === linkPath || currentPath.startsWith(linkPath + '/')) {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });
    
    // Hide loading after page load
    setTimeout(hideLoading, 500);
});

// Enhanced dropdown interactions
document.querySelectorAll('.dropdown-item').forEach(item => {
    item.addEventListener('mouseenter', function() {
        this.style.transform = 'translateX(8px)';
    });

    item.addEventListener('mouseleave', function() {
        this.style.transform = 'translateX(0)';
    });
});

// Performance optimization - debounced scroll
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

const debouncedScrollHandler = debounce(function() {
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    
    if (scrollTop > 50) {
        athleticHeader.classList.add('scrolled');
    } else {
        athleticHeader.classList.remove('scrolled');
    }
}, 10);

window.addEventListener('scroll', debouncedScrollHandler);

// Accessibility enhancements
document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
        const openDropdowns = document.querySelectorAll('.dropdown-menu.show');
        openDropdowns.forEach(dropdown => {
            const toggle = dropdown.previousElementSibling;
            if (toggle) {
                bootstrap.Dropdown.getOrCreateInstance(toggle).hide();
            }
        });
        hideLoading();
    }
});

// Add ripple effect to navigation items
document.querySelectorAll('.nav-link, .auth-btn').forEach(element => {
    element.addEventListener('click', function(e) {
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
            background: rgba(0, 212, 255, 0.4);
            border-radius: 50%;
            transform: scale(0);
            animation: ripple 0.6s linear;
            pointer-events: none;
            z-index: 10;
        `;
        
        this.style.position = 'relative';
        this.style.overflow = 'hidden';
        this.appendChild(ripple);
setTimeout(() => ripple.remove(), 600);
    });
});

// CSS animation for ripple effect
const rippleStyle = document.createElement('style');
rippleStyle.textContent = `
    @keyframes ripple {
        to {
            transform: scale(4);
            opacity: 0;
        }
    }
`;
document.head.appendChild(rippleStyle);
</script>