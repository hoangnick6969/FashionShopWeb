
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/admin/common/header.jsp" />

<!-- Enhanced Header with Gradient Background -->
<div class="bg-gradient-primary rounded-3 p-4 mb-4 text-white shadow-lg">
    <div class="d-flex justify-content-between align-items-center">
        <div>
            <h2 class="mb-2"><i class="bi bi-tag-fill text-warning me-2"></i>Danh sách mã giảm giá</h2>
            <p class="mb-0 opacity-75">Quản lý các mã giảm giá và khuyến mãi</p>
        </div>
        <div class="d-flex gap-2">
            <a href="${pageContext.request.contextPath}/admin/coupons?action=add"
               class="btn btn-success shadow-sm">
                <i class="bi bi-plus-circle me-1"></i>Thêm mã giảm giá
            </a>
            <button class="btn btn-light btn-sm shadow-sm">
                <i class="bi bi-funnel me-1"></i>Lọc
            </button>
            <button class="btn btn-warning btn-sm shadow-sm">
                <i class="bi bi-download me-1"></i>Xuất Excel
            </button>
        </div>
    </div>
</div>

<!-- Statistics Cards -->
<div class="row mb-4">
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-primary text-white">
            <div class="card-body text-center">
                <i class="bi bi-tag display-6 mb-2"></i>
                <h4>${couponList.size()}</h4>
                <p class="mb-0">Tổng mã giảm giá</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-success text-white">
            <div class="card-body text-center">
                <i class="bi bi-check-circle display-6 mb-2"></i>
                <h4>8</h4>
                <p class="mb-0">Đang hoạt động</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-warning text-white">
            <div class="card-body text-center">
                <i class="bi bi-clock-history display-6 mb-2"></i>
                <h4>3</h4>
                <p class="mb-0">Sắp hết hạn</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-danger text-white">
            <div class="card-body text-center">
                <i class="bi bi-x-circle display-6 mb-2"></i>
                <h4>2</h4>
                <p class="mb-0">Đã hết hạn</p>
            </div>
        </div>
    </div>
</div>

