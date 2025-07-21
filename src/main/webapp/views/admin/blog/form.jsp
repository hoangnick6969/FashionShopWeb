
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/admin/common/header.jsp" />

<!-- Enhanced Header with Gradient Background -->
<div class="bg-gradient-primary rounded-3 p-4 mb-4 text-white shadow-lg">
    <div class="d-flex justify-content-between align-items-center">
        <div>
            <h2 class="mb-2">
                <i class="bi bi-journal-text text-white me-2"></i>
                <c:choose>
                    <c:when test="${blog != null}">Chỉnh sửa bài viết</c:when>
                    <c:otherwise>Thêm bài viết mới</c:otherwise>
                </c:choose>
            </h2>
            <p class="mb-0 opacity-75">
                <c:choose>
                    <c:when test="${blog != null}">Cập nhật thông tin bài viết</c:when>
                    <c:otherwise>Tạo bài viết mới cho blog</c:otherwise>
                </c:choose>
            </p>
        </div>
        <div class="d-flex gap-2">
            <a href="${pageContext.request.contextPath}/admin/blog" class="btn btn-light btn-sm shadow-sm">
                <i class="bi bi-arrow-left me-1"></i> Quay lại
            </a>
            <button type="button" class="btn btn-outline-light btn-sm shadow-sm" onclick="previewPost()">
                <i class="bi bi-eye me-1"></i> Xem trước
            </button>
        </div>
    </div>
</div>

