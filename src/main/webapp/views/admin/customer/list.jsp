
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/views/admin/common/header.jsp"/>

<!-- Enhanced Header with Gradient Background -->
<div class="bg-gradient-primary rounded-3 p-4 mb-4 text-white shadow-lg">
    <div class="d-flex justify-content-between align-items-center">
        <div>
            <h2 class="mb-2"><i class="bi bi-people-fill text-warning me-2"></i>Danh sách khách hàng</h2>
            <p class="mb-0 opacity-75">Quản lý và theo dõi thông tin khách hàng</p>
        </div>
        <div class="d-flex gap-2">
            <button class="btn btn-light btn-sm shadow-sm" data-bs-toggle="modal" data-bs-target="#filterModal">
                <i class="bi bi-funnel me-1"></i> Lọc
            </button>
            <button class="btn btn-success btn-sm shadow-sm">
                <i class="bi bi-download me-1"></i> Xuất Excel
            </button>
            <button class="btn btn-warning btn-sm shadow-sm">
                <i class="bi bi-plus-circle me-1"></i> Thêm khách hàng
            </button>
        </div>
    </div>
</div>

<!-- Statistics Cards -->
<div class="row mb-4">
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-primary text-white">
            <div class="card-body text-center">
                <i class="bi bi-people display-6 mb-2"></i>
                <h4>${customers.size()}</h4>
                <p class="mb-0">Tổng khách hàng</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-success text-white">
            <div class="card-body text-center">
                <i class="bi bi-person-check display-6 mb-2"></i>
                <h4>89</h4>
                <p class="mb-0">Hoạt động</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-warning text-white">
            <div class="card-body text-center">
                <i class="bi bi-calendar-plus display-6 mb-2"></i>
                <h4>15</h4>
                <p class="mb-0">Mới hôm nay</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-info text-white">
            <div class="card-body text-center">
                <i class="bi bi-cart-check display-6 mb-2"></i>
                <h4>234</h4>
                <p class="mb-0">Có đơn hàng</p>
            </div>
        </div>
    </div>
</div>