<div class="card border-0 shadow-lg rounded-3">
    <div class="card-header bg-transparent border-0 py-3">
        <div class="d-flex justify-content-between align-items-center">
            <h5 class="mb-0"><i class="bi bi-table me-2 text-primary"></i>Danh sách chi tiết</h5>
            <small class="text-muted">${couponList.size()} mã giảm giá</small>
        </div>
    </div>
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead class="bg-light">
                    <tr>
                        <th scope="col" class="border-0 ps-4">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-hash me-1 text-muted"></i>ID
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-tag me-1 text-muted"></i>Mã giảm giá
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-percent me-1 text-muted"></i>Giảm giá
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-calendar-x me-1 text-muted"></i>Ngày hết hạn
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-check-circle me-1 text-muted"></i>Trạng thái
                            </div>
                        </th>
                        <th scope="col" class="border-0 text-center pe-4">
                            <div class="d-flex align-items-center justify-content-center">
                                <i class="bi bi-gear me-1 text-muted"></i>Thao tác
                            </div>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="c" items="${couponList}" varStatus="status">
                        <tr class="border-bottom">
                            <td class="ps-4 py-3">
                                <span class="badge bg-light text-dark fw-bold">#${c.id}</span>
                            </td>
                            <td class="py-3">
                                <div class="d-flex align-items-center">
                                    <div class="position-relative me-3">
                                        <div class="bg-primary bg-opacity-10 rounded-3 p-3 d-flex align-items-center justify-content-center"
                                             style="width: 50px; height: 50px;">
                                            <i class="bi bi-tag-fill text-primary fs-5"></i>
                                        </div>
                                        <div class="position-absolute top-0 start-100 translate-middle">
                                            <span class="badge bg-success rounded-pill">
                                                <i class="bi bi-check2"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="fw-bold text-primary fs-6">${c.code}</div>
                                        <small class="text-muted">Mã khuyến mãi</small>
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="d-flex align-items-center">
                                    <div class="bg-warning bg-opacity-10 rounded-circle p-2 me-2">
                                        <i class="bi bi-percent text-warning"></i>
                                    </div>
                                    <div>
                                        <span class="badge bg-warning text-dark fs-6 fw-bold">${c.discountPercent}%</span>
                                        <div class="small text-muted">Giảm giá</div>
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="d-flex flex-column">
                                    <div class="d-flex align-items-center mb-1">
                                        <i class="bi bi-calendar3 text-info me-2"></i>
                                        <span class="fw-semibold">${c.expiryDate}</span>
                                    </div>
                                    <small class="text-muted">
                                        <jsp:useBean id="now" class="java.util.Date" />
                                        <c:choose>
                                            <c:when test="${c.expiryDate.before(now)}">
                                                <span class="text-danger">
                                                    <i class="bi bi-exclamation-triangle me-1"></i>Đã hết hạn
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-success">
                                                    <i class="bi bi-check me-1"></i>Còn hiệu lực
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </small>
                                </div>
                            </td>
                            <td class="py-3">
                                <jsp:useBean id="currentDate" class="java.util.Date" />
                                <c:choose>
                                    <c:when test="${c.expiryDate.before(currentDate)}">
                                        <span class="badge bg-danger rounded-pill">
                                            <i class="bi bi-x-circle me-1"></i>Hết hạn
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-success rounded-pill">
                                            <i class="bi bi-check-circle me-1"></i>Hoạt động
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="text-center py-3 pe-4">
                                <div class="btn-group shadow-sm" role="group">
                                    <button type="button" class="btn btn-outline-info btn-sm rounded-start-3"
                                            data-bs-toggle="modal" data-bs-target="#viewModal${c.id}"
                                            data-bs-toggle="tooltip" title="Xem chi tiết">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                    <a href="coupons?action=edit&id=${c.id}"
                                       class="btn btn-outline-warning btn-sm"
                                       data-bs-toggle="tooltip" title="Chỉnh sửa">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a href="coupons?action=delete&id=${c.id}"
                                       class="btn btn-outline-danger btn-sm rounded-end-3"
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa mã giảm giá này?')"
                                       data-bs-toggle="tooltip" title="Xóa mã">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <!-- Enhanced View Modal -->
                        <div class="modal fade" id="viewModal${c.id}" tabindex="-1">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content border-0 shadow-lg">
                                    <div class="modal-header bg-gradient-primary text-white border-0">
                                        <div class="d-flex align-items-center">
                                            <div class="me-3">
                                                <div class="bg-white bg-opacity-25 rounded-circle p-2">
                                                    <i class="bi bi-tag-fill"></i>
                                                </div>
                                            </div>
                                            <div>
                                                <h5 class="modal-title mb-0">Chi tiết mã giảm giá #${c.id}</h5>
                                                <small class="opacity-75">Thông tin chi tiết về mã khuyến mãi</small>
                                            </div>
                                        </div>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body p-4">
                                        <!-- Coupon Info Cards -->
                                        <div class="row g-3 mb-4">
                                            <div class="col-md-6">
                                                <div class="card border-0 bg-primary bg-opacity-10 h-100">
                                                    <div class="card-body text-center">
                                                        <div class="mb-2">
                                                            <i class="bi bi-tag text-primary me-1"></i>
                                                            <strong>Mã giảm giá</strong>
                                                        </div>
                                                        <div class="bg-primary text-white rounded-3 p-3 mb-2">
                                                            <h3 class="mb-0 fw-bold">${c.code}</h3>
                                                        </div>
                                                        <small class="text-muted">Mã khuyến mãi</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="card border-0 bg-warning bg-opacity-10 h-100">
                                                    <div class="card-body text-center">
                                                        <div class="mb-2">
                                                            <i class="bi bi-percent text-warning me-1"></i>
                                                            <strong>Mức giảm giá</strong>
                                                        </div>
                                                        <div class="text-warning display-4 mb-2">
                                                            <i class="bi bi-percent"></i>
                                                        </div>
                                                        <h3 class="text-warning mb-0">${c.discountPercent}%</h3>
                                                        <small class="text-muted">Phần trăm giảm</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Expiry and Status -->
                                        <div class="row g-3 mb-4">
                                            <div class="col-md-6">
                                                <div class="card border-0 bg-info bg-opacity-10 h-100">
                                                    <div class="card-body text-center">
                                                        <div class="mb-2">
                                                            <i class="bi bi-calendar-x text-info me-1"></i>
                                                            <strong>Ngày hết hạn</strong>
                                                        </div>
                                                        <div class="text-info fs-5 mb-2">
                                                            <i class="bi bi-calendar-check"></i>
                                                        </div>
                                                        <div class="text-dark fw-semibold">${c.expiryDate}</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="card border-0 ${c.expiryDate.before(currentDate) ? 'bg-danger' : 'bg-success'} bg-opacity-10 h-100">
                                                    <div class="card-body text-center">
                                                        <div class="mb-2">
                                                            <i class="bi bi-check-circle ${c.expiryDate.before(currentDate) ? 'text-danger' : 'text-success'} me-1"></i>
                                                            <strong>Trạng thái</strong>
                                                        </div>
                                                        <div class="${c.expiryDate.before(currentDate) ? 'text-danger' : 'text-success'} fs-4 mb-2">
                                                            <i class="bi bi-${c.expiryDate.before(currentDate) ? 'x' : 'check'}-circle-fill"></i>
                                                        </div>
                                                        <span class="badge ${c.expiryDate.before(currentDate) ? 'bg-danger' : 'bg-success'} fs-6">
                                                            ${c.expiryDate.before(currentDate) ? 'Đã hết hạn' : 'Đang hoạt động'}
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer border-0 bg-light">
                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                                            <i class="bi bi-x-circle me-1"></i>Đóng
                                        </button>
                                        <a href="coupons?action=edit&id=${c.id}" class="btn btn-warning">
                                            <i class="bi bi-pencil me-1"></i>Chỉnh sửa
                                        </a>
                                        <a href="coupons?action=delete&id=${c.id}"
                                           class="btn btn-danger"
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa mã giảm giá này?')">
                                            <i class="bi bi-trash me-1"></i>Xóa mã
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <c:if test="${empty couponList}">
            <div class="text-center py-5">
                <div class="empty-state-illustration mb-4">
                    <div class="position-relative d-inline-block">
                        <div class="bg-light rounded-circle p-4 shadow-sm">
                            <i class="bi bi-tag display-1 text-muted"></i>
                        </div>
                        <div class="position-absolute top-0 end-0">
                            <div class="bg-primary text-white rounded-circle p-2">
                                <i class="bi bi-plus"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <h4 class="text-muted mb-2">Chưa có mã giảm giá nào</h4>
                <p class="text-muted mb-4">Tạo mã giảm giá đầu tiên để bắt đầu chương trình khuyến mãi của bạn.</p>
                <div class="d-flex justify-content-center gap-2">
                    <a href="${pageContext.request.contextPath}/admin/coupons?action=add"
                       class="btn btn-primary">
                        <i class="bi bi-plus-circle me-1"></i>Tạo mã giảm giá
                    </a>
                    <button class="btn btn-outline-secondary btn-sm">
                        <i class="bi bi-arrow-clockwise me-1"></i>Làm mới
                    </button>
                </div>
            </div>
        </c:if>
    </div>
</div>

<jsp:include page="/views/admin/common/footer.jsp" />
