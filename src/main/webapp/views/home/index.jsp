
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fashion Shop - Athletic & Streetwear</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', 'Helvetica Neue', sans-serif;
            background-color: #000;
            color: #fff;
            line-height: 1.6;
            overflow-x: hidden;
        }

        /* Header Section */
        .header-spacer {
            height: 80px;
        }

        /* Hero Section */
        .hero-section {
            position: relative;
            height: 100vh;
            background: linear-gradient(135deg, #000 0%, #1a1a1a 50%, #000 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .hero-content {
            text-align: center;
            z-index: 2;
            max-width: 800px;
            padding: 0 20px;
        }

        .hero-title {
            font-size: 4.5rem;
            font-weight: 900;
            margin-bottom: 20px;
            background: linear-gradient(45deg, #fff, #00d4ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-transform: uppercase;
            letter-spacing: 3px;
            animation: slideInUp 1s ease-out;
        }

        .hero-subtitle {
            font-size: 1.4rem;
            color: #ccc;
            margin-bottom: 40px;
            font-weight: 300;
            animation: slideInUp 1s ease-out 0.2s both;
        }

        .hero-cta {
            display: inline-block;
            background: linear-gradient(45deg, #00d4ff, #0099cc);
            color: #000;
            padding: 18px 40px;
            text-decoration: none;
            font-weight: 700;
            font-size: 1.1rem;
            text-transform: uppercase;
            border-radius: 0;
            transition: all 0.3s ease;
            box-shadow: 0 8px 30px rgba(0, 212, 255, 0.3);
            animation: slideInUp 1s ease-out 0.4s both;
        }

        .hero-cta:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(0, 212, 255, 0.5);
            background: linear-gradient(45deg, #0099cc, #00d4ff);
        }

        /* Floating Elements */
        .hero-bg-element {
            position: absolute;
            background: rgba(0, 212, 255, 0.1);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        .hero-bg-element:nth-child(1) {
            width: 200px;
            height: 200px;
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .hero-bg-element:nth-child(2) {
            width: 150px;
            height: 150px;
            top: 60%;
            right: 15%;
            animation-delay: 2s;
        }

        .hero-bg-element:nth-child(3) {
            width: 100px;
            height: 100px;
            bottom: 20%;
            left: 20%;
            animation-delay: 4s;
        }

        /* Section Styles */
        .section {
            padding: 80px 0;
            position: relative;
        }

        .section-dark {
            background: #111;
        }

        .section-light {
            background: #1a1a1a;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .section-header {
            text-align: center;
            margin-bottom: 60px;
        }

        .section-title {
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 2px;
            position: relative;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(45deg, #00d4ff, #0099cc);
        }

        .section-subtitle {
            font-size: 1.2rem;
            color: #999;
            font-weight: 300;
        }

        /* Banner Slider */
        .banner-slider {
            position: relative;
            height: 500px;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
        }

        .banner-slide {
            position: relative;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .banner-slide img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(0.7);
            transition: all 0.5s ease;
        }

        .banner-slide:hover img {
            transform: scale(1.1);
            filter: brightness(0.9);
        }

        .banner-content {
            position: absolute;
            top: 50%;
            left: 50px;
            transform: translateY(-50%);
            z-index: 2;
        }

        .banner-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 15px;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.8);
        }

        .banner-btn {
            display: inline-block;
            background: #00d4ff;
            color: #000;
            padding: 12px 30px;
            text-decoration: none;
            font-weight: 600;
            text-transform: uppercase;
            transition: all 0.3s ease;
            border-radius: 0;
        }

        .banner-btn:hover {
            background: #fff;
            transform: translateX(10px);
        }

        /* Product Grid */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .product-card {
            background: #222;
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.4s ease;
            position: relative;
            group: hover;
            border: 2px solid transparent;
        }

        .product-card:hover {
            transform: translateY(-10px);
            border-color: #00d4ff;
            box-shadow: 0 20px 40px rgba(0, 212, 255, 0.2);
        }

        .product-image {
            position: relative;
            overflow: hidden;
            height: 250px;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: all 0.5s ease;
        }

        .product-card:hover .product-image img {
            transform: scale(1.1);
        }

        .product-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background: #00d4ff;
            color: #000;
            padding: 5px 12px;
            font-size: 0.8rem;
            font-weight: 700;
            text-transform: uppercase;
            border-radius: 15px;
        }

        .product-info {
            padding: 25px;
        }

        .product-name {
            font-size: 1.4rem;
            font-weight: 700;
            margin-bottom: 10px;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .product-price {
            font-size: 1.6rem;
            font-weight: 800;
            color: #00d4ff;
            margin-bottom: 15px;
        }

        .product-btn {
            width: 100%;
            background: transparent;
            border: 2px solid #00d4ff;
            color: #00d4ff;
            padding: 12px;
            font-weight: 600;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
            border-radius: 0;
        }

        .product-btn:hover {
            background: #00d4ff;
            color: #000;
        }

        /* Stats Section */
        .stats-section {
            background: linear-gradient(135deg, #00d4ff 0%, #0099cc 100%);
            color: #000;
            padding: 60px 0;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 40px;
            text-align: center;
        }

        .stat-item {
            padding: 20px;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 900;
            margin-bottom: 10px;
        }

        .stat-label {
            font-size: 1.1rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* CTA Section */
        .cta-section {
            background: #000;
            text-align: center;
            padding: 100px 0;
            position: relative;
        }

        .cta-title {
            font-size: 3.5rem;
            font-weight: 900;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .cta-subtitle {
            font-size: 1.3rem;
            color: #999;
            margin-bottom: 40px;
        }

        .cta-buttons {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .cta-btn {
            display: inline-block;
            padding: 18px 35px;
            text-decoration: none;
            font-weight: 700;
            font-size: 1.1rem;
            text-transform: uppercase;
            transition: all 0.3s ease;
            border-radius: 0;
            letter-spacing: 1px;
        }

        .cta-btn.primary {
            background: #00d4ff;
            color: #000;
            border: 2px solid #00d4ff;
        }

        .cta-btn.secondary {
            background: transparent;
            color: #fff;
            border: 2px solid #fff;
        }

        .cta-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        .cta-btn.primary:hover {
            background: #fff;
            border-color: #fff;
        }

        .cta-btn.secondary:hover {
            background: #fff;
            color: #000;
        }

        /* Animations */
        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-20px);
            }
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

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }

            .section-title {
                font-size: 2rem;
            }

            .product-grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
            }

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }

            .cta-buttons {
                flex-direction: column;
                align-items: center;
            }

            .cta-btn {
                width: 80%;
                max-width: 300px;
            }

            .banner-content {
                left: 20px;
                right: 20px;
            }

            .banner-title {
                font-size: 1.8rem;
            }
        }

        @media (max-width: 480px) {
            .hero-title {
                font-size: 2rem;
                letter-spacing: 1px;
            }

            .section {
                padding: 50px 0;
            }

            .product-grid {
                grid-template-columns: 1fr;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Scroll Animations */
        .scroll-animate {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.8s ease;
        }

        .scroll-animate.visible {
            opacity: 1;
            transform: translateY(0);
        }

        /* Loading States */
        .loading {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 200px;
        }

        .spinner {
            width: 40px;
            height: 40px;
            border: 4px solid #333;
            border-top: 4px solid #00d4ff;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <jsp:include page="/views/common/header.jsp" />

    <div class="header-spacer"></div>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="hero-bg-element"></div>
        <div class="hero-bg-element"></div>
        <div class="hero-bg-element"></div>
        
        <div class="hero-content">
            <h1 class="hero-title">Unleash Your Style</h1>
            <p class="hero-subtitle">Premium Athletic & Streetwear for Champions</p>
            <a href="${pageContext.request.contextPath}/products" class="hero-cta">Shop Now</a>
        </div>
    </section>

    <!-- Banner Section -->
    <section class="section section-dark">
        <div class="container">
            <div class="section-header scroll-animate">
                <h2 class="section-title">Featured Collections</h2>
                <p class="section-subtitle">Discover our latest athletic gear and streetwear essentials</p>
            </div>

            <c:choose>
                <c:when test="${not empty banners}">
                    <div class="banner-slider scroll-animate">
                        <c:forEach var="banner" items="${banners}" varStatus="status">
                            <div class="banner-slide" style="${status.index == 0 ? 'display: block;' : 'display: none;'}">
                                <img src="${pageContext.request.contextPath}/${banner.image}" alt="${banner.title}" />
                                <div class="banner-content">
                                    <h3 class="banner-title">${banner.title}</h3>
                                    <a href="${pageContext.request.contextPath}/${banner.link}" class="banner-btn">Explore Collection</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="banner-slider scroll-animate">
                        <div class="banner-slide">
                            <img src="${pageContext.request.contextPath}/images/default.jpg" alt="Featured Collection" />
                            <div class="banner-content">
                                <h3 class="banner-title">New Arrivals</h3>
                                <a href="${pageContext.request.contextPath}/products" class="banner-btn">Shop Collection</a>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="container">
            <div class="stats-grid">
                <div class="stat-item scroll-animate">
                    <div class="stat-number">1000+</div>
                    <div class="stat-label">Products</div>
                </div>
                <div class="stat-item scroll-animate">
                    <div class="stat-number">50K+</div>
                    <div class="stat-label">Happy Customers</div>
                </div>
                <div class="stat-item scroll-animate">
                    <div class="stat-number">100+</div>
                    <div class="stat-label">Brands</div>
                </div>
                <div class="stat-item scroll-animate">
                    <div class="stat-number">24/7</div>
                    <div class="stat-label">Support</div>
                </div>
            </div>
        </div>
    </section>

    <!-- New Products Section -->
    <section class="section section-light">
        <div class="container">
            <div class="section-header scroll-animate">
                <h2 class="section-title">Latest Drops</h2>
                <p class="section-subtitle">Fresh gear that's setting the streets on fire</p>
            </div>

            <c:choose>
                <c:when test="${not empty newProducts}">
                    <div class="product-grid">
                        <c:forEach var="product" items="${newProducts}">
                            <div class="product-card scroll-animate">
                                <div class="product-image">
                                    <img src="${pageContext.request.contextPath}/${product.mainImage}" alt="${product.name}" />
                                    <div class="product-badge">New</div>
                                </div>
                                <div class="product-info">
                                    <h4 class="product-name">${product.name}</h4>
                                    <div class="product-price">${product.price} VND</div>
                                    <a href="${pageContext.request.contextPath}/product-detail?id=${product.id}" class="product-btn">View Details</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="loading">
                        <div class="spinner"></div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container">
            <h2 class="cta-title scroll-animate">Ready to Elevate Your Game?</h2>
            <p class="cta-subtitle scroll-animate">Join thousands of athletes and style icons who trust our gear</p>
            <div class="cta-buttons scroll-animate">
                <a href="${pageContext.request.contextPath}/products" class="cta-btn primary">Shop All Products</a>
                <a href="${pageContext.request.contextPath}/contact" class="cta-btn secondary">Get in Touch</a>
            </div>
        </div>
    </section>

    <jsp:include page="/views/common/footer.jsp" />

    <script>
        // Scroll Animation
        function animateOnScroll() {
            const elements = document.querySelectorAll('.scroll-animate');
            elements.forEach(element => {
                const elementTop = element.getBoundingClientRect().top;
                const elementVisible = 150;
                
                if (elementTop < window.innerHeight - elementVisible) {
                    element.classList.add('visible');
                }
            });
        }

        // Banner Slider (if multiple banners)
        function initBannerSlider() {
            const slides = document.querySelectorAll('.banner-slide');
            if (slides.length > 1) {
                let currentSlide = 0;
                
                setInterval(() => {
                    slides[currentSlide].style.display = 'none';
                    currentSlide = (currentSlide + 1) % slides.length;
                    slides[currentSlide].style.display = 'block';
                }, 5000);
            }
        }

        // Initialize on page load
        document.addEventListener('DOMContentLoaded', function() {
            animateOnScroll();
            initBannerSlider();
        });

        // Animate on scroll
        window.addEventListener('scroll', animateOnScroll);

        // Add loading states for images
        document.querySelectorAll('img').forEach(img => {
            img.addEventListener('load', function() {
                this.style.opacity = '1';
            });
            img.style.opacity = '0';
            img.style.transition = 'opacity 0.3s ease';
        });
    </script>
</body>
</html>