<!-- Search and Filter Bar -->
<div class="card border-0 shadow-sm mb-4">
    <div class="card-body py-3">
        <div class="row align-items-center">
            <div class="col-md-6">
                <div class="position-relative">
                    <i class="bi bi-search position-absolute top-50 start-0 translate-middle-y ms-3 text-muted"></i>
                    <input type="text" class="form-control ps-5" placeholder="Tìm kiếm theo tên, email, số điện thoại..."
                           id="searchInput">
                </div>
            </div>
            <div class="col-md-3">
                <select class="form-select" id="statusFilter">
                    <option value="">Tất cả trạng thái</option>
                    <option value="active">Hoạt động</option>
                    <option value="inactive">Không hoạt động</option>
                </select>
            </div>
            <div class="col-md-3">
                <div class="d-flex gap-2">
                    <button class="btn btn-outline-primary flex-fill">
                        <i class="bi bi-arrow-clockwise me-1"></i>Làm mới
                    </button>
                    <button class="btn btn-primary">
                        <i class="bi bi-search me-1"></i>Tìm kiếm
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Main Customer List -->
<div class="card border-0 shadow-lg rounded-3">
    <div class="card-header bg-transparent border-0 py-3">
        <div class="d-flex justify-content-between align-items-center">
            <h5 class="mb-0"><i class="bi bi-table me-2 text-primary"></i>Danh sách chi tiết</h5>
            <small class="text-muted">${customers.size()} khách hàng</small>
        </div>
    </div>
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead class="bg-light">
                    <tr>
                        <th scope="col" class="border-0 ps-4">
                            <div class="d-flex align-items-center">
                                <input type="checkbox" class="form-check-input me-2" id="selectAll">
                                <i class="bi bi-hash me-1 text-muted"></i>ID
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-person me-1 text-muted"></i>Khách hàng
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-envelope me-1 text-muted"></i>Email
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-telephone me-1 text-muted"></i>Số điện thoại
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-geo-alt me-1 text-muted"></i>Địa chỉ
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-activity me-1 text-muted"></i>Trạng thái
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
                    <c:forEach var="customer" items="${customers}" varStatus="status">
                        <tr class="border-bottom customer-row">
                            <td class="ps-4 py-3">
                                <div class="d-flex align-items-center">
                                    <input type="checkbox" class="form-check-input me-2 row-checkbox"
                                           value="${customer.id}">
                                    <span class="badge bg-light text-dark fw-bold">#${customer.id}</span>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="d-flex align-items-center">
                                    <div class="avatar-circle bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3"
                                         style="width: 45px; height: 45px; font-size: 18px; font-weight: bold;">
                                        ${customer.name.substring(0,1).toUpperCase()}
                                    </div>
                                    <div>
                                        <div class="fw-semibold text-dark">${customer.name}</div>
                                        <small class="text-muted">
                                            <i class="bi bi-person-badge me-1"></i>Khách hàng
                                        </small>
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="d-flex align-items-center">
                                    <i class="bi bi-envelope-fill text-primary me-2"></i>
                                    <div>
                                        <div class="text-dark">${customer.email}</div>
                                        <small class="text-muted">Email liên hệ</small>
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="d-flex align-items-center">
                                    <i class="bi bi-telephone-fill text-success me-2"></i>
                                    <div>
                                        <div class="text-dark">
                                            <c:choose>
                                                <c:when test="${not empty customer.phone}">
                                                    ${customer.phone}
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted fst-italic">Chưa cập nhật</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <small class="text-muted">Số điện thoại</small>
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="address-preview bg-light rounded-3 p-2" style="max-width: 200px;">
                                    <div class="text-truncate small">
                                        <i class="bi bi-geo-alt-fill text-info me-1"></i>
                                        <c:choose>
                                            <c:when test="${not empty customer.address}">
                                                <span title="${customer.address}">${customer.address}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted fst-italic">Chưa cập nhật địa chỉ</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <span class="badge bg-success rounded-pill">
                                    <i class="bi bi-check-circle me-1"></i>Hoạt động
                                </span>
                            </td>
                            <td class="text-center py-3 pe-4">
                                <div class="btn-group shadow-sm" role="group">
                                    <button type="button" class="btn btn-outline-info btn-sm"
                                            data-bs-toggle="modal" data-bs-target="#viewModal${customer.id}"
                                            data-bs-toggle="tooltip" title="Xem chi tiết">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline-primary btn-sm"
                                            data-bs-toggle="tooltip" title="Chỉnh sửa">
                                        <i class="bi bi-pencil"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline-warning btn-sm"
                                            data-bs-toggle="tooltip" title="Đơn hàng">
                                        <i class="bi bi-bag"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline-danger btn-sm"
                                            onclick="return confirm('Bạn có chắc chắn muốn xóa khách hàng này?')"
                                            data-bs-toggle="tooltip" title="Xóa">
                                        <i class="bi bi-trash"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>

                        <!-- Enhanced Customer Detail Modal -->
                        <div class="modal fade" id="viewModal${customer.id}" tabindex="-1">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content border-0 shadow-lg">
                                    <div class="modal-header bg-gradient-primary text-white border-0">
                                        <div class="d-flex align-items-center">
                                            <div class="me-3">
                                                <div class="bg-white bg-opacity-25 rounded-circle p-2">
                                                    <i class="bi bi-person-circle"></i>
                                                </div>
                                            </div>
                                            <div>
                                                <h5 class="modal-title mb-0">Thông tin khách hàng #${customer.id}</h5>
                                                <small class="opacity-75">Chi tiết thông tin và hoạt động</small>
                                            </div>
                                        </div>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body p-4">
                                        <!-- Customer Profile Card -->
                                        <div class="card border-0 bg-light mb-4">
                                            <div class="card-body text-center">
                                                <div class="avatar-circle bg-primary text-white rounded-circle d-inline-flex align-items-center justify-content-center mb-3"
                                                     style="width: 80px; height: 80px; font-size: 32px; font-weight: bold;">
                                                    ${customer.name.substring(0,1).toUpperCase()}
                                                </div>
                                                <h4 class="mb-1">${customer.name}</h4>
                                                <p class="text-muted mb-2">${customer.email}</p>
                                                <span class="badge bg-success">Khách hàng đã xác thực</span>
                                            </div>
                                        </div>

                                        <!-- Contact Information -->
                                        <div class="row g-3 mb-4">
                                            <div class="col-md-6">
                                                <div class="card border-0 bg-info bg-opacity-10 h-100">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center mb-2">
                                                            <i class="bi bi-telephone-fill text-info me-2"></i>
                                                            <strong>Số điện thoại</strong>
                                                        </div>
                                                        <p class="mb-0">
                                                            <c:choose>
                                                                <c:when test="${not empty customer.phone}">
                                                                    ${customer.phone}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="text-muted fst-italic">Chưa cập nhật</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="card border-0 bg-warning bg-opacity-10 h-100">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center mb-2">
                                                            <i class="bi bi-geo-alt-fill text-warning me-2"></i>
                                                            <strong>Địa chỉ</strong>
                                                        </div>
                                                        <p class="mb-0">
                                                            <c:choose>
                                                                <c:when test="${not empty customer.address}">
                                                                    ${customer.address}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="text-muted fst-italic">Chưa cập nhật địa chỉ</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Activity Statistics -->
                                        <div class="row g-3">
                                            <div class="col-md-4">
                                                <div class="card border-0 bg-success bg-opacity-10 text-center">
                                                    <div class="card-body py-3">
                                                        <i class="bi bi-bag-check-fill text-success display-6"></i>
                                                        <h4 class="mt-2 mb-1">12</h4>
                                                        <small class="text-muted">Đơn hàng</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="card border-0 bg-primary bg-opacity-10 text-center">
                                                    <div class="card-body py-3">
                                                        <i class="bi bi-currency-dollar text-primary display-6"></i>
                                                        <h4 class="mt-2 mb-1">2.4M</h4>
                                                        <small class="text-muted">Tổng chi tiêu</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="card border-0 bg-info bg-opacity-10 text-center">
                                                    <div class="card-body py-3">
                                                        <i class="bi bi-star-fill text-info display-6"></i>
                                                        <h4 class="mt-2 mb-1">4.8</h4>
                                                        <small class="text-muted">Đánh giá TB</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer border-0 bg-light">
                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                                            <i class="bi bi-x-circle me-1"></i>Đóng
                                        </button>
                                        <button type="button" class="btn btn-primary">
                                            <i class="bi bi-pencil me-1"></i>Chỉnh sửa
                                        </button>
                                        <button type="button" class="btn btn-success">
                                            <i class="bi bi-bag me-1"></i>Xem đơn hàng
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <c:if test="${empty customers}">
            <div class="text-center py-5">
                <div class="empty-state-illustration mb-4">
                    <div class="position-relative d-inline-block">
                        <div class="bg-light rounded-circle p-4 shadow-sm">
                            <i class="bi bi-people display-1 text-muted"></i>
                        </div>
                        <div class="position-absolute top-0 end-0">
                            <div class="bg-primary text-white rounded-circle p-2">
                                <i class="bi bi-plus"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <h4 class="text-muted mb-2">Chưa có khách hàng nào</h4>
                <p class="text-muted mb-4">Khách hàng mới đăng ký sẽ hiển thị tại đây.</p>
                <div class="d-flex justify-content-center gap-2">
                    <button class="btn btn-primary">
                        <i class="bi bi-person-plus me-1"></i>Thêm khách hàng
                    </button>
                    <button class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-clockwise me-1"></i>Làm mới
                    </button>
                </div>
            </div>
        </c:if>
    </div>
