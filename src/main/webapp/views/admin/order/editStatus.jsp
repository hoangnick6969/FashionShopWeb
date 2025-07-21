
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/admin/common/header.jsp" />

<!-- Enhanced Header with Gradient Background -->
<div class="bg-gradient-primary rounded-3 p-4 mb-4 text-white shadow-lg">
    <div class="d-flex justify-content-between align-items-center">
        <div>
            <h2 class="mb-2"><i class="bi bi-pencil-square text-warning me-2"></i>📝 Cập nhật trạng thái đơn hàng</h2>
            <p class="mb-0 opacity-75">Thay đổi trạng thái xử lý đơn hàng #${order.id}</p>
        </div>
        <div class="d-flex gap-2">
            <a href="${pageContext.request.contextPath}/admin/orders" class="btn btn-light btn-sm shadow-sm">
                <i class="bi bi-arrow-left me-1"></i> Quay lại
            </a>
        </div>
    </div>
</div>

<div class="row justify-content-center">
    <div class="col-lg-8 col-md-10">
        <div class="card border-0 shadow-lg rounded-3">
            <div class="card-header bg-transparent border-0 py-4">
                <div class="text-center">
                    <div class="mb-3">
                        <div class="bg-primary bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center"
                             style="width: 80px; height: 80px;">
                            <i class="bi bi-clipboard-check display-4 text-primary"></i>
                        </div>
                    </div>
                    <h4 class="mb-1">Thông tin đơn hàng</h4>
                    <small class="text-muted">Cập nhật trạng thái xử lý</small>
                </div>
            </div>

            <div class="card-body p-4">
                <!-- Order Information Cards -->
                <div class="row g-3 mb-4">
                    <div class="col-md-6">
                        <div class="card border-0 bg-light h-100">
                            <div class="card-body">
                                <div class="d-flex align-items-center mb-2">
                                    <i class="bi bi-person text-primary me-2"></i>
                                    <strong>Khách hàng</strong>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="avatar-circle bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3"
                                         style="width: 40px; height: 40px;">
                                        ${order.customer.name.substring(0,1).toUpperCase()}
                                    </div>
                                    <div>
                                        <div class="fw-semibold">${order.customer.name}</div>
                                        <small class="text-muted">Người đặt hàng</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card border-0 bg-light h-100">
                            <div class="card-body">
                                <div class="d-flex align-items-center mb-2">
                                    <i class="bi bi-calendar text-success me-2"></i>
                                    <strong>Ngày đặt</strong>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="bg-success bg-opacity-10 rounded-circle d-flex align-items-center justify-content-center me-3"
                                         style="width: 40px; height: 40px;">
                                        <i class="bi bi-calendar-check text-success"></i>
                                    </div>
                                    <div>
                                        <div class="fw-semibold">${order.orderDate}</div>
                                        <small class="text-muted">Thời gian đặt hàng</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Total Amount Card -->
                <div class="card border-0 bg-warning bg-opacity-10 mb-4">
                    <div class="card-body text-center py-4">
                        <div class="mb-2">
                            <i class="bi bi-currency-dollar text-warning display-5"></i>
                        </div>
                        <h4 class="text-warning mb-1">Tổng tiền đơn hàng</h4>
                        <h3 class="text-dark fw-bold">${order.total} VND</h3>
                        <small class="text-muted">Bao gồm thuế và phí vận chuyển</small>
                    </div>
                </div>

                <!-- Status Update Form -->
                <form method="post" action="${pageContext.request.contextPath}/admin/orders?action=updateStatus">
                    <input type="hidden" name="id" value="${order.id}" />

                    <div class="card border-0 bg-primary bg-opacity-5">
                        <div class="card-body">
                            <div class="d-flex align-items-center mb-3">
                                <i class="bi bi-gear text-primary me-2"></i>
                                <h6 class="mb-0 fw-bold">Cập nhật trạng thái đơn hàng</h6>
                            </div>

                            <div class="mb-4">
                                <label class="form-label fw-semibold mb-3">
                                    <i class="bi bi-list-ul me-1"></i>Chọn trạng thái mới:
                                </label>
                                <select name="status" class="form-select form-select-lg shadow-sm" required>
                                    <option value="PENDING" ${order.status == 'PENDING' ? 'selected' : ''}>
                                        🕒 Chờ xử lý
                                    </option>
                                    <option value="CONFIRMED" ${order.status == 'CONFIRMED' ? 'selected' : ''}>
                                        ✅ Đã xác nhận
                                    </option>
                                    <option value="SHIPPED" ${order.status == 'SHIPPED' ? 'selected' : ''}>
                                        🚚 Đang giao
                                    </option>
                                    <option value="DELIVERED" ${order.status == 'DELIVERED' ? 'selected' : ''}>
                                        📦 Đã giao
                                    </option>
                                    <option value="CANCELLED" ${order.status == 'CANCELLED' ? 'selected' : ''}>
                                        ❌ Đã hủy
                                    </option>
                                    <option value="FAILED" ${order.status == 'FAILED' ? 'selected' : ''}>
                                        ⚠️ Giao thất bại
                                    </option>
                                </select>
                            </div>

                            <!-- Current Status Display -->
                            <div class="alert alert-info border-0 shadow-sm" role="alert">
                                <div class="d-flex align-items-center">
                                    <i class="bi bi-info-circle me-2"></i>
                                    <strong>Trạng thái hiện tại:</strong>
                                    <span class="badge ms-2 ${order.status == 'PENDING' ? 'bg-warning' :
                                                               order.status == 'CONFIRMED' ? 'bg-success' :
                                                               order.status == 'SHIPPED' ? 'bg-info' :
                                                               order.status == 'DELIVERED' ? 'bg-primary' :
                                                               order.status == 'CANCELLED' ? 'bg-danger' : 'bg-secondary'}">
                                        ${order.status == 'PENDING' ? '🕒 Chờ xử lý' :
                                          order.status == 'CONFIRMED' ? '✅ Đã xác nhận' :
                                          order.status == 'SHIPPED' ? '🚚 Đang giao' :
                                          order.status == 'DELIVERED' ? '📦 Đã giao' :
                                          order.status == 'CANCELLED' ? '❌ Đã hủy' : '⚠️ Giao thất bại'}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="d-flex justify-content-center gap-3 mt-4">
                        <a href="${pageContext.request.contextPath}/admin/orders"
                           class="btn btn-outline-secondary px-4 py-2 shadow-sm">
                            <i class="bi bi-x-circle me-1"></i>Hủy bỏ
                        </a>
                        <button type="submit" class="btn btn-primary px-4 py-2 shadow-sm">
                            <i class="bi bi-check-circle me-1"></i>💾 Cập nhật trạng thái
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Additional Information Card -->
        <div class="card border-0 bg-light mt-4">
            <div class="card-body text-center py-3">
                <small class="text-muted">
                    <i class="bi bi-lightbulb me-1"></i>
                    Lưu ý: Việc thay đổi trạng thái sẽ được ghi lại và có thể gửi thông báo đến khách hàng.
                </small>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/admin/common/footer.jsp" />
