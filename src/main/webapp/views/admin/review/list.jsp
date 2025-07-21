
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý đánh giá - Fashion Shop Admin</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px 0;
            margin-bottom: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .header h1 {
            text-align: center;
            font-size: 2.2rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .stats-bar {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .stats-item {
            text-align: center;
            padding: 0 20px;
        }

        .stats-number {
            font-size: 2rem;
            font-weight: bold;
            color: #667eea;
        }

        .stats-label {
            color: #666;
            font-size: 0.9rem;
            margin-top: 5px;
        }

        .table-container {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .table-header {
            background: #343a40;
            color: white;
            padding: 20px;
            font-weight: 600;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #495057;
            color: white;
            padding: 15px 12px;
            text-align: left;
            font-weight: 600;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        td {
            padding: 15px 12px;
            border-bottom: 1px solid #e9ecef;
            vertical-align: top;
        }

        tr:hover {
            background-color: #f8f9fa;
            transition: background-color 0.2s ease;
        }

        .customer-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .customer-avatar {
            width: 35px;
            height: 35px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 0.9rem;
        }

        .rating-stars {
            display: flex;
            gap: 2px;
            align-items: center;
        }

        .star {
            color: #ffc107;
            font-size: 1.1rem;
        }

        .star.empty {
            color: #dee2e6;
        }

        .rating-number {
            margin-left: 8px;
            color: #666;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .comment-text {
            max-width: 300px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            color: #495057;
            font-style: italic;
        }

        .comment-text:hover {
            white-space: normal;
            word-wrap: break-word;
        }

        .date-time {
            color: #6c757d;
            font-size: 0.85rem;
        }

        .action-btn {
            background: #dc3545;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 0.85rem;
            font-weight: 500;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            transition: all 0.2s ease;
        }

        .action-btn:hover {
            background: #c82333;
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(220, 53, 69, 0.3);
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #6c757d;
        }

        .empty-icon {
            font-size: 4rem;
            margin-bottom: 20px;
            opacity: 0.5;
        }

        .empty-message {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .empty-submessage {
            font-size: 0.9rem;
            opacity: 0.7;
        }

        .product-name {
            font-weight: 600;
            color: #495057;
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .id-badge {
            background: #e9ecef;
            color: #495057;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            
            .header h1 {
                font-size: 1.8rem;
            }
            
            .stats-bar {
                flex-direction: column;
                gap: 15px;
            }
            
            table {
                font-size: 0.85rem;
            }
            
            th, td {
                padding: 10px 8px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="/views/admin/common/header.jsp" />

    <div class="container">
        <div class="header">
            <h1>⭐ Quản lý đánh giá khách hàng</h1>
        </div>

        <div class="stats-bar">
            <div class="stats-item">
                <div class="stats-number">${reviewList.size()}</div>
                <div class="stats-label">Tổng đánh giá</div>
            </div>
            <div class="stats-item">
                <div class="stats-number">
                    <c:set var="totalRating" value="0" />
                    <c:forEach var="r" items="${reviewList}">
                        <c:set var="totalRating" value="${totalRating + r.rating}" />
                    </c:forEach>
                    <c:choose>
                        <c:when test="${reviewList.size() > 0}">
                            <fmt:formatNumber value="${totalRating / reviewList.size()}" maxFractionDigits="1" />
                        </c:when>
                        <c:otherwise>0</c:otherwise>
                    </c:choose>
                </div>
                <div class="stats-label">Điểm trung bình</div>
            </div>
            <div class="stats-item">
                <div class="stats-number">
                    <c:set var="fiveStarCount" value="0" />
                    <c:forEach var="r" items="${reviewList}">
                        <c:if test="${r.rating == 5}">
                            <c:set var="fiveStarCount" value="${fiveStarCount + 1}" />
                        </c:if>
                    </c:forEach>
                    ${fiveStarCount}
                </div>
                <div class="stats-label">Đánh giá 5 sao</div>
            </div>
        </div>

        <div class="table-container">
            <div class="table-header">
                📋 Danh sách tất cả đánh giá
            </div>

            <c:choose>
                <c:when test="${not empty reviewList}">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Sản phẩm</th>
                                <th>Khách hàng</th>
                                <th>Đánh giá</th>
                                <th>Bình luận</th>
                                <th>Thời gian</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="r" items="${reviewList}">
                                <tr>
                                    <td>
                                        <span class="id-badge">#${r.id}</span>
                                    </td>
                                    <td>
                                        <div class="product-name" title="${r.product.name}">
                                            ${r.product.name}
                                        </div>
                                    </td>
                                    <td>
                                        <div class="customer-info">
                                            <div class="customer-avatar">
                                                ${r.customer.name.substring(0,1).toUpperCase()}
                                            </div>
                                            <span>${r.customer.name}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="rating-stars">
                                            <c:forEach var="i" begin="1" end="5">
                                                <span class="star ${i <= r.rating ? '' : 'empty'}">★</span>
                                            </c:forEach>
                                            <span class="rating-number">(${r.rating}/5)</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="comment-text" title="${r.comment}">
                                            <c:choose>
                                                <c:when test="${not empty r.comment}">
                                                    ${r.comment}
                                                </c:when>
                                                <c:otherwise>
                                                    <em style="color: #999;">Không có bình luận</em>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="date-time">
                                            <fmt:formatDate value="${r.createdAt}" pattern="dd/MM/yyyy HH:mm" />
                                        </div>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/reviews?action=delete&id=${r.id}"
                                           class="action-btn"
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa đánh giá này không?')">
                                            🗑️ Xóa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <div class="empty-icon">📝</div>
                        <div class="empty-message">Chưa có đánh giá nào</div>
                        <div class="empty-submessage">Khách hàng chưa để lại đánh giá cho sản phẩm nào</div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <jsp:include page="/views/admin/common/footer.jsp" />
</body>
</html>
