<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../common/admin_header.jsp" />

<div class="container">
    <h2>🔁 Gửi hoàn tiền đến VNPay</h2>
    <p><strong>Mã đơn hàng:</strong> ${txnRef}</p>
    <p><strong>Số tiền hoàn:</strong> ${amount} VND</p>

    <form method="post" action="${pageContext.request.contextPath}/admin/vnpay-refund">
        <input type="hidden" name="txnRef" value="${txnRef}" />
        <input type="hidden" name="amount" value="${amount}" />
        <button type="submit" class="btn btn-danger">✅ Gửi yêu cầu hoàn tiền</button>
    </form>
</div>

<jsp:include page="../../common/admin_footer.jsp" />
