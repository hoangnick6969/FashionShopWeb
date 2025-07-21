
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog - FashionShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #e91e63;
            --primary-dark: #c2185b;
            --primary-light: #f8bbd9;
            --secondary-color: #2c3e50;
            --accent-color: #3498db;
            --text-primary: #2c3e50;
            --text-secondary: #6c757d;
            --text-muted: #95a5a6;
            --background-light: #f8f9fa;
            --background-white: #ffffff;
            --border-color: #e9ecef;
            --border-light: #f1f3f4;
            --shadow-sm: 0 2px 8px rgba(0,0,0,0.08);
            --shadow-md: 0 4px 16px rgba(0,0,0,0.12);
            --shadow-lg: 0 8px 32px rgba(0,0,0,0.16);
            --radius-sm: 8px;
            --radius-md: 12px;
            --radius-lg: 16px;
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            --gradient-primary: linear-gradient(135deg, #e91e63, #f06292);
            --gradient-overlay: linear-gradient(135deg, rgba(233, 30, 99, 0.1), rgba(240, 98, 146, 0.05));
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            line-height: 1.6;
            color: var(--text-primary);
            background: var(--background-light);
        }

        /* Header Section */
        .blog-header {
            background: var(--background-white);
            padding: 4rem 0 3rem;
            margin-bottom: 3rem;
            border-bottom: 1px solid var(--border-light);
            position: relative;
            overflow: hidden;
        }

        .blog-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: var(--gradient-overlay);
            opacity: 0.5;
        }

        .blog-header .container {
            position: relative;
            z-index: 2;
        }

        .blog-title {
            font-size: 3rem;
            font-weight: 800;
            color: var(--text-primary);
            margin-bottom: 1rem;
            background: var(--gradient-primary);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-align: center;
        }

        .blog-subtitle {
            font-size: 1.25rem;
            color: var(--text-secondary);
            text-align: center;
            max-width: 600px;
            margin: 0 auto;
            font-weight: 400;
        }

        .blog-stats {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 2rem;
            margin-top: 2rem;
        }

        .stat-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--text-secondary);
            font-weight: 500;
        }

        .stat-item i {
            color: var(--primary-color);
        }

        /* Search and Filter Section */
        .blog-controls {
            background: var(--background-white);
            padding: 2rem;
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-sm);
            margin-bottom: 3rem;
            border: 1px solid var(--border-color);
        }

        .search-box {
            position: relative;
            max-width: 500px;
            margin: 0 auto;
        }

        .search-input {
            width: 100%;
            padding: 1rem 1rem 1rem 3rem;
            border: 2px solid var(--border-color);
            border-radius: var(--radius-md);
            font-size: 1rem;
            transition: var(--transition);
            background: var(--background-light);
        }

        .search-input:focus {
            outline: none;
            border-color: var(--primary-color);
            background: var(--background-white);
            box-shadow: 0 0 0 0.2rem rgba(233, 30, 99, 0.1);
        }

        .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
            font-size: 1.1rem;
        }

        /* Blog Grid */
        .blog-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
            margin-bottom: 4rem;
        }

        /* Blog Card */
        .blog-card {
            background: var(--background-white);
            border-radius: var(--radius-lg);
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-color);
            transition: var(--transition);
            position: relative;
            height: fit-content;
        }

        .blog-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-lg);
            border-color: var(--primary-light);
        }

        .blog-image-container {
            position: relative;
            overflow: hidden;
            height: 240px;
            background: var(--background-light);
        }

        .blog-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: var(--transition);
        }

        .blog-card:hover .blog-image {
            transform: scale(1.05);
        }

        .blog-image-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(to bottom, transparent, rgba(0,0,0,0.1));
            opacity: 0;
            transition: var(--transition);
        }

        .blog-card:hover .blog-image-overlay {
            opacity: 1;
        }

        .blog-date-badge {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: var(--background-white);
            color: var(--text-primary);
            padding: 0.5rem 1rem;
            border-radius: var(--radius-sm);
            font-size: 0.875rem;
            font-weight: 600;
            box-shadow: var(--shadow-sm);
            backdrop-filter: blur(10px);
        }

        .blog-content {
            padding: 2rem;
        }

        .blog-card-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 1rem;
            line-height: 1.3;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            transition: var(--transition);
        }

        .blog-card:hover .blog-card-title {
            color: var(--primary-color);
        }

        .blog-excerpt {
            color: var(--text-secondary);
            font-size: 1rem;
            line-height: 1.6;
            margin-bottom: 1.5rem;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .blog-meta {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
            padding-top: 1rem;
            border-top: 1px solid var(--border-light);
        }

        .blog-author {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            color: var(--text-secondary);
            font-size: 0.9rem;
            font-weight: 500;
        }

        .author-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: var(--gradient-primary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 0.8rem;
        }

        .read-time {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--text-muted);
            font-size: 0.875rem;
        }

        .read-more-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            font-size: 0.95rem;
            padding: 0.75rem 1.5rem;
            border: 2px solid var(--primary-color);
            border-radius: var(--radius-sm);
            transition: var(--transition);
            background: transparent;
        }

        .read-more-btn:hover {
            background: var(--primary-color);
            color: white;
            text-decoration: none;
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }

        .read-more-btn i {
            transition: var(--transition);
        }

        .read-more-btn:hover i {
            transform: translateX(4px);
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            background: var(--background-white);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-color);
        }

        .empty-icon {
            font-size: 4rem;
            color: var(--text-muted);
            margin-bottom: 1.5rem;
        }

        .empty-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 1rem;
        }

        .empty-message {
            color: var(--text-secondary);
            font-size: 1.1rem;
            max-width: 500px;
            margin: 0 auto 2rem;
        }

        .back-home-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: var(--gradient-primary);
            color: white;
            text-decoration: none;
            padding: 1rem 2rem;
            border-radius: var(--radius-md);
            font-weight: 600;
            transition: var(--transition);
            box-shadow: var(--shadow-sm);
        }

        .back-home-btn:hover {
            color: white;
            text-decoration: none;
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        /* Loading Animation */
        .loading-skeleton {
            background: var(--background-white);
            border-radius: var(--radius-lg);
            padding: 1rem;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-color);
        }

        .skeleton-image {
            height: 240px;
            background: linear-gradient(90deg, var(--background-light) 25%, #fff 50%, var(--background-light) 75%);
            background-size: 200% 100%;
            animation: loading 1.5s infinite;
            border-radius: var(--radius-md);
            margin-bottom: 1rem;
        }

        .skeleton-text {
            height: 1rem;
            background: linear-gradient(90deg, var(--background-light) 25%, #fff 50%, var(--background-light) 75%);
            background-size: 200% 100%;
            animation: loading 1.5s infinite;
            border-radius: 4px;
            margin-bottom: 0.5rem;
        }

        .skeleton-text.title {
            height: 1.5rem;
            width: 80%;
        }

        .skeleton-text.short {
            width: 60%;
        }

        @keyframes loading {
            0% {
                background-position: 200% 0;
            }
            100% {
                background-position: -200% 0;
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .blog-title {
                font-size: 2.5rem;
            }

            .blog-subtitle {
                font-size: 1.1rem;
            }

            .blog-stats {
                flex-direction: column;
                gap: 1rem;
            }

            .blog-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .blog-content {
                padding: 1.5rem;
            }

            .blog-controls {
                padding: 1.5rem;
            }
        }

        @media (max-width: 576px) {
            .blog-header {
                padding: 2rem 0;
            }

            .blog-title {
                font-size: 2rem;
            }

            .blog-card-title {
                font-size: 1.25rem;
            }

            .blog-meta {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
        }

        /* Dark Mode Support */
        @media (prefers-color-scheme: dark) {
            :root {
                --text-primary: #e9ecef;
                --text-secondary: #adb5bd;
                --text-muted: #6c757d;
                --background-light: #1a1a1a;
                --background-white: #212529;
                --border-color: #495057;
                --border-light: #343a40;
            }
        }

        /* Accessibility Improvements */
        .blog-card:focus-within {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        .read-more-btn:focus {
            outline: 2px solid var(--primary-color);
            outline-offset: 2px;
        }

        /* Animation for page entrance */
        .blog-card {
            animation: fadeInUp 0.6s ease forwards;
        }

        .blog-card:nth-child(2) {
            animation-delay: 0.1s;
        }

        .blog-card:nth-child(3) {
            animation-delay: 0.2s;
        }

        .blog-card:nth-child(4) {
            animation-delay: 0.3s;
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
    </style>
</head>
<body>
    <jsp:include page="../../common/header.jsp" />

    <!-- Blog Header -->
    <section class="blog-header">
        <div class="container">
            <h1 class="blog-title">
                <i class="bi bi-journal-text me-3"></i>
                Bài viết mới nhất
            </h1>
            <p class="blog-subtitle">
                Khám phá những xu hướng thời trang mới nhất, mẹo phối đồ và cập nhật từ thế giới fashion
            </p>
            <div class="blog-stats">
                <div class="stat-item">
                    <i class="bi bi-file-text"></i>
                    <span><c:out value="${fn:length(blogs)}" default="0"/> bài viết</span>
                </div>
                <div class="stat-item">
                    <i class="bi bi-calendar"></i>
                    <span>Cập nhật hàng tuần</span>
                </div>
                <div class="stat-item">
                    <i class="bi bi-heart"></i>
                    <span>Nội dung chất lượng cao</span>
                </div>
            </div>
        </div>
    </section>

    <div class="container">
        <!-- Search and Controls -->
        <div class="blog-controls">
            <div class="search-box">
                <input type="text" class="search-input" placeholder="Tìm kiếm bài viết..." id="searchInput">
                <i class="bi bi-search search-icon"></i>
            </div>
        </div>

        <!-- Blog Grid -->
        <c:choose>
            <c:when test="${not empty blogs}">
                <div class="blog-grid" id="blogGrid">
                    <c:forEach var="blog" items="${blogs}" varStatus="status">
                        <article class="blog-card" data-title="${fn:toLowerCase(blog.title)}">
                            <div class="blog-image-container">
                                <img src="${pageContext.request.contextPath}/${blog.thumbnail}" 
                                     alt="${blog.title}" 
                                     class="blog-image"
                                     onerror="this.src='${pageContext.request.contextPath}/images/default.jpg'">
                                <div class="blog-image-overlay"></div>
                                <div class="blog-date-badge">
                                    <fmt:formatDate value="${blog.createdAt}" pattern="dd/MM/yyyy" />
                                </div>
                            </div>

                            <div class="blog-content">
                                <h3 class="blog-card-title">${blog.title}</h3>
                                
                                <p class="blog-excerpt">
                                    <c:choose>
                                        <c:when test="${fn:length(blog.content) > 150}">
                                            ${fn:substring(blog.content, 0, 150)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${blog.content}
                                        </c:otherwise>
                                    </c:choose>
                                </p>

                                <div class="blog-meta">
                                    <div class="blog-author">
                                        <div class="author-avatar">
                                            FA
                                        </div>
                                        <span>FashionShop Team</span>
                                    </div>
                                    <div class="read-time">
                                        <i class="bi bi-clock"></i>
                                        <span>5 phút đọc</span>
                                    </div>
                                </div>

                                <a href="${pageContext.request.contextPath}/blog/detail?id=${blog.id}" class="read-more-btn">
                                    <span>Đọc tiếp</span>
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                        </article>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <i class="bi bi-journal-x empty-icon"></i>
                    <h2 class="empty-title">Chưa có bài viết nào</h2>
                    <p class="empty-message">
                        Hiện tại chưa có bài viết nào được đăng tải. Vui lòng quay lại sau để đọc những nội dung thú vị từ FashionShop.
                    </p>
                    <a href="${pageContext.request.contextPath}/home" class="back-home-btn">
                        <i class="bi bi-house"></i>
                        <span>Về trang chủ</span>
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <jsp:include page="../../common/footer.jsp" />

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const blogCards = document.querySelectorAll('.blog-card');
            
            blogCards.forEach(card => {
                const title = card.dataset.title;
                const content = card.querySelector('.blog-excerpt').textContent.toLowerCase();
                
                if (title.includes(searchTerm) || content.includes(searchTerm)) {
                    card.style.display = 'block';
                    card.style.animation = 'fadeInUp 0.5s ease forwards';
                } else {
                    card.style.display = 'none';
                }
            });
        });

        // Enhanced image loading
        document.querySelectorAll('.blog-image').forEach(img => {
            img.addEventListener('load', function() {
                this.style.opacity = '1';
            });
            
            img.addEventListener('error', function() {
                this.closest('.blog-image-container').innerHTML = `
                    <div style="height: 240px; background: var(--background-light); display: flex; align-items: center; justify-content: center; color: var(--text-muted);">
                        <i class="bi bi-image" style="font-size: 3rem;"></i>
                    </div>
                `;
            });
        });

        // Intersection Observer for animation
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.animationPlayState = 'running';
                }
            });
        });

        document.querySelectorAll('.blog-card').forEach(card => {
            observer.observe(card);
        });

        // Smooth scroll behavior
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            });
        });

        // Keyboard navigation support
        document.addEventListener('keydown', function(e) {
            if (e.key === '/' && !e.target.matches('input, textarea')) {
                e.preventDefault();
                document.getElementById('searchInput').focus();
            }
        });
    </script>
</body>
</html>
