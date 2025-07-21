<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/views/admin/common/header.jsp" />
    <title>Danh sách yêu cầu hoàn tiền</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 30px;
            background-color: #f5f5f5;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #343a40;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .message {
            color: green;
            font-weight: bold;
            padding: 20px;
            background-color: #e9ffe9;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            margin-top: 20px;
            text-align: center;
        }

        .btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 14px;
            cursor: pointer;
            border-radius: 4px;
            font-weight: bold;
        }

        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<h2>📄 Danh sách yêu cầu hoàn tiền</h2>

<c:choose>
    <c:when test="${not empty orders}">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã giao dịch</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>
                    <th>Duyệt</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>#${order.id}</td>
                        <td>${order.transactionNo}</td>
                        <td><fmt:formatNumber value="${order.total}" type="currency" currencySymbol="₫" /></td>
                        <td style="color: orange;">${order.status}</td>
                        <td>
                            <form method="post" action="${pageContext.request.contextPath}/admin/approve-refund">
                                <input type="hidden" name="orderId" value="${order.id}" />
                                <button type="submit" class="btn">✅ Duyệt hoàn</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <div class="message">✅ Hiện không có đơn hàng cần hoàn tiền.</div>
    </c:otherwise>
</c:choose>

<jsp:include page="/views/admin/common/footer.jsp" />
</body>
</html>