</div>

<!-- Filter Modal -->
<div class="modal fade" id="filterModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i class="bi bi-funnel me-2"></i>Bộ lọc nâng cao
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Trạng thái</label>
                            <select class="form-select">
                                <option value="">Tất cả</option>
                                <option value="active">Hoạt động</option>
                                <option value="inactive">Không hoạt động</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Có số điện thoại</label>
                            <select class="form-select">
                                <option value="">Tất cả</option>
                                <option value="yes">Có</option>
                                <option value="no">Không</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Có địa chỉ</label>
                            <select class="form-select">
                                <option value="">Tất cả</option>
                                <option value="yes">Có</option>
                                <option value="no">Không</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Có đơn hàng</label>
                            <select class="form-select">
                                <option value="">Tất cả</option>
                                <option value="yes">Có</option>
                                <option value="no">Chưa có</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-outline-secondary">Đặt lại</button>
                <button type="button" class="btn btn-primary">Áp dụng</button>
            </div>
        </div>
    </div>
</div>

<!-- Bulk Actions Bar (Hidden by default) -->
<div class="fixed-bottom bg-primary text-white p-3 shadow-lg" id="bulkActionsBar" style="display: none;">
    <div class="container-fluid">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <i class="bi bi-check2-square me-2"></i>
                <span id="selectedCount">0</span> khách hàng được chọn
            </div>
            <div class="d-flex gap-2">
                <button class="btn btn-light btn-sm">
                    <i class="bi bi-envelope me-1"></i>Gửi email
                </button>
                <button class="btn btn-warning btn-sm">
                    <i class="bi bi-download me-1"></i>Xuất file
                </button>
                <button class="btn btn-danger btn-sm">
                    <i class="bi bi-trash me-1"></i>Xóa
                </button>
                <button class="btn btn-outline-light btn-sm" id="clearSelection">
                    <i class="bi bi-x me-1"></i>Bỏ chọn
                </button>
            </div>
        </div>
    </div>
</div>

<script>
// Search functionality
document.getElementById('searchInput').addEventListener('input', function() {
    const searchTerm = this.value.toLowerCase();
    const rows = document.querySelectorAll('.customer-row');

    rows.forEach(row => {
        const text = row.textContent.toLowerCase();
        row.style.display = text.includes(searchTerm) ? '' : 'none';
    });
});

// Bulk selection functionality
document.getElementById('selectAll').addEventListener('change', function() {
    const checkboxes = document.querySelectorAll('.row-checkbox');
    checkboxes.forEach(cb => cb.checked = this.checked);
    updateBulkActionsBar();
});

document.querySelectorAll('.row-checkbox').forEach(cb => {
    cb.addEventListener('change', updateBulkActionsBar);
});

function updateBulkActionsBar() {
    const checkedBoxes = document.querySelectorAll('.row-checkbox:checked');
    const bulkBar = document.getElementById('bulkActionsBar');
    const selectedCount = document.getElementById('selectedCount');

    if (checkedBoxes.length > 0) {
        selectedCount.textContent = checkedBoxes.length;
        bulkBar.style.display = 'block';
    } else {
        bulkBar.style.display = 'none';
    }
}

document.getElementById('clearSelection').addEventListener('click', function() {
    document.querySelectorAll('.row-checkbox').forEach(cb => cb.checked = false);
    document.getElementById('selectAll').checked = false;
    updateBulkActionsBar();
});

// Initialize tooltips
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
});
</script>

<jsp:include page="/views/admin/common/footer.jsp"/>