<!-- Form Card -->
<div class="card border-0 shadow-lg rounded-3">
    <div class="card-header bg-transparent border-0 py-3">
        <div class="d-flex align-items-center">
            <div class="me-3">
                <div class="bg-primary bg-opacity-10 rounded-circle p-2">
                    <i class="bi bi-pencil-square text-primary"></i>
                </div>
            </div>
            <div>
                <h5 class="mb-0">Thông tin bài viết</h5>
                <small class="text-muted">Điền đầy đủ thông tin để tạo bài viết</small>
            </div>
        </div>
    </div>

    <div class="card-body p-4">
        <c:if test="${not empty error}">
            <div class="alert alert-danger border-0 rounded-3 shadow-sm" role="alert">
                <div class="d-flex align-items-center">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    <div>
                        <strong>Lỗi!</strong> ${error}
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${not empty success}">
            <div class="alert alert-success border-0 rounded-3 shadow-sm" role="alert">
                <div class="d-flex align-items-center">
                    <i class="bi bi-check-circle-fill me-2"></i>
                    <div>
                        <strong>Thành công!</strong> ${success}
                    </div>
                </div>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/admin/blog" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
            <c:if test="${blog != null}">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="${blog.id}">
            </c:if>
            <c:if test="${blog == null}">
                <input type="hidden" name="action" value="insert">
            </c:if>

            <div class="row g-4">
                <!-- Left Column -->
                <div class="col-lg-8">
                    <!-- Title Section -->
                    <div class="card border-0 bg-light h-100 mb-4">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-type text-primary me-2"></i>
                                <label for="title" class="form-label fw-semibold mb-0">Tiêu đề bài viết</label>
                                <span class="text-danger ms-1">*</span>
                            </div>
                            <input type="text" class="form-control form-control-lg border-0 shadow-sm"
                                   id="title" name="title" value="${blog.title}"
                                   placeholder="Nhập tiêu đề bài viết..." required>
                            <div class="invalid-feedback">
                                Vui lòng nhập tiêu đề bài viết.
                            </div>
                            <div class="form-text">
                                <i class="bi bi-info-circle me-1"></i>Tiêu đề sẽ hiển thị trên trang chủ và chi tiết bài viết
                            </div>
                        </div>
                    </div>

                    <!-- Content Section -->
                    <div class="card border-0 bg-light h-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-file-text text-primary me-2"></i>
                                <label for="content" class="form-label fw-semibold mb-0">Nội dung bài viết</label>
                                <span class="text-danger ms-1">*</span>
                            </div>
                            <textarea class="form-control border-0 shadow-sm"
                                      id="content" name="content" rows="15"
                                      placeholder="Nhập nội dung bài viết..." required>${blog.content}</textarea>
                            <div class="invalid-feedback">
                                Vui lòng nhập nội dung bài viết.
                            </div>
                            <div class="form-text">
                                <i class="bi bi-markdown me-1"></i>Hỗ trợ HTML và Markdown
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column -->
                <div class="col-lg-4">
                    <!-- Excerpt Section -->
                    <div class="card border-0 bg-warning bg-opacity-10 mb-4">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-card-text text-warning me-2"></i>
                                <label for="excerpt" class="form-label fw-semibold mb-0">Tóm tắt</label>
                            </div>
                            <textarea class="form-control border-0 shadow-sm"
                                      id="excerpt" name="excerpt" rows="4"
                                      placeholder="Nhập tóm tắt ngắn gọn...">${blog.excerpt}</textarea>
                            <div class="form-text">
                                <i class="bi bi-info-circle me-1"></i>Tóm tắt hiển thị trong danh sách bài viết
                            </div>
                        </div>
                    </div>

                    <!-- Image Upload Section -->
                    <div class="card border-0 bg-info bg-opacity-10 mb-4">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-image text-info me-2"></i>
                                <label for="image" class="form-label fw-semibold mb-0">Hình ảnh đại diện</label>
                            </div>

                            <c:if test="${blog != null && blog.image != null}">
                                <div class="current-image mb-3">
                                    <div class="position-relative d-inline-block">
                                        <img src="${pageContext.request.contextPath}/images/blogs/${blog.image}"
                                             alt="Current image" class="img-fluid rounded-3 shadow-sm"
                                             style="max-height: 150px; object-fit: cover;">
                                        <div class="position-absolute top-0 end-0 m-2">
                                            <span class="badge bg-success rounded-pill">
                                                <i class="bi bi-check2"></i> Hiện tại
                                            </span>
                                        </div>
                                    </div>
                                    <div class="form-text mt-2">
                                        <i class="bi bi-info-circle me-1"></i>Hình ảnh hiện tại
                                    </div>
                                </div>
                            </c:if>

                            <div class="upload-area border-2 border-dashed border-info rounded-3 p-4 text-center bg-white">
                                <input type="file" class="form-control d-none" id="image" name="image" accept="image/*" onchange="previewImage(this)">
                                <label for="image" class="cursor-pointer">
                                    <div class="upload-placeholder">
                                        <i class="bi bi-cloud-upload display-6 text-info mb-2 d-block"></i>
                                        <div class="fw-semibold text-info">Chọn hình ảnh</div>
                                        <small class="text-muted">Kéo thả hoặc click để chọn</small>
                                    </div>
                                </label>
                            </div>
                            <div class="form-text">
                                <i class="bi bi-info-circle me-1"></i>Định dạng: JPG, PNG, GIF (tối đa 5MB)
                            </div>
                        </div>
                    </div>

                    <!-- Publish Status -->
                    <div class="card border-0 bg-success bg-opacity-10">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-broadcast text-success me-2"></i>
                                <label class="form-label fw-semibold mb-0">Trạng thái xuất bản</label>
                            </div>

                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" role="switch"
                                       id="published" name="published" value="true"
                                       ${blog != null && blog.published ? 'checked' : ''}>
                                <label class="form-check-label fw-semibold" for="published">
                                    <span class="publish-text">${blog != null && blog.published ? 'Đã xuất bản' : 'Lưu nháp'}</span>
                                </label>
                            </div>
                            <div class="form-text">
                                <i class="bi bi-info-circle me-1"></i>
                                <span class="publish-description">
                                    ${blog != null && blog.published ? 'Bài viết sẽ hiển thị công khai' : 'Bài viết chỉ lưu dưới dạng nháp'}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="row mt-4">
                <div class="col-12">
                    <div class="card border-0 bg-light">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex gap-2">
                                    <button type="button" class="btn btn-outline-secondary" onclick="saveDraft()">
                                        <i class="bi bi-save me-1"></i> Lưu nháp
                                    </button>
                                    <button type="button" class="btn btn-outline-info" onclick="previewPost()">
                                        <i class="bi bi-eye me-1"></i> Xem trước
                                    </button>
                                </div>
                                <div class="d-flex gap-2">
                                    <a href="${pageContext.request.contextPath}/admin/blog" class="btn btn-outline-danger">
                                        <i class="bi bi-x-circle me-1"></i> Hủy
                                    </a>
                                    <button type="submit" class="btn btn-primary shadow-sm">
                                        <i class="bi bi-check-circle me-1"></i>
                                        <c:choose>
                                            <c:when test="${blog != null}">Cập nhật bài viết</c:when>
                                            <c:otherwise>Tạo bài viết</c:otherwise>
                                        </c:choose>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- Preview Modal -->
