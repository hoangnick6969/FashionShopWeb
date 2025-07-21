
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/admin/common/header.jsp" />

<!-- Enhanced Header with Gradient Background -->
<div class="bg-gradient-primary rounded-3 p-4 mb-4 text-white shadow-lg">
    <div class="row align-items-center">
        <div class="col-md-8">
            <div class="d-flex align-items-center">
                <div class="me-3">
                    <div class="bg-white bg-opacity-20 rounded-circle p-3">
                        <i class="bi bi-envelope-open display-6"></i>
                    </div>
                </div>
                <div>
                    <h2 class="mb-2">Quản lý tin nhắn liên hệ</h2>
                    <p class="mb-0 opacity-75">Theo dõi và phản hồi các tin nhắn từ khách hàng</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="d-flex justify-content-md-end gap-2">
                <button class="btn btn-light btn-sm shadow-sm" data-bs-toggle="modal" data-bs-target="#filterModal">
                    <i class="bi bi-funnel me-1"></i> Lọc tin nhắn
                </button>
                <button class="btn btn-success btn-sm shadow-sm">
                    <i class="bi bi-download me-1"></i> Xuất Excel
                </button>
                <div class="dropdown">
                    <button class="btn btn-warning btn-sm shadow-sm dropdown-toggle" data-bs-toggle="dropdown">
                        <i class="bi bi-gear me-1"></i> Thao tác
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#"><i class="bi bi-check-all me-2"></i>Đánh dấu tất cả đã đọc</a></li>
                        <li><a class="dropdown-item" href="#"><i class="bi bi-archive me-2"></i>Lưu trữ đã chọn</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="#"><i class="bi bi-trash me-2"></i>Xóa đã chọn</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Enhanced Statistics Cards -->
<div class="row mb-4">
    <div class="col-lg-3 col-md-6 mb-3">
        <div class="card border-0 shadow-sm bg-gradient-primary text-white h-100">
            <div class="card-body text-center">
                <div class="d-flex align-items-center justify-content-center mb-2">
                    <div class="bg-white bg-opacity-20 rounded-circle p-3 me-2">
                        <i class="bi bi-envelope-fill display-6"></i>
                    </div>
                    <div class="text-start">
                        <h3 class="mb-0">${messages.size()}</h3>
                        <small class="opacity-75">Tổng tin nhắn</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-md-6 mb-3">
        <div class="card border-0 shadow-sm bg-gradient-warning text-white h-100">
            <div class="card-body text-center">
                <div class="d-flex align-items-center justify-content-center mb-2">
                    <div class="bg-white bg-opacity-20 rounded-circle p-3 me-2">
                        <i class="bi bi-envelope-open-fill display-6"></i>
                    </div>
                    <div class="text-start">
                        <h3 class="mb-0">12</h3>
                        <small class="opacity-75">Chưa đọc</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-md-6 mb-3">
        <div class="card border-0 shadow-sm bg-gradient-success text-white h-100">
            <div class="card-body text-center">
                <div class="d-flex align-items-center justify-content-center mb-2">
                    <div class="bg-white bg-opacity-20 rounded-circle p-3 me-2">
                        <i class="bi bi-reply-fill display-6"></i>
                    </div>
                    <div class="text-start">
                        <h3 class="mb-0">8</h3>
                        <small class="opacity-75">Đã phản hồi</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-md-6 mb-3">
        <div class="card border-0 shadow-sm bg-gradient-danger text-white h-100">
            <div class="card-body text-center">
                <div class="d-flex align-items-center justify-content-center mb-2">
                    <div class="bg-white bg-opacity-20 rounded-circle p-3 me-2">
                        <i class="bi bi-exclamation-triangle-fill display-6"></i>
                    </div>
                    <div class="text-start">
                        <h3 class="mb-0">3</h3>
                        <small class="opacity-75">Khẩn cấp</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Enhanced Messages List -->
