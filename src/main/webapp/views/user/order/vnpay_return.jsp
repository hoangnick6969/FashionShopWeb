<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../common/header.jsp" />

<h2>🎉 Kết quả thanh toán VNPay</h2>

<p>Mã giao dịch: ${param.vnp_TxnRef}</p>
<p>Số tiền: ${param.vnp_Amount} VND</p>
<p>Thời gian: ${param.vnp_PayDate}</p>
<p>Trạng thái:
    <c:choose>
        <c:when test="${param.vnp_ResponseCode == '00'}">✅ Thành công</c:when>
        <c:otherwise>❌ Thất bại (Mã lỗi: ${param.vnp_ResponseCode})</c:otherwise>
    </c:choose>
</p>

<a href="${pageContext.request.contextPath}/">⬅️ Quay về trang chủ</a>

<jsp:include page="../../common/footer.jsp" />
