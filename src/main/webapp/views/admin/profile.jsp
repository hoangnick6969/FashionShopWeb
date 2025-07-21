
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin tài khoản - Fashion Shop Admin</title>
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
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .page-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px 0;
            margin-bottom: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(102, 126, 234, 0.2);
            text-align: center;
        }

        .page-header h1 {
            font-size: 2.2rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

        .profile-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            overflow: hidden;
            margin-bottom: 25px;
        }

        .card-header {
            background: #495057;
            color: white;
            padding: 20px 30px;
            font-weight: 600;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .card-content {
            padding: 30px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            display: block;
            font-weight: 600;
            color: #495057;
            margin-bottom: 8px;
            font-size: 0.95rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-input {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e9ecef;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }

        .form-input:focus {
            outline: none;
            border-color: #667eea;
            background: white;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .password-section {
            border-top: 2px solid #f1f2f6;
            padding-top: 25px;
            margin-top: 25px;
        }

        .section-title {
            font-size: 1.3rem;
            font-weight: 600;
            color: #495057;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .submit-btn {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 0 auto;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }

        .alert {
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .alert-success {
            background: linear-gradient(135deg, #d4edda, #c3e6cb);
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-error {
            background: linear-gradient(135deg, #f8d7da, #f1aeb5);
            color: #721c24;
            border: 1px solid #f1aeb5;
        }

        .info-display {
            background: linear-gradient(135deg, #e3f2fd, #bbdefb);
            border: 1px solid #90caf9;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 25px;
        }

        .info-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid rgba(0,0,0,0.1);
        }

        .info-item:last-child {
            border-bottom: none;
        }

        .info-label {
            font-weight: 600;
            color: #1976d2;
        }

        .info-value {
            color: #0d47a1;
            font-weight: 500;
        }

        .password-help {
            font-size: 0.85rem;
            color: #6c757d;
            margin-top: 5px;
            font-style: italic;
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            .page-header {
                padding: 25px 20px;
            }

            .page-header h1 {
                font-size: 1.8rem;
                flex-direction: column;
                gap: 8px;
            }

            .card-content {
                padding: 25px 20px;
            }

            .info-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 5px;
            }
        }

        @media (max-width: 480px) {
            .page-header h1 {
                font-size: 1.6rem;
            }

            .submit-btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="/views/admin/common/header.jsp" />

    <div class="container">
        <div class="page-header">
            <h1>👤 Thông tin tài khoản Admin</h1>
        </div>

        <!-- Thông báo -->
        <c:if test="${not empty success}">
            <div class="alert alert-success">
                ✅ ${success}
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-error">
                ❌ ${error}
            </div>
        </c:if>

        <div class="profile-card">
            <div class="card-header">
                📋 Thông tin hiện tại
            </div>
            <div class="card-content">
                <div class="info-display">
                    <div class="info-item">
                        <span class="info-label">Tên đăng nhập:</span>
                        <span class="info-value">${admin.username}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Email:</span>
                        <span class="info-value">${admin.email}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Vai trò:</span>
                        <span class="info-value">${admin.role}</span>
                    </div>
                </div>
            </div>
        </div>

        <form method="post" action="${pageContext.request.contextPath}/admin/profile">
            <div class="profile-card">
                <div class="card-header">
                    ✏️ Cập nhật thông tin
                </div>
                <div class="card-content">
                    <div class="form-group">
                        <label class="form-label">Tên hiển thị:</label>
                        <input type="text" 
                               name="displayName" 
                               value="${admin.fullName}" 
                               class="form-input"
                               placeholder="Nhập tên hiển thị..."
                               required />
                    </div>

                    <div class="password-section">
                        <h3 class="section-title">🔒 Đổi mật khẩu</h3>
                        
                        <div class="form-group">
                            <label class="form-label">Mật khẩu hiện tại:</label>
                            <input type="password" 
                                   name="currentPassword" 
                                   class="form-input"
                                   placeholder="Nhập mật khẩu hiện tại..." />
                            <div class="password-help">Để trống nếu không muốn đổi mật khẩu</div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Mật khẩu mới:</label>
                            <input type="password" 
                                   name="newPassword" 
                                   class="form-input"
                                   placeholder="Nhập mật khẩu mới..." />
                        </div>

                        <div class="form-group">
                            <label class="form-label">Nhập lại mật khẩu mới:</label>
                            <input type="password" 
                                   name="confirmPassword" 
                                   class="form-input"
                                   placeholder="Xác nhận mật khẩu mới..." />
                        </div>
                    </div>

                    <button type="submit" class="submit-btn">
                        💾 Cập nhật thông tin
                    </button>
                </div>
            </div>
        </form>
    </div>

    <jsp:include page="/views/admin/common/footer.jsp" />
</body>
</html>