<div class="card border-0 shadow-lg rounded-3">
    <div class="card-header bg-transparent border-0 py-3">
        <div class="d-flex justify-content-between align-items-center">
            <div class="d-flex align-items-center">
                <h5 class="mb-0 me-3">
                    <i class="bi bi-list-ul me-2 text-primary"></i>Danh sách tin nhắn
                </h5>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="selectAll">
                    <label class="form-check-label text-muted" for="selectAll">
                        Chọn tất cả
                    </label>
                </div>
            </div>
            <div class="d-flex align-items-center gap-2">
                <small class="text-muted">${messages.size()} tin nhắn</small>
                <div class="btn-group btn-group-sm" role="group">
                    <input type="radio" class="btn-check" name="viewOptions" id="listView" autocomplete="off" checked>
                    <label class="btn btn-outline-secondary" for="listView">
                        <i class="bi bi-list"></i>
                    </label>
                    <input type="radio" class="btn-check" name="viewOptions" id="cardView" autocomplete="off">
                    <label class="btn btn-outline-secondary" for="cardView">
                        <i class="bi bi-grid-3x3-gap"></i>
                    </label>
                </div>
            </div>
        </div>
    </div>

    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead class="bg-light">
                    <tr>
                        <th scope="col" class="border-0 ps-4" width="50">
                            <input type="checkbox" class="form-check-input">
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-person me-1 text-muted"></i>Người gửi
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-envelope me-1 text-muted"></i>Email
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-chat-text me-1 text-muted"></i>Chủ đề
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-clock me-1 text-muted"></i>Thời gian
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-flag me-1 text-muted"></i>Trạng thái
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
                    <c:forEach var="msg" items="${messages}" varStatus="status">
                        <tr class="border-bottom contact-message-row" data-message-id="${msg.id}">
                            <td class="ps-4 py-3">
                                <input type="checkbox" class="form-check-input message-checkbox" value="${msg.id}">
                            </td>
                            <td class="py-3">
                                <div class="d-flex align-items-center">
                                    <div class="avatar-circle bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3"
                                         style="width: 40px; height: 40px; font-size: 16px; font-weight: bold;">
                                        ${msg.name.substring(0,1).toUpperCase()}
                                    </div>
                                    <div>
                                        <div class="fw-semibold text-dark">${msg.name}</div>
                                        <small class="text-muted">Khách hàng</small>
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="d-flex flex-column">
                                    <div class="fw-medium text-primary">${msg.email}</div>
                                    <small class="text-muted">
                                        <i class="bi bi-geo-alt me-1"></i>Liên hệ chính
                                    </small>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="message-preview" style="max-width: 300px;">
                                    <div class="fw-semibold text-dark mb-1">${msg.subject}</div>
                                    <div class="text-muted text-truncate small" title="${msg.message}">
                                        <i class="bi bi-quote text-muted me-1"></i>${msg.message}
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="d-flex flex-column">
                                    <small class="fw-semibold text-dark">${msg.createdAt}</small>
                                    <small class="text-muted">
                                        <i class="bi bi-clock me-1"></i>2 giờ trước
                                    </small>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="d-flex flex-column align-items-start">
                                    <span class="badge bg-warning rounded-pill mb-1">
                                        <i class="bi bi-envelope me-1"></i>Chưa đọc
                                    </span>
                                    <div class="d-flex align-items-center">
                                        <div class="priority-indicator bg-danger rounded-circle me-1"
                                             style="width: 8px; height: 8px;" title="Mức độ ưu tiên cao"></div>
                                        <small class="text-danger">Khẩn cấp</small>
                                    </div>
                                </div>
                            </td>
                            <td class="text-center py-3 pe-4">
                                <div class="btn-group shadow-sm" role="group">
                                    <button type="button" class="btn btn-outline-info btn-sm"
                                            data-bs-toggle="modal" data-bs-target="#messageModal${msg.id}"
                                            data-bs-toggle="tooltip" title="Xem chi tiết">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline-success btn-sm"
                                            data-bs-toggle="tooltip" title="Phản hồi">
                                        <i class="bi bi-reply"></i>
                                    </button>
                                    <div class="btn-group" role="group">
                                        <button class="btn btn-outline-secondary btn-sm dropdown-toggle"
                                                data-bs-toggle="dropdown" data-bs-toggle="tooltip" title="Thêm">
                                            <i class="bi bi-three-dots"></i>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><i class="bi bi-check me-2"></i>Đánh dấu đã đọc</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="bi bi-star me-2"></i>Gắn dấu sao</a></li>
                                            <li><a class="dropdown-item" href="#"><i class="bi bi-archive me-2"></i>Lưu trữ</a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item text-danger" href="#"><i class="bi bi-trash me-2"></i>Xóa</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <!-- Enhanced Message Detail Modal -->
                        <div class="modal fade" id="messageModal${msg.id}" tabindex="-1">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content border-0 shadow-lg">
                                    <div class="modal-header bg-gradient-primary text-white border-0">
                                        <div class="d-flex align-items-center w-100">
                                            <div class="me-3">
                                                <div class="bg-white bg-opacity-25 rounded-circle p-2">
                                                    <i class="bi bi-envelope-open-fill"></i>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1">
                                                <h5 class="modal-title mb-0">Chi tiết tin nhắn #${msg.id}</h5>
                                                <small class="opacity-75">Từ: ${msg.name} (${msg.email})</small>
                                            </div>
                                            <div class="d-flex gap-2">
                                                <button class="btn btn-light btn-sm">
                                                    <i class="bi bi-reply"></i> Phản hồi
                                                </button>
                                                <button class="btn btn-warning btn-sm">
                                                    <i class="bi bi-star"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body p-4">
                                        <!-- Message Header Info -->
                                        <div class="row g-3 mb-4">
                                            <div class="col-md-6">
                                                <div class="card border-0 bg-light h-100">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center mb-2">
                                                            <i class="bi bi-person text-primary me-2"></i>
                                                            <strong>Thông tin người gửi</strong>
                                                        </div>
                                                        <div class="d-flex align-items-center">
                                                            <div class="avatar-circle bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3"
                                                                 style="width: 45px; height: 45px; font-size: 18px;">
                                                                ${msg.name.substring(0,1).toUpperCase()}
                                                            </div>
                                                            <div>
                                                                <div class="fw-semibold">${msg.name}</div>
                                                                <small class="text-muted">${msg.email}</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="card border-0 bg-light h-100">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center mb-2">
                                                            <i class="bi bi-clock text-info me-2"></i>
                                                            <strong>Thời gian & Trạng thái</strong>
                                                        </div>
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <div>
                                                                <div class="fw-semibold">${msg.createdAt}</div>
                                                                <small class="text-muted">Thời gian gửi</small>
                                                            </div>
                                                            <span class="badge bg-warning">Chưa đọc</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Subject -->
                                        <div class="card border-0 bg-primary bg-opacity-5 mb-4">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center mb-2">
                                                    <i class="bi bi-chat-text text-primary me-2"></i>
                                                    <strong>Chủ đề tin nhắn</strong>
                                                </div>
                                                <h6 class="text-primary fw-bold mb-0">${msg.subject}</h6>
                                            </div>
                                        </div>

                                        <!-- Message Content -->
                                        <div class="card border-0 bg-light">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center mb-3">
                                                    <i class="bi bi-envelope-open text-success me-2"></i>
                                                    <strong>Nội dung tin nhắn</strong>
                                                </div>
                                                <div class="message-content bg-white rounded-3 p-3 shadow-sm">
                                                    <i class="bi bi-quote text-muted me-2" style="font-size: 1.2rem;"></i>
                                                    <span>${msg.message}</span>
                                                    <i class="bi bi-quote text-muted ms-2" style="font-size: 1.2rem; transform: scaleX(-1); display: inline-block;"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer border-0 bg-light d-flex justify-content-between">
                                        <div class="d-flex gap-2">
                                            <button class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                                <i class="bi bi-x-circle me-1"></i>Đóng
                                            </button>
                                            <button class="btn btn-outline-warning">
                                                <i class="bi bi-archive me-1"></i>Lưu trữ
                                            </button>
                                        </div>
                                        <div class="d-flex gap-2">
                                            <button class="btn btn-success">
                                                <i class="bi bi-reply me-1"></i>Phản hồi ngay
                                            </button>
                                            <button class="btn btn-danger">
                                                <i class="bi bi-trash me-1"></i>Xóa
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Empty State -->
        <c:if test="${empty messages}">
            <div class="text-center py-5">
                <div class="empty-state-illustration mb-4">
                    <div class="position-relative d-inline-block">
                        <div class="bg-light rounded-circle p-4 shadow-sm">
                            <i class="bi bi-envelope display-1 text-muted"></i>
                        </div>
                        <div class="position-absolute top-0 end-0">
                            <div class="bg-primary text-white rounded-circle p-2">
                                <i class="bi bi-plus"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <h4 class="text-muted mb-2">Chưa có tin nhắn nào</h4>
                <p class="text-muted mb-4">Các tin nhắn liên hệ từ khách hàng sẽ hiển thị tại đây.</p>
                <div class="d-flex justify-content-center gap-2">
                    <button class="btn btn-outline-primary btn-sm">
                        <i class="bi bi-arrow-clockwise me-1"></i>Làm mới
                    </button>
                    <button class="btn btn-outline-secondary btn-sm">
                        <i class="bi bi-gear me-1"></i>Cài đặt thông báo
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
                    <i class="bi bi-funnel me-2"></i>Lọc tin nhắn
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row g-3">
                    <div class="col-12">
                        <label class="form-label">Trạng thái</label>
                        <select class="form-select">
                            <option value="">Tất cả</option>
                            <option value="unread">Chưa đọc</option>
                            <option value="read">Đã đọc</option>
                            <option value="replied">Đã phản hồi</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Từ ngày</label>
                        <input type="date" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Đến ngày</label>
                        <input type="date" class="form-control">
                    </div>
                    <div class="col-12">
                        <label class="form-label">Tìm kiếm</label>
                        <input type="text" class="form-control" placeholder="Tìm theo tên, email hoặc chủ đề...">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-outline-warning">Đặt lại</button>
                <button type="button" class="btn btn-primary">Áp dụng lọc</button>
            </div>
        </div>
    </div>
