
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/admin/common/header.jsp" />

<!-- Enhanced Header with Gradient Background -->
<div class="bg-gradient-primary rounded-3 p-4 mb-4 text-white shadow-lg">
    <div class="d-flex justify-content-between align-items-center">
        <div>
            <h2 class="mb-2">
                <i class="bi bi-box-seam text-warning me-2"></i>
                <c:choose>
                    <c:when test="${product != null}">Chỉnh sửa sản phẩm</c:when>
                    <c:otherwise>Thêm sản phẩm mới</c:otherwise>
                </c:choose>
            </h2>
            <p class="mb-0 opacity-75">
                <c:choose>
                    <c:when test="${product != null}">Cập nhật thông tin sản phẩm #${product.id}</c:when>
                    <c:otherwise>Tạo sản phẩm mới cho cửa hàng</c:otherwise>
                </c:choose>
            </p>
        </div>
        <div class="d-flex gap-2">
            <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-light btn-sm shadow-sm">
                <i class="bi bi-arrow-left me-1"></i>Quay lại danh sách
            </a>
        </div>
    </div>
</div>

<!-- Main Form Container -->
<div class="container-fluid px-0">
    <div class="row g-4">
        <!-- Left Column - Main Form -->
        <div class="col-lg-8">
            <div class="card border-0 shadow-lg rounded-3">
                <div class="card-header bg-transparent border-0 py-3">
                    <h5 class="mb-0">
                        <i class="bi bi-info-circle text-primary me-2"></i>Thông tin cơ bản
                    </h5>
                </div>
                <div class="card-body p-4">
                    <form method="post" action="${pageContext.request.contextPath}/admin/products" enctype="multipart/form-data" id="productForm">
                        <c:if test="${product != null}">
                            <input type="hidden" name="action" value="update" />
                            <input type="hidden" name="id" value="${product.id}" />
                        </c:if>
                        <c:if test="${product == null}">
                            <input type="hidden" name="action" value="create" />
                        </c:if>

                        <!-- Product Name -->
                        <div class="mb-4">
                            <label for="productName" class="form-label fw-semibold">
                                <i class="bi bi-tag text-primary me-1"></i>Tên sản phẩm <span class="text-danger">*</span>
                            </label>
                            <input type="text" class="form-control form-control-lg shadow-sm border-0 bg-light" 
                                   id="productName" name="name" value="${product.name}" 
                                   placeholder="Nhập tên sản phẩm..." required>
                            <div class="form-text">
                                <i class="bi bi-info-circle me-1"></i>Tên sản phẩm sẽ hiển thị cho khách hàng
                            </div>
                        </div>

                        <!-- Product Description -->
                        <div class="mb-4">
                            <label for="productDescription" class="form-label fw-semibold">
                                <i class="bi bi-card-text text-success me-1"></i>Mô tả sản phẩm
                            </label>
                            <textarea class="form-control shadow-sm border-0 bg-light" 
                                      id="productDescription" name="description" rows="5"
                                      placeholder="Nhập mô tả chi tiết về sản phẩm...">${product.description}</textarea>
                            <div class="form-text">
                                <i class="bi bi-lightbulb me-1"></i>Mô tả chi tiết giúp khách hàng hiểu rõ hơn về sản phẩm
                            </div>
                        </div>

                        <!-- Price and Category Row -->
                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label for="productPrice" class="form-label fw-semibold">
                                    <i class="bi bi-currency-dollar text-warning me-1"></i>Giá bán <span class="text-danger">*</span>
                                </label>
                                <div class="input-group input-group-lg shadow-sm">
                                    <input type="number" step="0.01" class="form-control border-0 bg-light" 
                                           id="productPrice" name="price" value="${product.price}" 
                                           placeholder="0.00" required>
                                    <span class="input-group-text bg-warning text-dark border-0 fw-bold">VND</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="productCategory" class="form-label fw-semibold">
                                    <i class="bi bi-collection text-info me-1"></i>Danh mục <span class="text-danger">*</span>
                                </label>
                                <select class="form-select form-select-lg shadow-sm border-0 bg-light" 
                                        id="productCategory" name="categoryId" required>
                                    <option value="">Chọn danh mục...</option>
                                    <c:forEach var="cat" items="${categories}">
                                        <option value="${cat.id}" ${product.category.id == cat.id ? 'selected' : ''}>
                                            ${cat.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <!-- Image Upload Section -->
                        <div class="mb-4">
                            <label for="productImage" class="form-label fw-semibold">
                                <i class="bi bi-image text-purple me-1"></i>Hình ảnh sản phẩm
                            </label>
                            <div class="card border-2 border-dashed border-primary bg-primary bg-opacity-5">
                                <div class="card-body text-center py-4">
                                    <div class="mb-3">
                                        <i class="bi bi-cloud-upload display-4 text-primary"></i>
                                    </div>
                                    <input type="file" class="form-control shadow-sm" 
                                           id="productImage" name="image" accept="image/*">
                                    <div class="mt-2">
                                        <small class="text-muted">
                                            <i class="bi bi-info-circle me-1"></i>
                                            Chọn file JPG, PNG hoặc GIF (tối đa 5MB)
                                        </small>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${product != null && product.mainImage != null}">
                                <div class="mt-3">
                                    <div class="d-flex align-items-center bg-light rounded-3 p-3">
                                        <img src="${pageContext.request.contextPath}/images/products/${product.mainImage}" 
                                             alt="Current image" class="rounded shadow-sm me-3" width="60" height="60"
                                             style="object-fit: cover;">
                                        <div>
                                            <div class="fw-semibold text-success">
                                                <i class="bi bi-check-circle me-1"></i>Hình ảnh hiện tại
                                            </div>
                                            <small class="text-muted">${product.mainImage}</small>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>

                        <!-- Form Actions -->
                        <div class="d-flex justify-content-between align-items-center pt-3 border-top">
                            <div class="text-muted small">
                                <i class="bi bi-asterisk text-danger me-1"></i>
                                Các trường bắt buộc được đánh dấu *
                            </div>
                            <div class="d-flex gap-2">
                                <a href="${pageContext.request.contextPath}/admin/products" 
                                   class="btn btn-outline-secondary shadow-sm">
                                    <i class="bi bi-x-circle me-1"></i>Hủy bỏ
                                </a>
                                <button type="submit" class="btn btn-primary shadow-sm px-4">
                                    <i class="bi bi-check-circle me-1"></i>
                                    <c:choose>
                                        <c:when test="${product != null}">Cập nhật sản phẩm</c:when>
                                        <c:otherwise>Tạo sản phẩm</c:otherwise>
                                    </c:choose>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Right Column - Additional Info & Preview -->
        <div class="col-lg-4">
            <!-- Preview Card -->
            <div class="card border-0 shadow-lg rounded-3 mb-4">
                <div class="card-header bg-light border-0 py-3">
                    <h6 class="mb-0 text-center">
                        <i class="bi bi-eye text-info me-1"></i>Xem trước sản phẩm
                    </h6>
                </div>
                <div class="card-body p-0">
                    <div id="productPreview" class="text-center p-4">
                        <div class="mb-3">
                            <div class="bg-light rounded-3 d-flex align-items-center justify-content-center" 
                                 style="height: 200px;">
                                <c:choose>
                                    <c:when test="${product != null && product.mainImage != null}">
                                        <img src="${pageContext.request.contextPath}/images/products/${product.mainImage}" 
                                             alt="Preview" class="img-fluid rounded shadow-sm" 
                                             style="max-height: 180px; object-fit: cover;">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="text-muted">
                                            <i class="bi bi-image display-4"></i>
                                            <div class="mt-2">Chưa có hình ảnh</div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="px-3">
                            <h6 class="fw-bold text-dark mb-2" id="previewName">
                                ${product != null ? product.name : 'Tên sản phẩm'}
                            </h6>
                            <div class="text-primary fw-bold fs-5 mb-2" id="previewPrice">
                                <i class="bi bi-currency-dollar me-1"></i>
                                ${product != null ? product.price : '0'} VND
                            </div>
                            <div class="text-muted small" id="previewCategory">
                                <i class="bi bi-tag me-1"></i>
                                ${product != null ? product.category.name : 'Chưa chọn danh mục'}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tips Card -->
            <div class="card border-0 shadow-sm bg-gradient-info text-white">
                <div class="card-body p-4">
                    <h6 class="fw-bold mb-3">
                        <i class="bi bi-lightbulb-fill me-1"></i>Mẹo tạo sản phẩm hiệu quả
                    </h6>
                    <ul class="list-unstyled mb-0 small">
                        <li class="mb-2">
                            <i class="bi bi-check-circle-fill me-1"></i>
                            Sử dụng tên sản phẩm rõ ràng, dễ hiểu
                        </li>
                        <li class="mb-2">
                            <i class="bi bi-check-circle-fill me-1"></i>
                            Viết mô tả chi tiết về tính năng, ưu điểm
                        </li>
                        <li class="mb-2">
                            <i class="bi bi-check-circle-fill me-1"></i>
                            Chọn hình ảnh chất lượng cao, rõ nét
                        </li>
                        <li class="mb-0">
                            <i class="bi bi-check-circle-fill me-1"></i>
                            Đặt giá cạnh tranh, phù hợp thị trường
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Form Validation & Preview JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('productForm');
    const nameInput = document.getElementById('productName');
    const priceInput = document.getElementById('productPrice');
    const categorySelect = document.getElementById('productCategory');
    const imageInput = document.getElementById('productImage');
    
    const previewName = document.getElementById('previewName');
    const previewPrice = document.getElementById('previewPrice');
    const previewCategory = document.getElementById('previewCategory');

    // Real-time preview updates
    nameInput.addEventListener('input', function() {
        previewName.textContent = this.value || 'Tên sản phẩm';
    });

    priceInput.addEventListener('input', function() {
        const price = this.value || '0';
        previewPrice.innerHTML = '<i class="bi bi-currency-dollar me-1"></i>' + price + ' VND';
    });

    categorySelect.addEventListener('change', function() {
        const selectedOption = this.options[this.selectedIndex];
        const categoryName = selectedOption.text || 'Chưa chọn danh mục';
        previewCategory.innerHTML = '<i class="bi bi-tag me-1"></i>' + categoryName;
    });

    // Image preview
    imageInput.addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const preview = document.querySelector('#productPreview .bg-light');
                preview.innerHTML = '<img src="' + e.target.result + '" alt="Preview" class="img-fluid rounded shadow-sm" style="max-height: 180px; object-fit: cover;">';
            };
            reader.readAsDataURL(file);
        }
    });

    // Form validation
    form.addEventListener('submit', function(e) {
        let isValid = true;
        const requiredFields = [nameInput, priceInput, categorySelect];
        
        requiredFields.forEach(field => {
            field.classList.remove('is-invalid');
            if (!field.value.trim()) {
                field.classList.add('is-invalid');
                isValid = false;
            }
        });

        if (!isValid) {
            e.preventDefault();
            // Show error toast or alert
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true
            });
            
            Toast.fire({
                icon: 'error',
                title: 'Vui lòng điền đầy đủ thông tin bắt buộc!'
            });
        }
    });

    // Input validation styling
    const inputs = document.querySelectorAll('.form-control, .form-select');
    inputs.forEach(input => {
        input.addEventListener('blur', function() {
            if (this.hasAttribute('required') && !this.value.trim()) {
                this.classList.add('is-invalid');
            } else {
                this.classList.remove('is-invalid');
                this.classList.add('is-valid');
            }
        });

        input.addEventListener('input', function() {
            if (this.classList.contains('is-invalid') && this.value.trim()) {
                this.classList.remove('is-invalid');
                this.classList.add('is-valid');
            }
        });
    });
});
</script>

