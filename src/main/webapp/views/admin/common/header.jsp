
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Panel - FashionShop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        :root {
            --admin-primary: #2c3e50;
            --admin-secondary: #34495e;
            --admin-accent: #3498db;
            --admin-success: #27ae60;
            --admin-warning: #f39c12;
            --admin-danger: #e74c3c;
            --admin-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --admin-sidebar: #2c3e50;
            --sidebar-width: 280px;
        }

        body {
            background: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Enhanced Sidebar */
        .admin-sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: var(--sidebar-width);
            height: 100vh;
            background: var(--admin-gradient);
            backdrop-filter: blur(10px);
            z-index: 1000;
            transition: all 0.3s ease;
            overflow-y: auto;
            box-shadow: 4px 0 20px rgba(0,0,0,0.1);
        }

        .sidebar-brand {
            padding: 1.5rem;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(5px);
        }

        .sidebar-brand h4 {
            color: white;
            font-weight: 700;
            margin: 0;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }

        .sidebar-brand .brand-subtitle {
            color: rgba(255,255,255,0.8);
            font-size: 0.85rem;
            margin-top: 0.25rem;
        }

        .sidebar-nav {
            padding: 1rem 0;
        }

        .nav-section-title {
            color: rgba(255,255,255,0.6);
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 1rem 1.5rem 0.5rem;
            margin-bottom: 0.5rem;
        }

        .sidebar-nav .nav-link {
            color: rgba(255,255,255,0.9);
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 0;
            transition: all 0.3s ease;
            position: relative;
            display: flex;
            align-items: center;
            margin: 0.25rem 0.75rem;
            border-radius: 0.75rem;
            font-weight: 500;
        }

        .sidebar-nav .nav-link:hover {
            background: rgba(255,255,255,0.15);
            color: white;
            transform: translateX(5px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .sidebar-nav .nav-link.active {
            background: rgba(255,255,255,0.2);
            color: white;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }

        .sidebar-nav .nav-link i {
            width: 20px;
            margin-right: 0.75rem;
            font-size: 1.1rem;
        }

        /* Enhanced Top Bar */
        .admin-topbar {
            position: fixed;
            top: 0;
            left: var(--sidebar-width);
            right: 0;
            height: 70px;
            background: white;
            border-bottom: 1px solid #e9ecef;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 2rem;
            z-index: 999;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .topbar-left h5 {
            margin: 0;
            color: var(--admin-primary);
            font-weight: 600;
        }

        .breadcrumb {
            background: none;
            padding: 0;
            margin: 0;
            font-size: 0.9rem;
        }

        .breadcrumb-item a {
            color: var(--admin-accent);
            text-decoration: none;
        }

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .admin-user-menu .dropdown-toggle {
            background: var(--admin-gradient);
            border: none;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 500;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .admin-user-menu .dropdown-toggle::after {
            margin-left: 0.5rem;
        }

        .admin-user-menu .dropdown-menu {
            border: none;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            border-radius: 1rem;
            overflow: hidden;
            margin-top: 0.5rem;
        }

        .admin-user-menu .dropdown-item {
            padding: 0.75rem 1.5rem;
            transition: all 0.2s ease;
            border-radius: 0.5rem;
            margin: 0.25rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .admin-user-menu .dropdown-item:hover {
            background: var(--admin-gradient);
            color: white;
            transform: translateX(3px);
        }

        /* Main Content Area */
        .admin-content {
            margin-left: var(--sidebar-width);
            margin-top: 70px;
            padding: 2rem;
            min-height: calc(100vh - 70px);
        }

        /* Quick Actions */
        .quick-actions {
            display: flex;
            gap: 0.75rem;
            align-items: center;
        }

        .quick-action-btn {
            background: rgba(52, 152, 219, 0.1);
            border: 1px solid rgba(52, 152, 219, 0.3);
            color: var(--admin-accent);
            padding: 0.5rem;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .quick-action-btn:hover {
            background: var(--admin-accent);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .admin-sidebar {
                transform: translateX(-100%);
            }
            
            .admin-sidebar.show {
                transform: translateX(0);
            }
            
            .admin-topbar {
                left: 0;
            }
            
            .admin-content {
                margin-left: 0;
            }
        }

        /* Custom Gradient Backgrounds */
        .bg-gradient-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
        }

        .bg-gradient-success {
            background: linear-gradient(135deg, #4ecdc4 0%, #44a08d 100%) !important;
        }

        .bg-gradient-warning {
            background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%) !important;
        }

        .bg-gradient-danger {
            background: linear-gradient(135deg, #ff9a9e 0%, #fecfef 100%) !important;
        }
    </style>
</head>
<body>

<!-- Enhanced Sidebar -->
<div class="admin-sidebar" id="adminSidebar">
    <div class="sidebar-brand">
        <div class="d-flex align-items-center justify-content-center">
            <div class="me-2 bg-white bg-opacity-20 p-2 rounded-circle">
                <i class="bi bi-shield-check text-white"></i>
            </div>
            <div>
                <h4>Admin Panel</h4>
                <div class="brand-subtitle">FashionShop Management</div>
            </div>
        </div>
    </div>

    <nav class="sidebar-nav">
        <div class="nav-section-title">Dashboard</div>
        <a class="nav-link ${pageContext.request.requestURI.contains('/admin/dashboard') ? 'active' : ''}" 
           href="${pageContext.request.contextPath}/admin/dashboard">
            <i class="bi bi-speedometer2"></i>
            <span>Dashboard</span>
        </a>

        <div class="nav-section-title">Quản lý sản phẩm</div>
        <a class="nav-link ${pageContext.request.requestURI.contains('/admin/products') ? 'active' : ''}" 
           href="${pageContext.request.contextPath}/admin/products">
            <i class="bi bi-box-seam"></i>
            <span>Sản phẩm</span>
        </a>
        <a class="nav-link ${pageContext.request.requestURI.contains('/admin/categories') ? 'active' : ''}" 
           href="${pageContext.request.contextPath}/admin/categories">
            <i class="bi bi-tags"></i>
            <span>Danh mục</span>
        </a>

        <div class="nav-section-title">Quản lý bán hàng</div>
        <a class="nav-link ${pageContext.request.requestURI.contains('/admin/orders') ? 'active' : ''}" 
           href="${pageContext.request.contextPath}/admin/orders">
            <i class="bi bi-cart-check"></i>
            <span>Đơn hàng</span>
        </a>
        <a class="nav-link ${pageContext.request.requestURI.contains('/admin/customers') ? 'active' : ''}" 
           href="${pageContext.request.contextPath}/admin/customers">
            <i class="bi bi-people"></i>
            <span>Khách hàng</span>
        </a>

        <div class="nav-section-title">Nội dung</div>
        <a class="nav-link ${pageContext.request.requestURI.contains('/admin/reviews') ? 'active' : ''}" 
           href="${pageContext.request.contextPath}/admin/reviews">
            <i class="bi bi-star"></i>
            <span>Đánh giá</span>
        </a>
        <a class="nav-link ${pageContext.request.requestURI.contains('/admin/messages') ? 'active' : ''}" 
           href="${pageContext.request.contextPath}/admin/messages">
            <i class="bi bi-envelope"></i>
            <span>Tin nhắn</span>
        </a>
        <a class="nav-link ${pageContext.request.requestURI.contains('/admin/blogs') ? 'active' : ''}" 
           href="${pageContext.request.contextPath}/admin/blogs">
            <i class="bi bi-journal-text"></i>
            <span>Blog</span>
        </a>

        <div class="nav-section-title">Marketing</div>
        <a class="nav-link ${pageContext.request.requestURI.contains('/admin/banners') ? 'active' : ''}" 
           href="${pageContext.request.contextPath}/admin/banners">
            <i class="bi bi-image"></i>
            <span>Banner</span>
        </a>
        <a class="nav-link ${pageContext.request.requestURI.contains('/admin/coupons') ? 'active' : ''}" 
           href="${pageContext.request.contextPath}/admin/coupons">
            <i class="bi bi-ticket-perforated"></i>
            <span>Mã giảm giá</span>
        </a>
    </nav>
</div>

<!-- Enhanced Top Bar -->
<div class="admin-topbar">
    <div class="topbar-left">
        <button class="btn d-md-none quick-action-btn me-3" onclick="toggleSidebar()">
            <i class="bi bi-list"></i>
        </button>
        <div>
            <h5>Chào mừng, Admin!</h5>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Trang hiện tại</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="topbar-right">
        <div class="quick-actions">
            <button class="btn quick-action-btn" data-bs-toggle="tooltip" title="Thông báo">
                <i class="bi bi-bell"></i>
            </button>
            <button class="btn quick-action-btn" data-bs-toggle="tooltip" title="Tin nhắn">
                <i class="bi bi-envelope"></i>
            </button>
            <button class="btn quick-action-btn" data-bs-toggle="tooltip" title="Cài đặt">
                <i class="bi bi-gear"></i>
            </button>
        </div>

        <div class="admin-user-menu dropdown">
            <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown">
                <div class="bg-white bg-opacity-20 rounded-circle p-1 me-2">
                    <i class="bi bi-person-circle"></i>
                </div>
                <span>Admin</span>
            </button>
            <ul class="dropdown-menu dropdown-menu-end">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/profile">
                    <i class="bi bi-person-gear"></i>Hồ sơ
                </a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/settings">
                    <i class="bi bi-sliders"></i>Cài đặt
                </a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/admin/logout">
                    <i class="bi bi-box-arrow-right"></i>Đăng xuất
                </a></li>
            </ul>
        </div>
    </div>
</div>

<!-- Main Content Area -->
<div class="admin-content">
    <script>
        function toggleSidebar() {
            document.getElementById('adminSidebar').classList.toggle('show');
        }

        // Initialize tooltips
        document.addEventListener('DOMContentLoaded', function() {
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        });
    </script>
