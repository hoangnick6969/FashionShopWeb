
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/views/admin/common/header.jsp"/>

<!-- Enhanced Header with Gradient Background -->
<div class="bg-gradient-primary rounded-3 p-4 mb-4 text-white shadow-lg">
    <div class="d-flex justify-content-between align-items-center">
        <div>
            <h2 class="mb-2">
                <i class="bi bi-receipt text-warning me-2"></i>Chi tiết đơn hàng #${order.id}
            </h2>
            <p class="mb-0 opacity-75">Thông tin chi tiết về đơn hàng và sản phẩm</p>
        </div>
        <div class="d-flex gap-2">
            <a href="${pageContext.request.contextPath}/admin/orders" class="btn btn-light btn-sm shadow-sm">
                <i class="bi bi-arrow-left me-1"></i>Quay lại danh sách
            </a>
            <button class="btn btn-success btn-sm shadow-sm" onclick="window.print()">
                <i class="bi bi-printer me-1"></i>In hóa đơn
            </button>
        </div>
    </div>
</div>

<!-- Order Status and Actions -->
<div class="row mb-4">
    <div class="col-12">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <div class="status-icon me-3">
                            <c:choose>
                                <c:when test="${order.status == 'Pending'}">
                                    <div class="bg-warning text-white rounded-circle p-2">
                                        <i class="bi bi-clock"></i>
                                    </div>
                                </c:when>
                                <c:when test="${order.status == 'Processing'}">
                                    <div class="bg-info text-white rounded-circle p-2">
                                        <i class="bi bi-gear"></i>
                                    </div>
                                </c:when>
                                <c:when test="${order.status == 'Shipped'}">
                                    <div class="bg-primary text-white rounded-circle p-2">
                                        <i class="bi bi-truck"></i>
                                    </div>
                                </c:when>
                                <c:when test="${order.status == 'Delivered'}">
                                    <div class="bg-success text-white rounded-circle p-2">
                                        <i class="bi bi-check-circle"></i>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="bg-danger text-white rounded-circle p-2">
                                        <i class="bi bi-x-circle"></i>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div>
                            <h5 class="mb-1">Trạng thái đơn hàng</h5>
                            <span class="badge ${order.status == 'Pending' ? 'bg-warning' :
                                                order.status == 'Processing' ? 'bg-info' :
                                                order.status == 'Shipped' ? 'bg-primary' :
                                                order.status == 'Delivered' ? 'bg-success' : 'bg-danger'} fs-6">
                                ${order.status}
                            </span>
                        </div>
                    </div>
                    <div class="d-flex gap-2">
                        <div class="dropdown">
                            <button class="btn btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                <i class="bi bi-pencil me-1"></i>Cập nhật trạng thái
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="?action=updateStatus&id=${order.id}&status=Pending">
                                    <i class="bi bi-clock text-warning me-2"></i>Pending
                                </a></li>
                                <li><a class="dropdown-item" href="?action=updateStatus&id=${order.id}&status=Processing">
                                    <i class="bi bi-gear text-info me-2"></i>Processing
                                </a></li>
                                <li><a class="dropdown-item" href="?action=updateStatus&id=${order.id}&status=Shipped">
                                    <i class="bi bi-truck text-primary me-2"></i>Shipped
                                </a></li>
                                <li><a class="dropdown-item" href="?action=updateStatus&id=${order.id}&status=Delivered">
                                    <i class="bi bi-check-circle text-success me-2"></i>Delivered
                                </a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="?action=updateStatus&id=${order.id}&status=Cancelled">
                                    <i class="bi bi-x-circle text-danger me-2"></i>Cancelled
                                </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Order Information Cards -->
