
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/views/admin/common/header.jsp"/>

<!-- Enhanced Error Page with Modern Design -->
<div class="container-fluid py-4">
    <div class="row justify-content-center">
        <div class="col-lg-6 col-md-8">
            <div class="card border-0 shadow-lg rounded-3">
                <div class="card-header bg-gradient-danger text-white border-0 py-4">
                    <div class="text-center">
                        <div class="mb-3">
                            <div class="bg-white bg-opacity-25 rounded-circle d-inline-flex align-items-center justify-content-center"
                                 style="width: 80px; height: 80px;">
                                <i class="bi bi-exclamation-triangle-fill display-4"></i>
                            </div>
                        </div>
                        <h2 class="mb-2">❌ Lỗi hệ thống!</h2>
                        <p class="mb-0 opacity-75">Đã xảy ra lỗi trong quá trình xử lý</p>
                    </div>
                </div>

                <div class="card-body p-4">
                    <div class="text-center mb-4">
                        <p class="text-muted mb-4">Vui lòng kiểm tra lại thao tác của bạn hoặc liên hệ quản trị viên nếu lỗi tiếp tục xảy ra.</p>
                    </div>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger border-0 shadow-sm" role="alert">
                            <div class="d-flex align-items-start">
                                <div class="me-3">
                                    <i class="bi bi-info-circle-fill text-danger"></i>
                                </div>
                                <div>
                                    <h6 class="alert-heading mb-2">Chi tiết lỗi:</h6>
                                    <p class="mb-0">${error}</p>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <!-- Error Code Section (if you want to add error codes) -->
                    <c:if test="${not empty errorCode}">
                        <div class="text-center mb-3">
                            <small class="text-muted">Mã lỗi: <code>${errorCode}</code></small>
                        </div>
                    </c:if>
                </div>

                <div class="card-footer bg-light border-0 py-3">
                    <div class="d-flex justify-content-center gap-2">
                        <a href="${pageContext.request.contextPath}/admin/dashboard"
                           class="btn btn-primary shadow-sm">
                            <i class="bi bi-house me-1"></i>🔙 Quay về Dashboard
                        </a>
                        <button type="button" class="btn btn-outline-secondary shadow-sm" onclick="history.back()">
                            <i class="bi bi-arrow-left me-1"></i>Quay lại
                        </button>
                        <button type="button" class="btn btn-outline-info shadow-sm" onclick="location.reload()">
                            <i class="bi bi-arrow-clockwise me-1"></i>Thử lại
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Additional Help Section -->
    <div class="row justify-content-center mt-4">
        <div class="col-lg-6 col-md-8">
            <div class="card border-0 bg-light">
                <div class="card-body text-center py-3">
                    <small class="text-muted">
                        <i class="bi bi-lightbulb me-1"></i>
                        Nếu bạn tiếp tục gặp sự cố, hãy thử làm mới trang hoặc liên hệ với bộ phận hỗ trợ kỹ thuật.
                    </small>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/admin/common/footer.jsp"/>