<style>
/* Custom gradient backgrounds */
.bg-gradient-primary {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.bg-gradient-info {
    background: linear-gradient(135deg, #74b9ff 0%, #0984e3 100%);
}

/* Enhanced form styling */
.form-control:focus, .form-select:focus {
    border-color: #667eea;
    box-shadow: 0 0 0 0.25rem rgba(102, 126, 234, 0.15);
}

.form-control.is-valid {
    border-color: #198754;
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%23198754' d='m2.3 6.73.8-.77 1.48-1.48a.75.75 0 1 1 1.06 1.06l-1.48 1.48-.77.77a.75.75 0 0 1-1.06 0l-.77-.77a.75.75 0 1 1 1.06-1.06l.77.77z'/%3e%3c/svg%3e");
}

.form-control.is-invalid {
    border-color: #dc3545;
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath d='m5.8 4.6.3-.4.3.4M6 8.5V8'/%3e%3c/svg%3e");
}

/* Enhanced card styling */
.card {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.15) !important;
}

/* Preview animations */
#productPreview img {
    transition: all 0.3s ease;
}

#productPreview img:hover {
    transform: scale(1.05);
}

/* Button enhancements */
.btn {
    transition: all 0.3s ease;
}

.btn:hover {
    transform: translateY(-1px);
}

/* Custom file upload styling */
.form-control[type="file"] {
    border: 2px dashed #667eea;
    background: rgba(102, 126, 234, 0.05);
    padding: 1rem;
}

.form-control[type="file"]:hover {
    border-color: #4c63d2;
    background: rgba(102, 126, 234, 0.1);
}
</style>

<jsp:include page="/views/admin/common/footer.jsp" />
