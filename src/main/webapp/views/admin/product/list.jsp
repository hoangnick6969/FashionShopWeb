
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/views/admin/common/header.jsp" />

<!-- Enhanced Header with Gradient Background -->
<div class="bg-gradient-primary rounded-3 p-4 mb-4 text-white shadow-lg">
    <div class="d-flex justify-content-between align-items-center">
        <div>
            <h2 class="mb-2"><i class="bi bi-box-seam-fill me-2"></i>Quản lý sản phẩm</h2>
            <p class="mb-0 opacity-75">Danh sách và quản lý tất cả sản phẩm trong cửa hàng</p>
        </div>
        <div class="d-flex gap-2">
            <a href="${pageContext.request.contextPath}/admin/products?action=add" 
               class="btn btn-light btn-lg shadow-sm">
                <i class="bi bi-plus-circle me-2"></i>Thêm sản phẩm
            </a>
            <button class="btn btn-success btn-sm shadow-sm">
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
                <i class="bi bi-box display-6 mb-2"></i>
                <h4>${products.size()}</h4>
                <p class="mb-0">Tổng sản phẩm</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-success text-white">
            <div class="card-body text-center">
                <i class="bi bi-eye-fill display-6 mb-2"></i>
                <h4>125</h4>
                <p class="mb-0">Đang hiển thị</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-warning text-white">
            <div class="card-body text-center">
                <i class="bi bi-exclamation-triangle-fill display-6 mb-2"></i>
                <h4>8</h4>
                <p class="mb-0">Sắp hết hàng</p>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card border-0 shadow-sm bg-info text-white">
            <div class="card-body text-center">
                <i class="bi bi-currency-dollar display-6 mb-2"></i>
                <h4>2.4M</h4>
                <p class="mb-0">Tổng giá trị</p>
            </div>
        </div>
    </div>
</div>

<!-- Search and Filter Section -->
<div class="card border-0 shadow-sm mb-4">
    <div class="card-body">
        <div class="row g-3">
            <div class="col-md-4">
                <div class="input-group">
                    <span class="input-group-text bg-light border-0">
                        <i class="bi bi-search text-muted"></i>
                    </span>
                    <input type="text" class="form-control border-0 bg-light" placeholder="Tìm kiếm sản phẩm...">
                </div>
            </div>
            <div class="col-md-3">
                <select class="form-select border-0 bg-light">
                    <option>Tất cả danh mục</option>
                    <option>Áo thun</option>
                    <option>Quần jeans</option>
                    <option>Giày dép</option>
                </select>
            </div>
            <div class="col-md-3">
                <select class="form-select border-0 bg-light">
                    <option>Tất cả trạng thái</option>
                    <option>Đang bán</option>
                    <option>Hết hàng</option>
                    <option>Ngừng bán</option>
                </select>
            </div>
            <div class="col-md-2">
                <button class="btn btn-primary w-100">
                    <i class="bi bi-funnel me-1"></i>Lọc
                </button>
            </div>
        </div>
    </div>
</div>

