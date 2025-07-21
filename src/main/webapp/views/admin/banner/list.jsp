
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banner Management - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
    <style>
        .admin-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        
        .stats-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            border: none;
            transition: transform 0.3s ease;
        }
        
        .stats-card:hover {
            transform: translateY(-5px);
        }
        
        .stats-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }
        
        .banner-table {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }
        
        .table thead th {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border: none;
            font-weight: 600;
            color: #495057;
            padding: 1rem;
        }
        
        .table tbody td {
            padding: 1rem;
            border: none;
            vertical-align: middle;
        }
        
        .table tbody tr {
            border-bottom: 1px solid #f8f9fa;
            transition: all 0.2s ease;
        }
        
        .table tbody tr:hover {
            background: linear-gradient(135deg, #f8f9ff 0%, #fff5f8 100%);
        }
        
        .banner-image {
            width: 80px;
            height: 50px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        
        .status-badge {
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        
        .status-active {
            background: linear-gradient(135deg, #d4edda, #c3e6cb);
            color: #155724;
        }
        
        .status-inactive {
            background: linear-gradient(135deg, #f8d7da, #f5c6cb);
            color: #721c24;
        }
        
        .btn-action {
            width: 35px;
            height: 35px;
            border-radius: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin: 0 2px;
            border: none;
            transition: all 0.2s ease;
        }
        
        .btn-edit {
            background: linear-gradient(135deg, #17a2b8, #138496);
            color: white;
        }
        
        .btn-edit:hover {
            background: linear-gradient(135deg, #138496, #117a8b);
            transform: translateY(-2px);
        }
        
        .btn-delete {
            background: linear-gradient(135deg, #dc3545, #c82333);
            color: white;
        }
        
        .btn-delete:hover {
            background: linear-gradient(135deg, #c82333, #bd2130);
            transform: translateY(-2px);
        }
        
        .btn-add {
            background: linear-gradient(135deg, #28a745, #20c997);
            border: none;
            padding: 0.8rem 2rem;
            border-radius: 10px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-add:hover {
            background: linear-gradient(135deg, #20c997, #17a2b8);
            transform: translateY(-2px);
        }
        
        .search-box {
            background: white;
            border-radius: 12px;
            border: 2px solid #e9ecef;
            padding: 0.8rem 1.2rem;
            transition: all 0.3s ease;
        }
        
        .search-box:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
    </style>
</head>
<body class="bg-light">
    <!-- Include Header -->
    <jsp:include page="../common/header.jsp" />
    
    <!-- Admin Header -->
    <div class="admin-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h1 class="mb-0">
                        <i class="fas fa-images me-3"></i>Banner Management
                    </h1>
                    <p class="mb-0 mt-2 opacity-75">Manage your website banners and promotional content</p>
                </div>
                <div class="col-md-6 text-end">
                    <a href="${pageContext.request.contextPath}/admin/banner?action=add" class="btn btn-add">
                        <i class="fas fa-plus me-2"></i>Add New Banner
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="container mb-5">
        <!-- Stats Cards -->
        <div class="row mb-4">
            <div class="col-md-3 mb-3">
                <div class="stats-card">
                    <div class="d-flex align-items-center">
                        <div class="stats-icon bg-primary bg-opacity-10 text-primary me-3">
                            <i class="fas fa-images"></i>
                        </div>
                        <div>
                            <h3 class="mb-0">${totalBanners}</h3>
                            <small class="text-muted">Total Banners</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stats-card">
                    <div class="d-flex align-items-center">
                        <div class="stats-icon bg-success bg-opacity-10 text-success me-3">
                            <i class="fas fa-eye"></i>
                        </div>
                        <div>
                            <h3 class="mb-0">${activeBanners}</h3>
                            <small class="text-muted">Active Banners</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stats-card">
                    <div class="d-flex align-items-center">
                        <div class="stats-icon bg-warning bg-opacity-10 text-warning me-3">
                            <i class="fas fa-eye-slash"></i>
                        </div>
                        <div>
                            <h3 class="mb-0">${inactiveBanners}</h3>
                            <small class="text-muted">Inactive Banners</small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stats-card">
                    <div class="d-flex align-items-center">
                        <div class="stats-icon bg-info bg-opacity-10 text-info me-3">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <div>
                            <h3 class="mb-0">98%</h3>
                            <small class="text-muted">Performance</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Search and Filter -->
        <div class="row mb-4">
            <div class="col-md-6">
                <div class="position-relative">
                    <i class="fas fa-search position-absolute" style="left: 1rem; top: 50%; transform: translateY(-50%); color: #adb5bd;"></i>
                    <input type="text" class="form-control search-box ps-5" placeholder="Search banners..." id="searchInput">
                </div>
            </div>
            <div class="col-md-6 text-end">
                <select class="form-select search-box d-inline-block w-auto">
                    <option value="">All Status</option>
                    <option value="active">Active</option>
                    <option value="inactive">Inactive</option>
                </select>
            </div>
        </div>

        <!-- Banners Table -->
        <div class="banner-table">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th width="5%">#</th>
                            <th width="15%">Image</th>
                            <th width="25%">Title</th>
                            <th width="20%">Description</th>
                            <th width="10%">Status</th>
                            <th width="15%">Created Date</th>
                            <th width="10%" class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty banners}">
                                <c:forEach var="banner" items="${banners}" varStatus="status">
                                    <tr>
                                        <td>
                                            <span class="fw-bold text-muted">${status.index + 1}</span>
                                        </td>
                                        <td>
                                            <img src="${pageContext.request.contextPath}/${banner.imageUrl}" 
                                                 alt="Banner Image" class="banner-image"
                                                 onerror="this.src='${pageContext.request.contextPath}/images/default.jpg'">
                                        </td>
                                        <td>
                                            <div class="fw-bold text-dark">${banner.title}</div>
                                            <c:if test="${not empty banner.linkUrl}">
                                                <small class="text-muted">
                                                    <i class="fas fa-link me-1"></i>${banner.linkUrl}
                                                </small>
                                            </c:if>
                                        </td>
                                        <td>
                                            <span class="text-muted">
                                                ${banner.description.length() > 50 ? banner.description.substring(0, 50).concat('...') : banner.description}
                                            </span>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${banner.isActive}">
                                                    <span class="status-badge status-active">
                                                        <i class="fas fa-check-circle me-1"></i>Active
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-badge status-inactive">
                                                        <i class="fas fa-times-circle me-1"></i>Inactive
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <small class="text-muted">
                                                <fmt:formatDate value="${banner.createdDate}" pattern="MMM dd, yyyy"/>
                                            </small>
                                        </td>
                                        <td class="text-center">
                                            <a href="${pageContext.request.contextPath}/admin/banner?action=edit&id=${banner.id}" 
                                               class="btn btn-action btn-edit" title="Edit Banner">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <button class="btn btn-action btn-delete" 
                                                    onclick="deleteBanner(${banner.id}, '${banner.title}')" 
                                                    title="Delete Banner">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="7" class="text-center py-5">
                                        <div class="text-muted">
                                            <i class="fas fa-images fa-3x mb-3"></i>
                                            <h5>No banners found</h5>
                                            <p>Start by creating your first banner</p>
                                            <a href="${pageContext.request.contextPath}/admin/banner?action=add" class="btn btn-add">
                                                <i class="fas fa-plus me-2"></i>Create Banner
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Pagination -->
        <c:if test="${totalPages > 1}">
            <nav class="mt-4">
                <ul class="pagination justify-content-center">
                    <c:forEach begin="1" end="${totalPages}" var="page">
                        <li class="page-item ${page == currentPage ? 'active' : ''}">
                            <a class="page-link" href="?page=${page}">${page}</a>
                        </li>
                    </c:forEach>
                </ul>
            </nav>
        </c:if>
    </div>

    <!-- Include Footer -->
    <jsp:include page="../common/footer.jsp" />

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom Scripts -->
    <script>
        function deleteBanner(id, title) {
            if (confirm(`Are you sure you want to delete "${title}"?`)) {
                window.location.href = `${pageContext.request.contextPath}/admin/banner?action=delete&id=${id}`;
            }
        }

        // Search functionality
        document.getElementById('searchInput').addEventListener('keyup', function() {
            const searchTerm = this.value.toLowerCase();
            const tableRows = document.querySelectorAll('tbody tr');
            
            tableRows.forEach(row => {
                const title = row.querySelector('td:nth-child(3)').textContent.toLowerCase();
                const description = row.querySelector('td:nth-child(4)').textContent.toLowerCase();
                
                if (title.includes(searchTerm) || description.includes(searchTerm)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });

        // Status filter
        document.querySelector('select').addEventListener('change', function() {
            const filterValue = this.value.toLowerCase();
            const tableRows = document.querySelectorAll('tbody tr');
            
            tableRows.forEach(row => {
                const statusElement = row.querySelector('.status-badge');
                if (!statusElement) return;
                
                const status = statusElement.textContent.toLowerCase().trim();
                
                if (filterValue === '' || status.includes(filterValue)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });

        // Add loading animation for actions
        document.querySelectorAll('.btn-action').forEach(btn => {
            btn.addEventListener('click', function() {
                this.innerHTML = '<i class="fas fa-spinner fa-spin"></i>';
                this.disabled = true;
            });
        });
    </script>
</body>
</html>
