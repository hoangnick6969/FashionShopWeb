<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="../../common/admin-header.jsp" />

<h2>💸 Hoàn tiền giao dịch VNPay</h2>
<form action="${pageContext.request.contextPath}/admin/vnpay-refund" method="post">
    <label>Loại giao dịch:</label>
    <select name="trantype" required>
        <option value="02">Hoàn toàn</option>
        <option value="03">Hoàn một phần</option>
    </select><br/>

    <label>Mã đơn hàng (TxnRef):</label>
    <input type="text" name="order_id" required /><br/>

    <label>Số tiền hoàn (VND):</label>
    <input type="number" name="amount" required /><br/>

    <label>Ngày giao dịch (yyyyMMddHHmmss):</label>
    <input type="text" name="trans_date" required /><br/>

    <label>Người thực hiện:</label>
    <input type="text" name="user" required /><br/>

    <button type="submit">Thực hiện hoàn tiền</button>
</form>

<jsp:include page="../../common/admin-footer.jsp" />