<div class="modal fade" id="previewModal" tabindex="-1">
    <div class="modal-dialog modal-xl">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-gradient-primary text-white border-0">
                <div class="d-flex align-items-center">
                    <div class="me-3">
                        <div class="bg-white bg-opacity-25 rounded-circle p-2">
                            <i class="bi bi-eye-fill"></i>
                        </div>
                    </div>
                    <div>
                        <h5 class="modal-title mb-0">Xem trước bài viết</h5>
                        <small class="opacity-75">Bản xem trước không lưu thay đổi</small>
                    </div>
                </div>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-0">
                <div id="previewContent" class="p-4">
                    <!-- Preview content will be loaded here -->
                </div>
            </div>
            <div class="modal-footer border-0 bg-light">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                    <i class="bi bi-x-circle me-1"></i>Đóng
                </button>
                <button type="button" class="btn btn-primary" onclick="continueEditing()">
                    <i class="bi bi-pencil me-1"></i>Tiếp tục chỉnh sửa
                </button>
            </div>
        </div>
    </div>
</div>

<style>
.cursor-pointer {
    cursor: pointer;
}

.upload-area:hover {
    border-color: var(--bs-info) !important;
    background-color: rgba(var(--bs-info-rgb), 0.05) !important;
}

.form-control:focus {
    border-color: var(--bs-primary);
    box-shadow: 0 0 0 0.2rem rgba(var(--bs-primary-rgb), 0.25);
}

.card:hover {
    transform: translateY(-2px);
    transition: all 0.3s ease;
}

.form-check-input:checked {
    background-color: var(--bs-success);
    border-color: var(--bs-success);
}
</style>

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

// Image preview
function previewImage(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const uploadArea = input.closest('.upload-area');
            const placeholder = uploadArea.querySelector('.upload-placeholder');

            placeholder.innerHTML = `
                <img src="${e.target.result}" class="img-fluid rounded-3 mb-2" style="max-height: 120px; object-fit: cover;">
                <div class="fw-semibold text-success">Hình ảnh đã chọn</div>
                <small class="text-muted">Click để thay đổi</small>
            `;
        };
        reader.readAsDataURL(input.files[0]);
    }
}

// Publish status toggle
document.getElementById('published').addEventListener('change', function() {
    const publishText = document.querySelector('.publish-text');
    const publishDescription = document.querySelector('.publish-description');

    if (this.checked) {
        publishText.textContent = 'Đã xuất bản';
        publishDescription.textContent = 'Bài viết sẽ hiển thị công khai';
    } else {
        publishText.textContent = 'Lưu nháp';
        publishDescription.textContent = 'Bài viết chỉ lưu dưới dạng nháp';
    }
});

// Preview functionality


function continueEditing() {
    bootstrap.Modal.getInstance(document.getElementById('previewModal')).hide();
}

function saveDraft() {
    document.getElementById('published').checked = false;
    document.querySelector('form').submit();
}
</script>

<script src="assets/js/previewPost.js"></script>


<jsp:include page="/views/admin/common/footer.jsp" />