<div class="card border-0 shadow-lg rounded-3">
    <div class="card-header bg-transparent border-0 py-3">
        <div class="d-flex justify-content-between align-items-center">
            <h5 class="mb-0"><i class="bi bi-table me-2 text-primary"></i>Danh sách sản phẩm</h5>
            <div class="d-flex gap-2">
                <small class="text-muted">${products.size()} sản phẩm</small>
                <div class="btn-group btn-group-sm" role="group">
                    <button type="button" class="btn btn-outline-secondary active">
                        <i class="bi bi-list"></i>
                    </button>
                    <button type="button" class="btn btn-outline-secondary">
                        <i class="bi bi-grid-3x3-gap"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead class="bg-light">
                    <tr>
                        <th scope="col" class="border-0 ps-4">
                            <div class="d-flex align-items-center">
                                <input type="checkbox" class="form-check-input me-2">
                                <i class="bi bi-hash me-1 text-muted"></i>ID
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-image me-1 text-muted"></i>Sản phẩm
                                <i class="bi bi-arrow-up-down ms-1 text-muted" style="font-size: 0.8rem;"></i>
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-tag me-1 text-muted"></i>Danh mục
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-currency-dollar me-1 text-muted"></i>Giá
                                <i class="bi bi-arrow-up-down ms-1 text-muted" style="font-size: 0.8rem;"></i>
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-box-seam me-1 text-muted"></i>Tồn kho
                            </div>
                        </th>
                        <th scope="col" class="border-0">
                            <div class="d-flex align-items-center">
                                <i class="bi bi-circle me-1 text-muted"></i>Trạng thái
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
                    <c:forEach var="p" items="${products}" varStatus="status">
                        <tr class="border-bottom">
                            <td class="ps-4 py-3">
                                <div class="d-flex align-items-center">
                                    <input type="checkbox" class="form-check-input me-3">
                                    <span class="badge bg-light text-dark fw-bold">#${p.id}</span>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="d-flex align-items-center">
                                    <div class="position-relative me-3">
                                        <img src="${pageContext.request.contextPath}/images/products/${p.mainImage}" 
                                             alt="${p.name}" class="rounded-3 shadow-sm" width="60" height="60"
                                             style="object-fit: cover;">
                                        <div class="position-absolute top-0 start-100 translate-middle">
                                            <span class="badge bg-success rounded-pill">
                                                <i class="bi bi-check2"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="fw-semibold text-dark mb-1">${p.name}</div>
                                        <small class="text-muted text-truncate d-block" style="max-width: 250px;">${p.description}</small>
                                        <div class="mt-1">
                                            <span class="badge bg-primary bg-opacity-10 text-primary rounded-pill">
                                                <i class="bi bi-star-fill me-1"></i>4.5
                                            </span>
                                            <small class="text-muted ms-1">(24 đánh giá)</small>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="d-flex align-items-center">
                                    <div class="me-2">
                                        <div class="bg-info bg-opacity-10 text-info rounded-circle d-flex align-items-center justify-content-center"
                                             style="width: 30px; height: 30px;">
                                            <i class="bi bi-tag-fill" style="font-size: 0.8rem;"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="fw-semibold">${p.category.name}</div>
                                        <small class="text-muted">Danh mục</small>
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="d-flex flex-column">
                                    <span class="fw-bold text-success fs-5">${p.price} VND</span>
                                    <small class="text-muted">
                                        <i class="bi bi-arrow-up text-success me-1"></i>+5% từ tháng trước
                                    </small>
                                </div>
                            </td>
                            <td class="py-3">
                                <div class="d-flex align-items-center">
                                    <div class="me-2">
                                        <div class="progress" style="width: 60px; height: 8px;">
                                            <div class="progress-bar bg-success" style="width: 75%"></div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="fw-semibold">156</div>
                                        <small class="text-muted">Còn lại</small>
                                    </div>
                                </div>
                            </td>
                            <td class="py-3">
                                <span class="badge bg-success bg-opacity-10 text-success rounded-pill px-3 py-2">
                                    <i class="bi bi-check-circle-fill me-1"></i>Đang bán
                                </span>
                            </td>
                            <td class="text-center py-3 pe-4">
                                <div class="btn-group shadow-sm" role="group">
                                    <button type="button" class="btn btn-outline-info btn-sm" 
                                            data-bs-toggle="modal" data-bs-target="#viewModal${p.id}"
                                            data-bs-toggle="tooltip" title="Xem chi tiết">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                    <a href="${pageContext.request.contextPath}/admin/products?action=edit&id=${p.id}" 
                                       class="btn btn-outline-primary btn-sm"
                                       data-bs-toggle="tooltip" title="Chỉnh sửa">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <button type="button" class="btn btn-outline-secondary btn-sm"
                                            data-bs-toggle="tooltip" title="Sao chép">
                                        <i class="bi bi-files"></i>
                                    </button>
                                    <a href="${pageContext.request.contextPath}/admin/products?action=delete&id=${p.id}" 
                                       class="btn btn-outline-danger btn-sm"
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')"
                                       data-bs-toggle="tooltip" title="Xóa">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <!-- Enhanced View Modal -->
                        <div class="modal fade" id="viewModal${p.id}" tabindex="-1">
                            <div class="modal-dialog modal-xl">
                                <div class="modal-content border-0 shadow-lg">
                                    <div class="modal-header bg-gradient-primary text-white border-0">
                                        <div class="d-flex align-items-center">
                                            <div class="me-3">
                                                <div class="bg-white bg-opacity-25 rounded-circle p-2">
                                                    <i class="bi bi-box-seam-fill"></i>
                                                </div>
                                            </div>
                                            <div>
                                                <h5 class="modal-title mb-0">Chi tiết sản phẩm #${p.id}</h5>
                                                <small class="opacity-75">${p.name}</small>
                                            </div>
                                        </div>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body p-4">
                                        <div class="row g-4">
                                            <!-- Product Image -->
                                            <div class="col-md-5">
                                                <div class="card border-0 bg-light h-100">
                                                    <div class="card-body text-center p-4">
                                                        <img src="${pageContext.request.contextPath}/images/products/${p.mainImage}" 
                                                             alt="${p.name}" class="img-fluid rounded-3 shadow-sm mb-3"
                                                             style="max-height: 300px; object-fit: cover;">
                                                        <div class="d-flex justify-content-center gap-2">
                                                            <button class="btn btn-outline-primary btn-sm">
                                                                <i class="bi bi-eye me-1"></i>Xem lớn
                                                            </button>
                                                            <button class="btn btn-outline-secondary btn-sm">
                                                                <i class="bi bi-download me-1"></i>Tải về
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- Product Details -->
                                            <div class="col-md-7">
                                                <div class="row g-3">
                                                    <!-- Basic Info -->
                                                    <div class="col-12">
                                                        <div class="card border-0 bg-primary bg-opacity-5">
                                                            <div class="card-body">
                                                                <h6 class="text-primary mb-3">
                                                                    <i class="bi bi-info-circle me-2"></i>Thông tin cơ bản
                                                                </h6>
                                                                <div class="row g-3">
                                                                    <div class="col-md-6">
                                                                        <strong>Tên sản phẩm:</strong><br>
                                                                        <span class="text-muted">${p.name}</span>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <strong>Danh mục:</strong><br>
                                                                        <span class="badge bg-info">${p.category.name}</span>
                                                                    </div>
                                                                    <div class="col-12">
                                                                        <strong>Mô tả:</strong><br>
                                                                        <span class="text-muted">${p.description}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <!-- Price and Stock -->
                                                    <div class="col-md-6">
                                                        <div class="card border-0 bg-success bg-opacity-5">
                                                            <div class="card-body text-center">
                                                                <h6 class="text-success mb-2">
                                                                    <i class="bi bi-currency-dollar"></i> Giá bán
                                                                </h6>
                                                                <div class="display-6 text-success fw-bold">${p.price}</div>
                                                                <small class="text-muted">VND</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-6">
                                                        <div class="card border-0 bg-warning bg-opacity-5">
                                                            <div class="card-body text-center">
                                                                <h6 class="text-warning mb-2">
                                                                    <i class="bi bi-box-seam"></i> Tồn kho
                                                                </h6>
                                                                <div class="display-6 text-warning fw-bold">156</div>
                                                                <small class="text-muted">Sản phẩm</small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <!-- Statistics -->
                                                    <div class="col-12">
                                                        <div class="card border-0 bg-info bg-opacity-5">
                                                            <div class="card-body">
                                                                <h6 class="text-info mb-3">
                                                                    <i class="bi bi-graph-up me-2"></i>Thống kê bán hàng
                                                                </h6>
                                                                <div class="row text-center">
                                                                    <div class="col-4">
                                                                        <div class="text-info fw-bold fs-4">245</div>
                                                                        <small class="text-muted">Đã bán</small>
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <div class="text-info fw-bold fs-4">4.5</div>
                                                                        <small class="text-muted">Đánh giá</small>
                                                                    </div>
                                                                    <div class="col-4">
                                                                        <div class="text-info fw-bold fs-4">89%</div>
                                                                        <small class="text-muted">Hài lòng</small>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer border-0 bg-light">
                                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                                            <i class="bi bi-x-circle me-1"></i>Đóng
                                        </button>
                                        <a href="${pageContext.request.contextPath}/admin/products?action=edit&id=${p.id}" 
                                           class="btn btn-primary">
                                            <i class="bi bi-pencil me-1"></i>Chỉnh sửa
                                        </a>
                                        <a href="${pageContext.request.contextPath}/admin/products?action=delete&id=${p.id}" 
                                           class="btn btn-danger"
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">
                                            <i class="bi bi-trash me-1"></i>Xóa sản phẩm
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <c:if test="${empty products}">
            <div class="text-center py-5">
                <div class="empty-state-illustration mb-4">
                    <div class="position-relative d-inline-block">
                        <div class="bg-light rounded-circle p-4 shadow-sm">
                            <i class="bi bi-box display-1 text-muted"></i>
                        </div>
                        <div class="position-absolute top-0 end-0">
                            <div class="bg-primary text-white rounded-circle p-2">
                                <i class="bi bi-plus"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <h4 class="text-muted mb-2">Chưa có sản phẩm nào</h4>
                <p class="text-muted mb-4">Hãy thêm sản phẩm đầu tiên để bắt đầu bán hàng trên cửa hàng của bạn.</p>
                <a href="${pageContext.request.contextPath}/admin/products?action=add" 
                   class="btn btn-primary btn-lg shadow-sm">
                    <i class="bi bi-plus-circle me-2"></i>Thêm sản phẩm đầu tiên
                </a>
            </div>
        </c:if>
    </div>
    
    <!-- Pagination -->
    <div class="card-footer bg-light border-0">
        <div class="d-flex justify-content-between align-items-center">
            <small class="text-muted">Hiển thị 1-10 của ${products.size()} sản phẩm</small>
            <nav>
                <ul class="pagination pagination-sm mb-0">
                    <li class="page-item disabled">
                        <span class="page-link"><i class="bi bi-chevron-left"></i></span>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#"><i class="bi bi-chevron-right"></i></a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<!-- Bulk Actions Modal -->
<div class="modal fade" id="bulkActionsModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thao tác hàng loạt</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Chọn thao tác bạn muốn áp dụng cho các sản phẩm đã chọn:</p>
                <div class="d-grid gap-2">
                    <button class="btn btn-outline-success">
                        <i class="bi bi-eye me-2"></i>Hiển thị
                    </button>
                    <button class="btn btn-outline-secondary">
                        <i class="bi bi-eye-slash me-2"></i>Ẩn
                    </button>
                    <button class="btn btn-outline-primary">
                        <i class="bi bi-tag me-2"></i>Thay đổi danh mục
                    </button>
                    <button class="btn btn-outline-danger">
                        <i class="bi bi-trash me-2"></i>Xóa
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/views/admin/common/footer.jsp" />
