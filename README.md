🌟 PRJ301 – FashionWeb
Java JSP/Servlet · MVC · SQL Server

FashionWeb là website bán hàng thời trang được phát triển theo mô hình MVC (Model – View – Controller) bằng Java Servlet/JSP.
Dự án tuân theo chuẩn môn PRJ301 – Web Application Development tại FPT University.

📌 1. Công nghệ sử dụng
🔹 Backend

Java Servlet

JDBC + DAO Pattern

Tomcat 9 / 10

SQL Server 2019

JSTL + Expression Language (EL)

🔹 Frontend (View)

JSP

HTML/CSS/JS

Bootstrap 5

JSTL

📌 2. Chức năng chính
👕 Người dùng (Customer)

Đăng ký tài khoản

Đăng nhập / Đăng xuất

Xem danh sách sản phẩm

Xem chi tiết sản phẩm

Lọc sản phẩm theo loại

Thêm sản phẩm vào giỏ hàng

Cập nhật giỏ hàng

Xóa item trong giỏ

Thanh toán (Checkout)

Xem lịch sử đơn hàng

👨‍💼 Admin

Đăng nhập Admin

CRUD sản phẩm

CRUD loại sản phẩm (nếu có)

Quản lý đơn hàng

Quản lý tài khoản người dùng

📌 3. Kiến trúc dự án (MVC)
FashionWeb/
│── src/
│   ├── controller/
│   │     ├── HomeController.java
│   │     ├── ProductController.java
│   │     ├── CartController.java
│   │     ├── AuthController.java
│   │     └── AdminController.java
│   │
│   ├── dao/
│   │     ├── ProductDAO.java
│   │     ├── UserDAO.java
│   │     ├── CategoryDAO.java
│   │     └── OrderDAO.java
│   │
│   ├── model/
│   │     ├── Product.java
│   │     ├── Category.java
│   │     ├── User.java
│   │     └── Order.java
│   │
│   ├── util/
│   │     └── DBContext.java
│   │
│   └── filter/
│         └── AuthFilter.java (nếu dùng)
│
│── web/
│   ├── views/
│   │     ├── home.jsp
│   │     ├── productDetail.jsp
│   │     ├── cart.jsp
│   │     ├── checkout.jsp
│   │     └── admin/
│   │           ├── dashboard.jsp
│   │           ├── products.jsp
│   │           └── editProduct.jsp
│   │
│   ├── assets/
│   └── WEB-INF/
│         └── web.xml
│
└── README.md

📌 4. Cấu trúc database – SQL Server
🗂 Tables

Users

Products

Categories

Orders

OrderDetails

Admins (optional)

🧱 Ví dụ bảng Products
CREATE TABLE Products (
    id INT IDENTITY PRIMARY KEY,
    name NVARCHAR(100),
    price DECIMAL(10,2),
    image NVARCHAR(255),
    categoryId INT,
    description NVARCHAR(MAX)
);

Kết nối DB

File DBContext.java:

public class DBContext {
    protected Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://localhost:1433;databaseName=FashionDB;encrypt=false;";
        String user = "sa";
        String pass = "123456";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, user, pass);
    }
}

📌 5. Chạy dự án
🔧 Yêu cầu

JDK 8 hoặc 11

Apache Tomcat 9/10

SQL Server + SQL Server Management Studio

JDBC Driver (mssql-jdbc.jar)

🚀 Bước 1 – Import dự án

Mở NetBeans / IntelliJ / Eclipse

Import project dạng Java Web / Maven Webapp

🚀 Bước 2 – Cấu hình database

Chạy file database.sql

Cập nhật tài khoản SQL trong DBContext.java

🚀 Bước 3 – Run Tomcat

Add Tomcat → Run → truy cập:

http://localhost:8080/FashionWeb

📌 6. Tài khoản test
👤 Người dùng
user: customer1
pass: 123456

👨‍💼 Admin
admin: admin
pass: admin123

📌 7. Screenshot (nếu có)

Thêm ảnh:

![Home](./screenshots/home.png)
![Product](./screenshots/product.png)

📌 8. Thành viên nhóm

Nguyễn Vũ Hoàng – Developer
Nguyễn Tiến Quân -Developer
Nguyễn Tiến Sơn- Developer


📌 9. License

MIT License – sử dụng cho mục đích học tập PRJ301.
