
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/admin/common/header.jsp" />

<!-- Enhanced 404 Error Page -->
<div class="container-fluid py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-xl-6">
            <div class="text-center">
                <!-- 404 Illustration -->
                <div class="error-illustration mb-4">
                    <div class="position-relative d-inline-block">
                        <!-- Main 404 Number -->
                        <div class="display-1 fw-bold text-muted mb-3" style="font-size: 8rem; line-height: 1;">
                            4<span class="text-primary">0</span>4
                        </div>
                        <!-- Floating Elements -->
                        <div class="position-absolute top-0 start-0 translate-middle">
                            <div class="bg-warning text-white rounded-circle p-2 shadow-sm" style="animation: float 3s ease-in-out infinite;">
                                <i class="bi bi-exclamation-triangle"></i>
                            </div>
                        </div>
                        <div class="position-absolute top-0 end-0 translate-middle">
                            <div class="bg-info text-white rounded-circle p-2 shadow-sm" style="animation: float 3s ease-in-out infinite 0.5s;">
                                <i class="bi bi-question-circle"></i>
                            </div>
                        </div>
                        <div class="position-absolute bottom-0 start-50 translate-middle-x">
                            <div class="bg-danger text-white rounded-circle p-2 shadow-sm" style="animation: float 3s ease-in-out infinite 1s;">
                                <i class="bi bi-x-circle"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Error Message Card -->
                <div class="card border-0 shadow-lg rounded-3 mb-4">
                    <div class="card-body p-4">
                        <div class="d-flex align-items-center justify-content-center mb-3">
                            <div class="me-3">
                                <div class="bg-warning bg-opacity-10 text-warning rounded-circle p-3">
                                    <i class="bi bi-exclamation-triangle fs-2"></i>
                                </div>
                            </div>
                            <div class="text-start">
                                <h2 class="text-warning mb-1">
                                    <i class="bi bi-exclamation-triangle me-2"></i>404 - Không tìm thấy
                                </h2>
                                <p class="text-muted mb-0">Oops! Có gì đó không ổn</p>
                            </div>
                        </div>

                        <div class="bg-light rounded-3 p-3 mb-4">
                            <p class="text-dark mb-2">
                                <i class="bi bi-info-circle text-info me-2"></i>
                                Trang bạn yêu cầu không tồn tại hoặc đã bị xóa.
                            </p>
                            <small class="text-muted">
                                Có thể URL bị sai hoặc trang đã được di chuyển đến vị trí khác.
                            </small>
                        </div>

                        <!-- Action Buttons -->
                        <div class="d-flex flex-column flex-sm-row gap-3 justify-content-center">
                            <a href="${pageContext.request.contextPath}/admin/dashboard"
                               class="btn btn-primary btn-lg shadow-sm">
                                <i class="bi bi-house me-2"></i>Quay về Dashboard
                            </a>
                            <button onclick="history.back()" class="btn btn-outline-secondary btn-lg">
                                <i class="bi bi-arrow-left me-2"></i>Quay lại
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Additional Help Section -->
                <div class="row g-3 mb-4">
                    <div class="col-md-4">
                        <div class="card border-0 bg-primary bg-opacity-5 h-100">
                            <div class="card-body text-center p-3">
                                <div class="text-primary mb-2">
                                    <i class="bi bi-search fs-3"></i>
                                </div>
                                <h6 class="text-primary">Tìm kiếm</h6>
                                <small class="text-muted">Sử dụng thanh tìm kiếm để tìm nội dung</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card border-0 bg-success bg-opacity-5 h-100">
                            <div class="card-body text-center p-3">
                                <div class="text-success mb-2">
                                    <i class="bi bi-list-ul fs-3"></i>
                                </div>
                                <h6 class="text-success">Menu chính</h6>
                                <small class="text-muted">Kiểm tra các mục trong menu điều hướng</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card border-0 bg-info bg-opacity-5 h-100">
                            <div class="card-body text-center p-3">
                                <div class="text-info mb-2">
                                    <i class="bi bi-question-circle fs-3"></i>
                                </div>
                                <h6 class="text-info">Hỗ trợ</h6>
                                <small class="text-muted">Liên hệ quản trị viên nếu cần giúp đỡ</small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Quick Links -->
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-transparent border-0 py-3">
                        <h6 class="mb-0">
                            <i class="bi bi-lightning text-primary me-2"></i>Liên kết nhanh
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="d-flex flex-wrap justify-content-center gap-2">
                            <a href="${pageContext.request.contextPath}/admin/categories"
                               class="btn btn-outline-primary btn-sm">
                                <i class="bi bi-tags me-1"></i>Danh mục
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/products"
                               class="btn btn-outline-success btn-sm">
                                <i class="bi bi-box me-1"></i>Sản phẩm
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/orders"
                               class="btn btn-outline-info btn-sm">
                                <i class="bi bi-receipt me-1"></i>Đơn hàng
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/customers"
                               class="btn btn-outline-warning btn-sm">
                                <i class="bi bi-people me-1"></i>Khách hàng
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/reviews"
                               class="btn btn-outline-secondary btn-sm">
                                <i class="bi bi-star me-1"></i>Đánh giá
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
@keyframes float {
    0%, 100% { transform: translateY(0px); }
    50% { transform: translateY(-10px); }
}

.error-illustration {
    animation: fadeInUp 0.8s ease;
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

.card {
    animation: fadeIn 0.6s ease;
}

@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

/* Hover effects */
.btn {
    transition: all 0.3s ease;
}

.btn:hover {
    transform: translateY(-2px);
}

.card:hover {
    transform: translateY(-2px);
    transition: all 0.3s ease;
}
</style>

<jsp:include page="/views/admin/common/footer.jsp" />
