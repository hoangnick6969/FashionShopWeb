<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../common/admin-header.jsp" />

<h2>🔍 Truy vấn giao dịch VNPay</h2>
<form action="${pageContext.request.contextPath}/vnpay-query" method="post">
    <label>Mã đơn hàng (TxnRef):</label>
    <input type="text" name="order_id" required /><br/>

    <label>Ngày giao dịch (yyyyMMddHHmmss):</label>
    <input type="text" name="trans_date" required /><br/>

    <button type="submit">Truy vấn</button>
</form>

<jsp:include page="../../common/admin-footer.jsp" />