<div class="row g-4 mb-4">
    <!-- Customer Information -->
    <div class="col-lg-4">
        <div class="card border-0 shadow-sm h-100">
            <div class="card-header bg-light border-0 py-3">
                <div class="d-flex align-items-center">
                    <div class="bg-primary text-white rounded-circle p-2 me-2">
                        <i class="bi bi-person"></i>
                    </div>
                    <h6 class="mb-0">Thông tin khách hàng</h6>
                </div>
            </div>
            <div class="card-body">
                <div class="d-flex align-items-center mb-3">
                    <div class="avatar-circle bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3"
                         style="width: 50px; height: 50px; font-size: 18px; font-weight: bold;">
                        ${order.customer.name.substring(0,1).toUpperCase()}
                    </div>
                    <div>
                        <h6 class="mb-1">${order.customer.name}</h6>
                        <small class="text-muted">Khách hàng</small>
                    </div>
                </div>
                <div class="border-top pt-3">
                    <div class="mb-2">
                        <i class="bi bi-envelope text-muted me-2"></i>
                        <span>${order.customer.email}</span>
                    </div>
                    <div class="mb-2">
                        <i class="bi bi-telephone text-muted me-2"></i>
                        <span>${order.customer.phone}</span>
                    </div>
                    <div class="mb-0">
                        <i class="bi bi-geo-alt text-muted me-2"></i>
                        <span>${order.customer.address}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Order Details -->
    <div class="col-lg-4">
        <div class="card border-0 shadow-sm h-100">
            <div class="card-header bg-light border-0 py-3">
                <div class="d-flex align-items-center">
                    <div class="bg-info text-white rounded-circle p-2 me-2">
                        <i class="bi bi-receipt"></i>
                    </div>
                    <h6 class="mb-0">Chi tiết đơn hàng</h6>
                </div>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted">Mã đơn hàng:</span>
                        <span class="fw-bold">#${order.id}</span>
                    </div>
                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted">Ngày đặt hàng:</span>
                        <span><fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/></span>
                    </div>
                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted">Phương thức thanh toán:</span>
                        <span class="badge bg-light text-dark">${order.paymentMethod.name}</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Phương thức vận chuyển:</span>
                        <span class="badge bg-light text-dark">${order.shippingMethod.name}</span>
                    </div>
                </div>
                <div class="border-top pt-3">
                    <div class="d-flex justify-content-between">
                        <span class="h6 text-primary">Tổng tiền:</span>
                        <span class="h5 text-primary fw-bold">
                            <fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫"/>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Payment & Shipping Info -->
    <div class="col-lg-4">
        <div class="card border-0 shadow-sm h-100">
            <div class="card-header bg-light border-0 py-3">
                <div class="d-flex align-items-center">
                    <div class="bg-success text-white rounded-circle p-2 me-2">
                        <i class="bi bi-credit-card"></i>
                    </div>
                    <h6 class="mb-0">Thanh toán & Vận chuyển</h6>
                </div>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <h6 class="text-primary mb-2">
                        <i class="bi bi-credit-card me-1"></i>Thanh toán
                    </h6>
                    <div class="bg-light rounded-3 p-3">
                        <div class="d-flex align-items-center">
                            <div class="me-2">
                                <c:choose>
                                    <c:when test="${order.paymentMethod.name == 'Credit Card'}">
                                        <i class="bi bi-credit-card-2-front text-primary"></i>
                                    </c:when>
                                    <c:when test="${order.paymentMethod.name == 'PayPal'}">
                                        <i class="bi bi-paypal text-info"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="bi bi-cash text-success"></i>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div>
                                <div class="fw-semibold">${order.paymentMethod.name}</div>
                                <small class="text-muted">Phương thức thanh toán</small>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <h6 class="text-primary mb-2">
                        <i class="bi bi-truck me-1"></i>Vận chuyển
                    </h6>
                    <div class="bg-light rounded-3 p-3">
                        <div class="d-flex align-items-center">
                            <div class="me-2">
                                <i class="bi bi-box-seam text-primary"></i>
                            </div>
                            <div>
                                <div class="fw-semibold">${order.shippingMethod.name}</div>
                                <small class="text-muted">
                                    Phí: <fmt:formatNumber value="${order.shippingMethod.price}" type="currency" currencySymbol="₫"/>
                                </small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Order Items -->