</div>

<style>
    .contact-message-row:hover {
        background: rgba(52, 152, 219, 0.02);
        border-left: 3px solid var(--admin-accent);
        transition: all 0.3s ease;
    }

    .message-preview:hover .text-truncate {
        white-space: normal;
        overflow: visible;
        text-overflow: initial;
    }

    .priority-indicator {
        animation: pulse-danger 2s infinite;
    }

    @keyframes pulse-danger {
        0% { box-shadow: 0 0 0 0 rgba(220, 53, 69, 0.4); }
        70% { box-shadow: 0 0 0 5px rgba(220, 53, 69, 0); }
        100% { box-shadow: 0 0 0 0 rgba(220, 53, 69, 0); }
    }

    .message-content {
        line-height: 1.6;
        white-space: pre-wrap;
    }

    .avatar-circle {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Initialize tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });

        // Select all functionality
        document.getElementById('selectAll').addEventListener('change', function() {
            const checkboxes = document.querySelectorAll('.message-checkbox');
            checkboxes.forEach(checkbox => {
                checkbox.checked = this.checked;
            });
        });

        // Individual checkbox management
        document.querySelectorAll('.message-checkbox').forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const allCheckboxes = document.querySelectorAll('.message-checkbox');
                const checkedCheckboxes = document.querySelectorAll('.message-checkbox:checked');
                const selectAllCheckbox = document.getElementById('selectAll');

                if (checkedCheckboxes.length === allCheckboxes.length) {
                    selectAllCheckbox.checked = true;
                    selectAllCheckbox.indeterminate = false;
                } else if (checkedCheckboxes.length > 0) {
                    selectAllCheckbox.checked = false;
                    selectAllCheckbox.indeterminate = true;
                } else {
                    selectAllCheckbox.checked = false;
                    selectAllCheckbox.indeterminate = false;
                }
            });
        });
    });
</script>

<jsp:include page="/views/admin/common/footer.jsp" />
