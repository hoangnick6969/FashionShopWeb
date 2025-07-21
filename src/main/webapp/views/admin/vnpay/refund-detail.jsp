<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/views/admin/common/header.jsp" />

<div class="container">
    <h2>📊 Trang quản trị - Thống kê tổng quan</h2>
    <ul>
        <li><strong>Tổng sản phẩm:</strong> ${productCount}</li>
        <li><strong>Tổng đơn hàng:</strong> ${orderCount}</li>
        <li><strong>Tổng người dùng:</strong> ${customerCount}</li>
    </ul>

    <hr/>
    <h3>📈 Biểu đồ doanh thu 6 tháng gần nhất</h3>
    <c:choose>
        <c:when test="${not empty revenueMap}">
            <canvas id="revenueChart" width="800" height="300"></canvas>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                const ctx = document.getElementById('revenueChart').getContext('2d');
                const revenueChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: [
                            <c:forEach var="entry" items="${revenueMap}" varStatus="loop">
                                '${entry.key}'<c:if test="${!loop.last}">,</c:if>
                            </c:forEach>
                        ],
                        datasets: [{
                            label: 'Doanh thu (VND)',
                            data: [
                                <c:forEach var="entry" items="${revenueMap}" varStatus="loop">
                                    ${entry.value}<c:if test="${!loop.last}">,</c:if>
                                </c:forEach>
                            ],
                            backgroundColor: 'rgba(54, 162, 235, 0.6)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    callback: function(value) {
                                        return value.toLocaleString('vi-VN') + ' ₫';
                                    }
                                }
                            }
                        }
                    }
                });
            </script>
        </c:when>
        <c:otherwise>
            <p><i>Không có dữ liệu doanh thu.</i></p>
        </c:otherwise>
    </c:choose>

    <hr/>
    <h3>📋 Quản lý hoàn tiền VNPay</h3>
    <ul>
        <li><a href="${pageContext.request.contextPath}/admin/pending-refunds" class="btn btn-warning">🔁 Danh sách yêu cầu hoàn tiền</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/manual-refund" class="btn btn-danger mt-2">↩️ Gửi hoàn tiền thủ công</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/manual-query" class="btn btn-secondary mt-2">🔍 Truy vấn giao dịch thủ công</a></li>
    </ul>
</div>

<jsp:include page="/views/admin/common/footer.jsp" />