<div class="card border-0 shadow-lg rounded-3">
    <div class="card-header bg-transparent border-0 py-3">
        <div class="d-flex justify-content-between align-items-center">
            <h5 class="mb-0">
                <i class="bi bi-bag-check text-primary me-2"></i>Sản phẩm trong đơn hàng
            </h5>
            <span class="badge bg-primary">${orderDetails.size()} sản phẩm</span>
        </div>
    </div>
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead class="bg-light">
                    <tr>
                        <th scope="col" class="border-0 ps-4">Sản phẩm</th>
                        <th scope="col" class="border-0 text-center">Đơn giá</th>
                        <th scope="col" class="border-0 text-center">Số lượng</th>
                        <th scope="col" class="border-0 text-center pe-4">Thành tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="detail" items="${orderDetails}" varStatus="status">
                        <tr class="border-bottom">
                            <td class="ps-4 py-3">
                                <div class="d-flex align-items-center">
                                    <div class="position-relative me-3">
                                        <img src="${pageContext.request.contextPath}/images/products/${detail.product.image}"
                                             alt="${detail.product.name}" class="rounded-3 shadow-sm"
                                             width="60" height="60" style="object-fit: cover;">
                                        <div class="position-absolute top-0 start-100 translate-middle">
                                            <span class="badge bg-success rounded-pill">
                                                <i class="bi bi-check2"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="mb-1">${detail.product.name}</h6>
                                        <small class="text-muted">SKU: ${detail.product.id}</small>
                                        <c:if test="${not empty detail.product.category}">
                                            <br><small class="badge bg-light text-dark">${detail.product.category.name}</small>
                                        </c:if>
                                    </div>
                                </div>
                            </td>
                            <td class="text-center py-3">
                                <div class="fw-semibold text-primary">
                                    <fmt:formatNumber value="${detail.price}" type="currency" currencySymbol="₫"/>
                                </div>
                            </td>
                            <td class="text-center py-3">
                                <span class="badge bg-primary rounded-pill fs-6 px-3 py-2">
                                    ${detail.quantity}
                                </span>
                            </td>
                            <td class="text-center py-3 pe-4">
                                <div class="fw-bold text-success">
                                    <fmt:formatNumber value="${detail.price * detail.quantity}" type="currency" currencySymbol="₫"/>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot class="bg-light">
                    <tr>
                        <td colspan="3" class="ps-4 py-3 border-0">
                            <div class="d-flex justify-content-end">
                                <strong class="text-primary">Tổng cộng:</strong>
                            </div>
                        </td>
                        <td class="text-center py-3 pe-4 border-0">
                            <div class="h5 text-primary fw-bold mb-0">
                                <fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫"/>
                            </div>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>

<!-- Order Timeline -->
<div class="card border-0 shadow-sm mt-4">
    <div class="card-header bg-light border-0 py-3">
        <h6 class="mb-0">
            <i class="bi bi-clock-history text-primary me-2"></i>Lịch sử đơn hàng
        </h6>
    </div>
    <div class="card-body">
        <div class="timeline">
            <div class="timeline-item">
                <div class="timeline-marker bg-success"></div>
                <div class="timeline-content">
                    <h6 class="mb-1">Đơn hàng được tạo</h6>
                    <small class="text-muted">
                        <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy HH:mm"/>
                    </small>
                </div>
            </div>
            <c:if test="${order.status != 'Pending'}">
                <div class="timeline-item">
                    <div class="timeline-marker bg-info"></div>
                    <div class="timeline-content">
                        <h6 class="mb-1">Đang xử lý</h6>
                        <small class="text-muted">Đơn hàng đang được xử lý</small>
                    </div>
                </div>
            </c:if>
            <c:if test="${order.status == 'Shipped' || order.status == 'Delivered'}">
                <div class="timeline-item">
                    <div class="timeline-marker bg-primary"></div>
                    <div class="timeline-content">
                        <h6 class="mb-1">Đã gửi hàng</h6>
                        <small class="text-muted">Đơn hàng đã được gửi đi</small>
                    </div>
                </div>
            </c:if>
            <c:if test="${order.status == 'Delivered'}">
                <div class="timeline-item">
                    <div class="timeline-marker bg-success"></div>
                    <div class="timeline-content">
                        <h6 class="mb-1">Đã giao hàng</h6>
                        <small class="text-muted">Đơn hàng đã được giao thành công</small>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>

<style>
.timeline {
    position: relative;
    padding-left: 30px;
}

.timeline::before {
    content: '';
    position: absolute;
    left: 10px;
    top: 0;
    bottom: 0;
    width: 2px;
    background: #e9ecef;
}

.timeline-item {
    position: relative;
    margin-bottom: 20px;
}

.timeline-marker {
    position: absolute;
    left: -26px;
    top: 5px;
    width: 12px;
    height: 12px;
    border-radius: 50%;
    border: 2px solid white;
    box-shadow: 0 0 0 2px #e9ecef;
}

.timeline-content {
    background: #f8f9fa;
    padding: 10px 15px;
    border-radius: 8px;
    border-left: 3px solid #dee2e6;
}

@media print {
    .btn, .dropdown {
        display: none !important;
    }

    .card {
        border: 1px solid #ddd !important;
        box-shadow: none !important;
    }
}
</style>

<jsp:include page="/views/admin/common/footer.jsp"/>
