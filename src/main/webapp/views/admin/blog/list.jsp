
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/admin/common/header.jsp" />

<!-- Enhanced Header with Gradient Background -->
<div class="bg-gradient-primary rounded-3 p-4 mb-4 text-white shadow-lg">
    <div class="d-flex justify-content-between align-items-center">
        <div>
            <h2 class="mb-2"><i class="bi bi-journal-text text-warning me-2"></i>Quản lý bài viết</h2>
            <p class="mb-0 opacity-75">Quản lý và chỉnh sửa các bài viết blog trên website</p>
        </div>
        <div class="d-flex gap-2">
            <a href="blogs?action=add" class="btn btn-light btn-sm shadow-sm">
                <i class="bi bi-plus-circle me-1"></i> Thêm bài viết
            </a>
            <button class="btn btn-success btn-sm shadow-sm">
                <i class="bi bi-download me-1"></i> Xuất Excel
            </button>
        </div>
    </div>
</div>

<!-- Statistics Cards -->
<div class="row mb-4">
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-primary text-white">
            <div class="card-body text-center">
                <i class="bi bi-journal display-6 mb-2"></i>
                <h4>${blogs.size()}</h4>
                <p class="mb-0">Tổng bài viết</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-success text-white">
            <div class="card-body text-center">
                <i class="bi bi-calendar-check display-6 mb-2"></i>
                <h4>5</h4>
                <p class="mb-0">Hôm nay</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-warning text-white">
            <div class="card-body text-center">
                <i class="bi bi-eye display-6 mb-2"></i>
                <h4>1.2K</h4>
                <p class="mb-0">Lượt xem</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-info text-white">
            <div class="card-body text-center">
                <i class="bi bi-heart display-6 mb-2"></i>
                <h4>892</h4>
                <p class="mb-0">Yêu thích</p>
            </div>
        </div>
    </div>
</div>

