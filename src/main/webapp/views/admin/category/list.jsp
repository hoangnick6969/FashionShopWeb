
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management - Fashion Shop Admin</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">

    <style>
        .admin-header {
            background: var(--primary-gradient);
            color: white;
            padding: 2rem 0;
            margin-bottom: 3rem;
            border-radius: 0 0 2rem 2rem;
            box-shadow: var(--shadow-medium);
        }

        .stats-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: var(--border-radius-lg);
            transition: all 0.3s ease;
        }

        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-strong);
        }

        .action-buttons .btn {
            margin-right: 0.5rem;
            margin-bottom: 0.5rem;
        }

        .table-container {
            background: white;
            border-radius: var(--border-radius-lg);
            box-shadow: var(--shadow-soft);
            overflow: hidden;
        }

        .search-section {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: var(--border-radius-lg);
            box-shadow: var(--shadow-soft);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .page-title {
            font-weight: 800;
            background: var(--primary-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 0;
        }

        .category-badge {
            background: var(--success-gradient);
            color: white;
            border-radius: 50px;
            padding: 0.5rem 1rem;
            font-weight: 500;
            display: inline-block;
            margin: 0.25rem;
        }

        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: #6c757d;
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 1rem;
            opacity: 0.5;
        }
    </style>
</head>
<body class="bg-light">
    <!-- Admin Header -->
    <div class="admin-header animate-fade-in-up">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h1 class="page-title mb-2">Category Management</h1>
                    <p class="mb-0 opacity-75">Manage product categories and organize your inventory</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <div class="stats-card d-inline-block p-3">
                        <div class="d-flex align-items-center">
                            <i class="bi bi-tags-fill fs-2 me-3"></i>
                            <div>
                                <h4 class="mb-0">${fn:length(categories)}</h4>
                                <small>Total Categories</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container animate-fade-in-up" style="animation-delay: 0.2s;">
        <!-- Search and Actions Section -->
        <div class="search-section">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0">
                            <i class="bi bi-search text-muted"></i>
                        </span>
                        <input type="text" class="form-control border-start-0" placeholder="Search categories..." id="searchInput">
                    </div>
                </div>
                <div class="col-md-6 text-md-end mt-3 mt-md-0">
                    <div class="action-buttons">
                        <a href="${pageContext.request.contextPath}/admin/categories?action=create"
                           class="btn btn-primary">
                            <i class="bi bi-plus-circle me-2"></i>Add New Category
                        </a>
                        <button class="btn btn-outline-secondary" onclick="refreshTable()">
                            <i class="bi bi-arrow-clockwise me-2"></i>Refresh
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Categories Table -->
        <div class="table-container animate-fade-in-up" style="animation-delay: 0.4s;">
            <c:choose>
                <c:when test="${not empty categories}">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0" id="categoriesTable">
                            <thead>
                                <tr>
                                    <th scope="col" class="ps-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="selectAll">
                                        </div>
                                    </th>
                                    <th scope="col">ID</th>
                                    <th scope="col">Category Name</th>
                                    <th scope="col">Products Count</th>
                                    <th scope="col">Status</th>
                                    <th scope="col" class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="category" items="${categories}" varStatus="status">
                                    <tr>
                                        <td class="ps-4">
                                            <div class="form-check">
                                                <input class="form-check-input row-checkbox" type="checkbox" value="${category.id}">
                                            </div>
                                        </td>
                                        <td>
                                            <span class="badge bg-secondary">#${category.id}</span>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="category-icon me-3">
                                                    <i class="bi bi-tag-fill text-primary fs-5"></i>
                                                </div>
                                                <div>
                                                    <strong class="category-name">${category.name}</strong>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="category-badge">
                                                ${fn:length(category.products)} products
                                            </span>
                                        </td>
                                        <td>
                                            <span class="badge bg-success">
                                                <i class="bi bi-check-circle me-1"></i>Active
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group" role="group">
                                                <a href="${pageContext.request.contextPath}/admin/categories?action=edit&id=${category.id}"
                                                   class="btn btn-outline-primary btn-sm" title="Edit Category">
                                                    <i class="bi bi-pencil"></i>
                                                </a>
                                                <button type="button" class="btn btn-outline-info btn-sm" title="View Details"
                                                        onclick="viewCategory(${category.id})">
                                                    <i class="bi bi-eye"></i>
                                                </button>
                                                <button type="button" class="btn btn-outline-danger btn-sm" title="Delete Category"
                                                        onclick="deleteCategory(${category.id}, '${category.name}')">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <div class="d-flex justify-content-between align-items-center p-4 border-top">
                        <div class="text-muted">
                            Showing ${fn:length(categories)} categories
                        </div>
                        <nav>
                            <ul class="pagination mb-0">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                </li>
                                <li class="page-item active">
                                    <a class="page-link" href="#">1</a>
                                </li>
                                <li class="page-item disabled">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <i class="bi bi-tags text-muted"></i>
                        <h4 class="text-muted">No Categories Found</h4>
                        <p class="text-muted mb-4">Start by creating your first product category to organize your inventory.</p>
                        <a href="${pageContext.request.contextPath}/admin/categories?action=create"
                           class="btn btn-primary">
                            <i class="bi bi-plus-circle me-2"></i>Create First Category
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header border-0">
                    <h5 class="modal-title text-danger">
                        <i class="bi bi-exclamation-triangle me-2"></i>Confirm Deletion
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete the category "<strong id="categoryToDelete"></strong>"?</p>
                    <div class="alert alert-warning">
                        <i class="bi bi-info-circle me-2"></i>
                        This action cannot be undone. All products in this category will need to be reassigned.
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" id="confirmDelete">
                        <i class="bi bi-trash me-2"></i>Delete Category
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- View Category Modal -->
    <div class="modal fade" id="viewModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header border-0">
                    <h5 class="modal-title">
                        <i class="bi bi-tag me-2"></i>Category Details
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div id="categoryDetails">
                        <div class="loading-spinner mx-auto"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Search functionality
        document.getElementById('searchInput').addEventListener('keyup', function() {
            const searchValue = this.value.toLowerCase();
            const tableRows = document.querySelectorAll('#categoriesTable tbody tr');

            tableRows.forEach(row => {
                const categoryName = row.querySelector('.category-name').textContent.toLowerCase();
                if (categoryName.includes(searchValue)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });

        // Select all checkbox functionality
        document.getElementById('selectAll').addEventListener('change', function() {
            const checkboxes = document.querySelectorAll('.row-checkbox');
            checkboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
        });

        // Delete category function
        let categoryToDeleteId = null;

        function deleteCategory(id, name) {
            categoryToDeleteId = id;
            document.getElementById('categoryToDelete').textContent = name;
            new bootstrap.Modal(document.getElementById('deleteModal')).show();
        }

        document.getElementById('confirmDelete').addEventListener('click', function() {
            if (categoryToDeleteId) {
                // Create a form and submit it
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = '${pageContext.request.contextPath}/admin/categories';

                const actionInput = document.createElement('input');
                actionInput.type = 'hidden';
                actionInput.name = 'action';
                actionInput.value = 'delete';

                const idInput = document.createElement('input');
                idInput.type = 'hidden';
                idInput.name = 'id';
                idInput.value = categoryToDeleteId;

                form.appendChild(actionInput);
                form.appendChild(idInput);
                document.body.appendChild(form);
                form.submit();
            }
        });

        // View category function
        function viewCategory(id) {
            const modal = new bootstrap.Modal(document.getElementById('viewModal'));
            const detailsDiv = document.getElementById('categoryDetails');

            // Show loading
            detailsDiv.innerHTML = '<div class="text-center"><div class="loading-spinner mx-auto"></div><p class="mt-3">Loading category details...</p></div>';
            modal.show();

            // Simulate loading category details
            setTimeout(() => {
                detailsDiv.innerHTML = `
                    <div class="row">
                        <div class="col-md-6">
                            <h6 class="text-muted">Category Information</h6>
                            <table class="table table-borderless">
                                <tr><td><strong>ID:</strong></td><td>#${id}</td></tr>
                                <tr><td><strong>Name:</strong></td><td>Category ${id}</td></tr>
                                <tr><td><strong>Status:</strong></td><td><span class="badge bg-success">Active</span></td></tr>
                                <tr><td><strong>Created:</strong></td><td>2024-01-15</td></tr>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <h6 class="text-muted">Statistics</h6>
                            <div class="card bg-light">
                                <div class="card-body text-center">
                                    <h3 class="text-primary mb-1">12</h3>
                                    <small class="text-muted">Products in this category</small>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
            }, 1000);
        }

        // Refresh table function
        function refreshTable() {
            location.reload();
        }

        // Show success message if category was created/updated
        <c:if test="${not empty message}">
            // You can add toast notification here
            console.log('${message}');
        </c:if>
    </script>
</body>
</html>
