<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/admin/common/header.jsp" />

<h2>
    <c:choose>
        <c:when test="${category != null}">✏️ Cập nhật danh mục</c:when>
        <c:otherwise>➕ Thêm danh mục</c:otherwise>
    </c:choose>
</h2>

<form method="post" action="${pageContext.request.contextPath}/admin/categories">
    <input type="hidden" name="id" value="${category.id}" />

    <label>Tên danh mục:</label><br/>
    <input type="text" name="name" value="${category.name}" required /><br/><br/>

    <button type="submit">Lưu</button>
</form>

<jsp:include page="/views/admin/common/footer.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${category != null ? 'Edit Category' : 'Add New Category'} - Admin Panel</title>
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/css/custom.css'/>" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-gradient-primary shadow-custom">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="<c:url value='/admin/dashboard'/>">
                <i class="fas fa-tachometer-alt me-2"></i>Admin Panel
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="<c:url value='/admin/logout'/>">
                    <i class="fas fa-sign-out-alt me-1"></i>Logout
                </a>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 d-md-block bg-white sidebar shadow-custom">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/admin/dashboard'/>">
                                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active text-gradient-primary fw-semibold" href="<c:url value='/admin/category'/>">
                                <i class="fas fa-tags me-2"></i>Categories
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/admin/product'/>">
                                <i class="fas fa-box me-2"></i>Products
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/admin/order'/>">
                                <i class="fas fa-shopping-cart me-2"></i>Orders
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/admin/customer'/>">
                                <i class="fas fa-users me-2"></i>Customers
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
                    <div>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb bg-transparent p-0 m-0">
                                <li class="breadcrumb-item">
                                    <a href="<c:url value='/admin/dashboard'/>" class="text-decoration-none">
                                        <i class="fas fa-home me-1"></i>Dashboard
                                    </a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a href="<c:url value='/admin/category'/>" class="text-decoration-none">Categories</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    ${category != null ? 'Edit Category' : 'Add New Category'}
                                </li>
                            </ol>
                        </nav>
                        <h1 class="h2 display-title animate-fade-in-up">
                            <i class="fas fa-${category != null ? 'edit' : 'plus'} me-3"></i>
                            ${category != null ? 'Edit Category' : 'Add New Category'}
                        </h1>
                    </div>
                </div>

                <!-- Alert Messages -->
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success alert-dismissible fade show animate-fade-in-left" role="alert">
                        <i class="fas fa-check-circle me-2"></i>
                        <strong>Success!</strong> ${successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger alert-dismissible fade show animate-fade-in-left" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        <strong>Error!</strong> ${errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <!-- Category Form -->
                <div class="row justify-content-center">
                    <div class="col-xl-8 col-lg-10">
                        <div class="card shadow-custom-lg border-0 rounded-custom-lg animate-fade-in-up">
                            <div class="card-header bg-gradient-primary text-white border-0 rounded-top-custom-lg">
                                <div class="d-flex align-items-center">
                                    <i class="fas fa-tags fs-4 me-3"></i>
                                    <div>
                                        <h5 class="card-title mb-0 fw-bold">Category Information</h5>
                                        <small class="opacity-75">
                                            ${category != null ? 'Update existing category details' : 'Enter new category information'}
                                        </small>
                                    </div>
                                </div>
                            </div>

                            <div class="card-body p-4">
                                <form action="<c:url value='/admin/category/save'/>" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                                    <c:if test="${category != null}">
                                        <input type="hidden" name="id" value="${category.id}">
                                    </c:if>

                                    <div class="row">
                                        <!-- Category Name -->
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="text"
                                                       class="form-control form-control-lg rounded-custom"
                                                       id="categoryName"
                                                       name="name"
                                                       value="${category != null ? category.name : ''}"
                                                       required
                                                       maxlength="100"
                                                       placeholder="Category Name">
                                                <label for="categoryName">
                                                    <i class="fas fa-tag me-2 text-primary"></i>Category Name
                                                </label>
                                                <div class="invalid-feedback">
                                                    Please provide a valid category name.
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Category Slug -->
                                        <div class="col-md-6 mb-4">
                                            <div class="form-floating">
                                                <input type="text"
                                                       class="form-control form-control-lg rounded-custom"
                                                       id="categorySlug"
                                                       name="slug"
                                                       value="${category != null ? category.slug : ''}"
                                                       required
                                                       maxlength="100"
                                                       pattern="^[a-z0-9]+(?:-[a-z0-9]+)*$"
                                                       placeholder="category-slug">
                                                <label for="categorySlug">
                                                    <i class="fas fa-link me-2 text-primary"></i>URL Slug
                                                </label>
                                                <div class="form-text">
                                                    <i class="fas fa-info-circle me-1"></i>
                                                    Use lowercase letters, numbers, and hyphens only
                                                </div>
                                                <div class="invalid-feedback">
                                                    Please provide a valid URL slug (lowercase, no spaces).
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Description -->
                                    <div class="mb-4">
                                        <div class="form-floating">
                                            <textarea class="form-control rounded-custom"
                                                      id="categoryDescription"
                                                      name="description"
                                                      style="height: 120px"
                                                      maxlength="500"
                                                      placeholder="Category description">${category != null ? category.description : ''}</textarea>
                                            <label for="categoryDescription">
                                                <i class="fas fa-align-left me-2 text-primary"></i>Description
                                            </label>
                                            <div class="form-text">
                                                <i class="fas fa-info-circle me-1"></i>
                                                Optional description for this category (max 500 characters)
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <!-- Category Image -->
                                        <div class="col-md-6 mb-4">
                                            <label for="categoryImage" class="form-label fw-semibold">
                                                <i class="fas fa-image me-2 text-primary"></i>Category Image
                                            </label>
                                            <div class="input-group">
                                                <input type="file"
                                                       class="form-control form-control-lg rounded-start-custom"
                                                       id="categoryImage"
                                                       name="image"
                                                       accept="image/*">
                                                <label class="input-group-text bg-gradient-secondary text-white rounded-end-custom" for="categoryImage">
                                                    <i class="fas fa-upload"></i>
                                                </label>
                                            </div>
                                            <div class="form-text">
                                                <i class="fas fa-info-circle me-1"></i>
                                                Recommended size: 300x200px, Max: 2MB
                                            </div>
                                            <c:if test="${category != null && category.imageUrl != null}">
                                                <div class="mt-3">
                                                    <img src="<c:url value='${category.imageUrl}'/>"
                                                         alt="Current category image"
                                                         class="img-thumbnail rounded-custom"
                                                         style="max-width: 150px; max-height: 100px;">
                                                    <div class="small text-muted mt-1">Current image</div>
                                                </div>
                                            </c:if>
                                        </div>

                                        <!-- Status -->
                                        <div class="col-md-6 mb-4">
                                            <label class="form-label fw-semibold">
                                                <i class="fas fa-toggle-on me-2 text-primary"></i>Status
                                            </label>
                                            <div class="card bg-light rounded-custom p-3">
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input"
                                                           type="checkbox"
                                                           role="switch"
                                                           id="categoryActive"
                                                           name="active"
                                                           ${category == null || category.active ? 'checked' : ''}>
                                                    <label class="form-check-label fw-medium" for="categoryActive">
                                                        <span class="badge bg-gradient-success rounded-pill me-2">
                                                            <i class="fas fa-check"></i>
                                                        </span>
                                                        Active Category
                                                    </label>
                                                </div>
                                                <small class="text-muted mt-2">
                                                    <i class="fas fa-info-circle me-1"></i>
                                                    Only active categories are visible to customers
                                                </small>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Meta Information (if editing) -->
                                    <c:if test="${category != null}">
                                        <div class="row mb-4">
                                            <div class="col-12">
                                                <div class="card bg-gradient-info bg-opacity-10 border-info border-opacity-25 rounded-custom">
                                                    <div class="card-body p-3">
                                                        <h6 class="card-title text-info-emphasis mb-2">
                                                            <i class="fas fa-info-circle me-2"></i>Category Information
                                                        </h6>
                                                        <div class="row text-sm">
                                                            <div class="col-md-6">
                                                                <strong>Created:</strong>
                                                                <span class="text-muted">${category.createdAt != null ? category.createdAt : 'N/A'}</span>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <strong>Last Updated:</strong>
                                                                <span class="text-muted">${category.updatedAt != null ? category.updatedAt : 'N/A'}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>

                                    <!-- Action Buttons -->
                                    <div class="d-flex justify-content-between align-items-center pt-4 border-top">
                                        <a href="<c:url value='/admin/category'/>" class="btn btn-outline-secondary btn-lg rounded-custom">
                                            <i class="fas fa-arrow-left me-2"></i>Back to Categories
                                        </a>
                                        <div>
                                            <button type="reset" class="btn btn-outline-warning btn-lg rounded-custom me-3">
                                                <i class="fas fa-undo me-2"></i>Reset
                                            </button>
                                            <button type="submit" class="btn btn-gradient-primary btn-lg rounded-custom shadow-hover">
                                                <i class="fas fa-save me-2"></i>
                                                ${category != null ? 'Update Category' : 'Create Category'}
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Scripts -->
    <script src="<c:url value='/js/bootstrap.bundle.min.js'/>"></script>
    <script>
        // Form validation
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();

        // Auto-generate slug from category name
        document.getElementById('categoryName').addEventListener('input', function() {
            const slug = this.value
                .toLowerCase()
                .trim()
                .replace(/[^a-z0-9\s-]/g, '')
                .replace(/\s+/g, '-')
                .replace(/-+/g, '-')
                .replace(/^-|-$/g, '');

            document.getElementById('categorySlug').value = slug;
        });

        // Image preview
        document.getElementById('categoryImage').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                // Validate file size (2MB max)
                if (file.size > 2 * 1024 * 1024) {
                    alert('File size must be less than 2MB');
                    this.value = '';
                    return;
                }

                // Validate file type
                if (!file.type.startsWith('image/')) {
                    alert('Please select a valid image file');
                    this.value = '';
                    return;
                }
            }
        });

        // Auto-dismiss alerts after 5 seconds
        setTimeout(function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(function(alert) {
                const bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            });
        }, 5000);

        // Add loading state to submit button
        document.querySelector('form').addEventListener('submit', function() {
            const submitBtn = document.querySelector('button[type="submit"]');
            const originalText = submitBtn.innerHTML;
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Processing...';

            // Re-enable after 10 seconds in case of issues
            setTimeout(function() {
                submitBtn.disabled = false;
                submitBtn.innerHTML = originalText;
            }, 10000);
        });
    </script>
</body>
</html>