<div class="card border-0 shadow-lg rounded-3">
    <div class="card-header bg-transparent border-0 py-3">
        <div class="d-flex justify-content-between align-items-center">
            <h5 class="mb-0"><i class="bi bi-table me-2 text-primary"></i>Danh sách bài viết</h5>
            <small class="text-muted">${blogs.size()} bài viết</small>
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
                                <i class="bi bi-journal-text me-1 text-muted"></i>Tiêu đề
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-file-text me-1 text-muted"></i>Nội dung
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-image me-1 text-muted"></i>Hình ảnh
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-clock me-1 text-muted"></i>Ngày tạo
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
                    <c:forEach var="b" items="${blogs}" varStatus="status">
                        <tr class="border-bottom">
                            <td class="ps-4 py-3">
                                <span class="badge bg-light text-dark fw-bold">#${b.id}</span>
                            </td>
                            <td class="py-3">
                                <div class="d-flex align-items-center">
                                    <div class="position-relative me-3">
                                        <div class="bg-primary bg-opacity-10 rounded-3 p-2">
                                            <i class="bi bi-journal-text text-primary fs-4"></i>
                                        </div>
                                        <div class="position-absolute top-0 start-100 translate-middle">
                                            <span class="badge bg-success rounded-pill">
                                                <i class="bi bi-check2"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div style="max-width: 300px;">
                                        <div class="fw-semibold text-dark text-truncate" title="${b.title}">${b.title}</div>
                                        <small class="text-muted">Bài viết blog</small>
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="content-preview bg-light rounded-3 p-2" style="max-width: 250px;">
                                    <div class="text-truncate small" title="${b.content}">
                                        <i class="bi bi-file-text text-muted me-1"></i>${b.content}
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <c:choose>
                                    <c:when test="${b.thumbnail != null and not empty b.thumbnail}">
                                        <div class="position-relative">
                                            <img src="${pageContext.request.contextPath}/images/blogs/${b.thumbnail}"
                                                 alt="${b.title}" class="rounded-3 shadow-sm" width="60" height="60"
                                                 style="object-fit: cover;">
                                            <div class="position-absolute top-0 end-0 translate-middle">
                                                <span class="badge bg-success rounded-pill">
                                                    <i class="bi bi-image"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="bg-light rounded-3 p-3 text-center" style="width: 60px; height: 60px;">
                                            <i class="bi bi-image text-muted fs-4"></i>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="py-3">
                                <div class="d-flex flex-column">
                                    <small class="fw-semibold text-dark">${b.createdAt}</small>
                                    <small class="text-muted">
                                        <i class="bi bi-calendar me-1"></i>Ngày đăng
                                    </small>
                                </div>
                            </td>
                            <td class="text-center py-3 pe-4">
                                <div class="btn-group shadow-sm" role="group">
                                    <button type="button" class="btn btn-outline-info btn-sm rounded-start-3"
                                            data-bs-toggle="modal" data-bs-target="#viewModal${b.id}"
                                            data-bs-toggle="tooltip" title="Xem chi tiết">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                    <a href="blogs?action=edit&id=${b.id}"
                                       class="btn btn-outline-warning btn-sm"
                                       data-bs-toggle="tooltip" title="Chỉnh sửa">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a href="blogs?action=delete&id=${b.id}"
                                       class="btn btn-outline-danger btn-sm rounded-end-3"
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa bài viết này?')"
                                       data-bs-toggle="tooltip" title="Xóa bài viết">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <!-- Enhanced View Modal -->
                        <div class="modal fade" id="viewModal${b.id}" tabindex="-1">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content border-0 shadow-lg">
                                    <div class="modal-header bg-gradient-primary text-white border-0">
                                        <div class="d-flex align-items-center">
                                            <div class="me-3">
                                                <div class="bg-white bg-opacity-25 rounded-circle p-2">
                                                    <i class="bi bi-journal-text"></i>
                                                </div>
                                            </div>
                                            <div>
                                                <h5 class="modal-title mb-0">Chi tiết bài viết #${b.id}</h5>
                                                <small class="opacity-75">Thông tin chi tiết về bài viết</small>
                                            </div>
                                        </div>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body p-4">
                                        <!-- Title Card -->
                                        <div class="card border-0 bg-primary bg-opacity-5 mb-4">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center mb-3">
                                                    <i class="bi bi-journal-text text-primary me-2"></i>
                                                    <strong>Tiêu đề bài viết</strong>
                                                </div>
                                                <h4 class="text-dark mb-0">${b.title}</h4>
                                            </div>
                                        </div>

                                        <!-- Thumbnail and Date Cards -->
                                        <div class="row g-3 mb-4">
                                            <div class="col-md-6">
                                                <div class="card border-0 bg-light h-100">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center mb-2">
                                                            <i class="bi bi-image text-warning me-2"></i>
                                                            <strong>Hình ảnh đại diện</strong>
                                                        </div>
                                                        <div class="text-center">
                                                            <c:choose>
                                                                <c:when test="${b.thumbnail != null and not empty b.thumbnail}">
                                                                    <img src="${pageContext.request.contextPath}/images/blogs/${b.thumbnail}"
                                                                         alt="${b.title}" class="rounded-3 shadow-sm img-fluid"
                                                                         style="max-height: 100px; object-fit: cover;">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="bg-secondary bg-opacity-10 rounded-3 p-3">
                                                                        <i class="bi bi-image text-muted display-6"></i>
                                                                        <p class="text-muted mb-0 mt-2">Không có hình ảnh</p>
                                                                    </div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="card border-0 bg-info bg-opacity-10 h-100">
                                                    <div class="card-body text-center">
                                                        <div class="mb-2">
                                                            <i class="bi bi-calendar text-info me-1"></i>
                                                            <strong>Ngày tạo</strong>
                                                        </div>
                                                        <div class="text-info fs-5 mb-2">
                                                            <i class="bi bi-calendar-check"></i>
                                                        </div>
                                                        <div class="text-muted">${b.createdAt}</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Content Section -->
                                        <div class="card border-0 bg-success bg-opacity-5">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center mb-3">
                                                    <i class="bi bi-file-text text-success me-2"></i>
                                                    <strong>Nội dung bài viết</strong>
                                                </div>
                                                <div class="bg-white rounded-3 p-3 shadow-sm" style="max-height: 300px; overflow-y: auto;">
                                                    <div class="text-muted">${b.content}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer border-0 bg-light">
                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                                            <i class="bi bi-x-circle me-1"></i>Đóng
                                        </button>
                                        <a href="blogs?action=edit&id=${b.id}" class="btn btn-warning">
                                            <i class="bi bi-pencil me-1"></i>Chỉnh sửa
                                        </a>
                                        <a href="blogs?action=delete&id=${b.id}"
                                           class="btn btn-danger"
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa bài viết này?')">
                                            <i class="bi bi-trash me-1"></i>Xóa bài viết
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <c:if test="${empty blogs}">
            <div class="text-center py-5">
                <div class="empty-state-illustration mb-4">
                    <div class="position-relative d-inline-block">
                        <div class="bg-light rounded-circle p-4 shadow-sm">
                            <i class="bi bi-journal-text display-1 text-muted"></i>
                        </div>
                        <div class="position-absolute top-0 end-0">
                            <div class="bg-primary text-white rounded-circle p-2">
                                <i class="bi bi-plus"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <h4 class="text-muted mb-2">Chưa có bài viết nào</h4>
                <p class="text-muted mb-4">Bạn chưa tạo bài viết nào. Hãy tạo bài viết đầu tiên để chia sẻ thông tin với khách hàng.</p>
                <div class="d-flex justify-content-center gap-2">
                    <a href="blogs?action=add" class="btn btn-primary btn-sm">
                        <i class="bi bi-plus-circle me-1"></i>Tạo bài viết mới
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
