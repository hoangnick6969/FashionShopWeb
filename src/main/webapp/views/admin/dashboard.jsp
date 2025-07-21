
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Fashion Shop Admin</title>
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

        .dashboard-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px 0;
            margin-bottom: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(102, 126, 234, 0.2);
            text-align: center;
        }

        .dashboard-header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
        }

        .dashboard-header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }

        .stats-card {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.15);
        }

        .stats-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .stats-card.products::before {
            background: linear-gradient(135deg, #4facfe, #00f2fe);
        }

        .stats-card.orders::before {
            background: linear-gradient(135deg, #43e97b, #38f9d7);
        }

        .stats-card.customers::before {
            background: linear-gradient(135deg, #fa709a, #fee140);
        }

        .stats-icon {
            width: 60px;
            height: 60px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            margin-bottom: 20px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        .stats-card.products .stats-icon {
            background: linear-gradient(135deg, #4facfe, #00f2fe);
        }

        .stats-card.orders .stats-icon {
            background: linear-gradient(135deg, #43e97b, #38f9d7);
        }

        .stats-card.customers .stats-icon {
            background: linear-gradient(135deg, #fa709a, #fee140);
        }

        .stats-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 8px;
        }

        .stats-label {
            font-size: 1rem;
            color: #7f8c8d;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .content-section {
            background: white;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }

        .section-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #f1f2f6;
        }

        .section-title {
            font-size: 1.8rem;
            font-weight: 600;
            color: #2c3e50;
        }

        .chart-container {
            position: relative;
            height: 350px;
            margin: 20px 0;
        }

        .chart-canvas {
            width: 100% !important;
            height: 100% !important;
        }

        .refund-management {
            text-align: center;
            padding: 40px 20px;
        }

        .refund-btn {
            background: linear-gradient(135deg, #ffeaa7, #fab1a0);
            color: #2d3436;
            padding: 15px 30px;
            border: none;
            border-radius: 25px;
            font-size: 1.1rem;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(255, 234, 167, 0.4);
        }

        .refund-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 234, 167, 0.6);
            color: #2d3436;
            text-decoration: none;
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #7f8c8d;
        }

        .empty-icon {
            font-size: 4rem;
            margin-bottom: 20px;
            opacity: 0.6;
        }

        .empty-message {
            font-size: 1.2rem;
            font-weight: 500;
            margin-bottom: 10px;
        }

        .empty-submessage {
            font-size: 0.95rem;
            opacity: 0.8;
        }

        .divider {
            height: 2px;
            background: linear-gradient(90deg, transparent, #e9ecef, transparent);
            margin: 40px 0;
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            .dashboard-header {
                padding: 30px 20px;
            }

            .dashboard-header h1 {
                font-size: 2rem;
                flex-direction: column;
                gap: 10px;
            }

            .stats-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .stats-card {
                padding: 25px;
            }

            .content-section {
                padding: 25px 20px;
            }

            .chart-container {
                height: 280px;
            }
        }

        @media (max-width: 480px) {
            .dashboard-header h1 {
                font-size: 1.8rem;
            }

            .stats-number {
                font-size: 2rem;
            }

            .section-title {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="/views/admin/common/header.jsp" />

    <div class="container">
        <div class="dashboard-header">
            <h1>📊 Dashboard Quản Trị</h1>
            <p>Tổng quan và thống kê hệ thống Fashion Shop</p>
        </div>

        <div class="stats-grid">
            <div class="stats-card products">
                <div class="stats-icon">📦</div>
                <div class="stats-number">${productCount}</div>
                <div class="stats-label">Sản phẩm</div>
            </div>
            
            <div class="stats-card orders">
                <div class="stats-icon">🧾</div>
                <div class="stats-number">${orderCount}</div>
                <div class="stats-label">Đơn hàng</div>
            </div>
            
            <div class="stats-card customers">
                <div class="stats-icon">👥</div>
                <div class="stats-number">${customerCount}</div>
                <div class="stats-label">Khách hàng</div>
            </div>
        </div>

        <div class="divider"></div>

        <div class="content-section">
            <div class="section-header">
                <span>📈</span>
                <h3 class="section-title">Báo cáo doanh thu 6 tháng gần nhất</h3>
            </div>

            <c:choose>
                <c:when test="${not empty revenueMap}">
                    <div class="chart-container">
                        <canvas id="revenueChart" class="chart-canvas"></canvas>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                    <script>
                        const ctx = document.getElementById('revenueChart').getContext('2d');
                        const gradient = ctx.createLinearGradient(0, 0, 0, 400);
                        gradient.addColorStop(0, 'rgba(102, 126, 234, 0.8)');
                        gradient.addColorStop(1, 'rgba(118, 75, 162, 0.2)');

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
                                    backgroundColor: gradient,
                                    borderColor: 'rgba(102, 126, 234, 1)',
                                    borderWidth: 2,
                                    borderRadius: 8,
                                    borderSkipped: false,
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                plugins: {
                                    legend: {
                                        display: true,
                                        labels: {
                                            color: '#495057',
                                            font: {
                                                size: 14,
                                                weight: '500'
                                            }
                                        }
                                    }
                                },
                                scales: {
                                    y: {
                                        beginAtZero: true,
                                        grid: {
                                            color: 'rgba(0,0,0,0.05)'
                                        },
                                        ticks: {
                                            color: '#666',
                                            font: {
                                                size: 12
                                            },
                                            callback: function(value) {
                                                return new Intl.NumberFormat('vi-VN', {
                                                    style: 'currency',
                                                    currency: 'VND'
                                                }).format(value);
                                            }
                                        }
                                    },
                                    x: {
                                        grid: {
                                            display: false
                                        },
                                        ticks: {
                                            color: '#666',
                                            font: {
                                                size: 12,
                                                weight: '500'
                                            }
                                        }
                                    }
                                },
                                interaction: {
                                    intersect: false,
                                    mode: 'index'
                                }
                            }
                        });
                    </script>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <div class="empty-icon">📊</div>
                        <div class="empty-message">Không có dữ liệu doanh thu</div>
                        <div class="empty-submessage">Chưa có giao dịch nào được thực hiện trong 6 tháng qua</div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="content-section">
            <div class="section-header">
                <span>💳</span>
                <h3 class="section-title">Quản lý hoàn tiền VNPay</h3>
            </div>
            
            <div class="refund-management">
                <a href="${pageContext.request.contextPath}/admin/pending-refunds" class="refund-btn">
                    🔁 Xử lý yêu cầu hoàn tiền
                </a>
            </div>
        </div>
    </div>

    <jsp:include page="/views/admin/common/footer.jsp" />
</body>
</html>
