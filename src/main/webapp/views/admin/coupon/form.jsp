
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/views/admin/common/header.jsp"/>

<!-- Enhanced Header with Gradient Background -->
<div class="bg-gradient-primary rounded-3 p-4 mb-4 text-white shadow-lg">
    <div class="d-flex align-items-center">
        <div class="me-3">
            <div class="bg-white bg-opacity-25 rounded-circle p-3">
                <i class="bi bi-tag-fill display-6"></i>
            </div>
        </div>
        <div>
            <h2 class="mb-2">
                <c:choose>
                    <c:when test="${coupon.id == 0}">
                        <i class="bi bi-plus-circle me-2"></i>Thêm mã giảm giá mới
                    </c:when>
                    <c:otherwise>
                        <i class="bi bi-pencil-square me-2"></i>Chỉnh sửa mã giảm giá
                    </c:otherwise>
                </c:choose>
            </h2>
            <p class="mb-0 opacity-75">Quản lý các mã khuyến mãi và giảm giá cho khách hàng</p>
        </div>
    </div>
</div>

<div class="row justify-content-center">
    <div class="col-lg-8 col-md-10">
        <div class="card border-0 shadow-lg rounded-3">
            <div class="card-header bg-transparent border-0 py-4">
                <div class="d-flex align-items-center">
                    <div class="me-3">
                        <div class="bg-primary bg-opacity-10 rounded-circle p-2">
                            <i class="bi bi-info-circle text-primary"></i>
                        </div>
                    </div>
                    <div>
                        <h5 class="mb-1">Thông tin mã giảm giá</h5>
                        <small class="text-muted">Điền đầy đủ thông tin bên dưới</small>
                    </div>
                </div>
            </div>

            <form action="${pageContext.request.contextPath}/admin/coupons" method="post">
                <input type="hidden" name="action" value="save">
                <input type="hidden" name="id" value="${coupon.id}">

                <div class="card-body p-4">
                    <div class="row g-4">
                        <!-- Coupon Code Field -->
                        <div class="col-md-6">
                            <label for="code" class="form-label fw-semibold">
                                <i class="bi bi-tag text-primary me-2"></i>Mã giảm giá
                            </label>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-end-0">
                                    <i class="bi bi-hash text-muted"></i>
                                </span>
                                <input type="text"
                                       class="form-control border-start-0 ps-0"
                                       id="code"
                                       name="code"
                                       value="${coupon.code}"
                                       placeholder="Nhập mã giảm giá (VD: SALE20)"
                                       required>
                            </div>
                            <small class="form-text text-muted">
                                <i class="bi bi-info-circle me-1"></i>Mã phải là duy nhất và dễ nhớ
                            </small>
                        </div>

                        <!-- Discount Percent Field -->
                        <div class="col-md-6">
                            <label for="discountPercent" class="form-label fw-semibold">
                                <i class="bi bi-percent text-success me-2"></i>Phần trăm giảm giá
                            </label>
                            <div class="input-group">
                                <input type="number"
                                       class="form-control"
                                       id="discountPercent"
                                       name="discountPercent"
                                       value="${coupon.discountPercent}"
                                       min="1"
                                       max="100"
                                       placeholder="10"
                                       required>
                                <span class="input-group-text bg-success text-white">
                                    <i class="bi bi-percent"></i>
                                </span>
                            </div>
                            <small class="form-text text-muted">
                                <i class="bi bi-info-circle me-1"></i>Nhập từ 1% đến 100%
                            </small>
                        </div>

                        <!-- Expiry Date Field -->
                        <div class="col-12">
                            <label for="expiryDate" class="form-label fw-semibold">
                                <i class="bi bi-calendar-event text-warning me-2"></i>Ngày hết hạn
                            </label>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-end-0">
                                    <i class="bi bi-calendar3 text-muted"></i>
                                </span>
                                <input type="date"
                                       class="form-control border-start-0 ps-0"
                                       id="expiryDate"
                                       name="expiryDate"
                                       value="${coupon.expiryDate}"
                                       required>
                            </div>
                            <small class="form-text text-muted">
                                <i class="bi bi-info-circle me-1"></i>Chọn ngày hết hiệu lực của mã giảm giá
                            </small>
                        </div>
                    </div>

                    <!-- Preview Card -->
                    <div class="mt-4">
                        <div class="card bg-gradient-info text-white border-0">
                            <div class="card-header bg-transparent border-0 pb-2">
                                <div class="d-flex align-items-center">
                                    <i class="bi bi-eye me-2"></i>
                                    <span class="fw-semibold">Xem trước</span>
                                </div>
                            </div>
                            <div class="card-body pt-0">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div>
                                        <div class="h5 mb-1">
                                            <i class="bi bi-tag-fill me-1"></i>
                                            <span id="previewCode">${coupon.code || 'MÃ GIẢM GIÁ'}</span>
                                        </div>
                                        <div class="opacity-75">
                                            Giảm <span id="previewDiscount">${coupon.discountPercent || '0'}</span>%
                                            cho đơn hàng của bạn
                                        </div>
                                    </div>
                                    <div class="text-end">
                                        <div class="display-6 fw-bold">
                                            <span id="previewDiscountLarge">${coupon.discountPercent || '0'}</span>%
                                        </div>
                                        <small class="opacity-75">OFF</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-footer bg-light border-0 py-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="${pageContext.request.contextPath}/admin/coupons"
                           class="btn btn-outline-secondary shadow-sm">
                            <i class="bi bi-arrow-left me-1"></i>Quay lại danh sách
                        </a>

                        <div class="d-flex gap-2">
                            <button type="reset" class="btn btn-outline-warning shadow-sm">
                                <i class="bi bi-arrow-counterclockwise me-1"></i>Đặt lại
                            </button>
                            <button type="submit" class="btn btn-primary shadow-sm">
                                <i class="bi bi-check-circle me-1"></i>
                                <c:choose>
                                    <c:when test="${coupon.id == 0}">Thêm mã</c:when>
                                    <c:otherwise>Cập nhật</c:otherwise>
                                </c:choose>
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!-- Help Card -->
        <div class="card border-0 bg-light mt-4">
            <div class="card-body text-center py-3">
                <div class="row g-3 text-center">
                    <div class="col-md-4">
                        <div class="mb-2">
                            <i class="bi bi-lightbulb text-warning display-6"></i>
                        </div>
                        <h6 class="mb-1">Mẹo tạo mã</h6>
                        <small class="text-muted">Sử dụng mã ngắn gọn, dễ nhớ như SALE20, WELCOME10</small>
                    </div>
                    <div class="col-md-4">
                        <div class="mb-2">
                            <i class="bi bi-shield-check text-success display-6"></i>
                        </div>
                        <h6 class="mb-1">Bảo mật</h6>
                        <small class="text-muted">Mã giảm giá sẽ được mã hóa và bảo mật tự động</small>
                    </div>
                    <div class="col-md-4">
                        <div class="mb-2">
                            <i class="bi bi-graph-up text-info display-6"></i>
                        </div>
                        <h6 class="mb-1">Theo dõi</h6>
                        <small class="text-muted">Bạn có thể xem thống kê sử dụng mã trong dashboard</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Real-time Preview Script -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const codeInput = document.getElementById('code');
    const discountInput = document.getElementById('discountPercent');
    const previewCode = document.getElementById('previewCode');
    const previewDiscount = document.getElementById('previewDiscount');
    const previewDiscountLarge = document.getElementById('previewDiscountLarge');

    function updatePreview() {
        const code = codeInput.value || 'MÃ GIẢM GIÁ';
        const discount = discountInput.value || '0';

        previewCode.textContent = code;
        previewDiscount.textContent = discount;
        previewDiscountLarge.textContent = discount;
    }

    codeInput.addEventListener('input', updatePreview);
    discountInput.addEventListener('input', updatePreview);
});
</script>

<jsp:include page="/views/admin/common/footer.jsp"/>
