package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebFilter(filterName = "AdminAuthenticationFilter", urlPatterns = {"/admin/*"})
public class AdminAuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false); // không tạo session mới

        String uri = req.getRequestURI();

        boolean isLoginPage = uri.contains("/login"); // sửa lại chỗ này
        boolean isStaticResource = uri.matches(".*(\\.css|\\.js|\\.png|\\.jpg|\\.jpeg|\\.woff|\\.ttf)$");

        boolean isLoggedInAsAdmin = (session != null && session.getAttribute("admin") != null);

        if (isLoggedInAsAdmin || isLoginPage || isStaticResource) {
            chain.doFilter(request, response); // Cho phép đi tiếp
        } else {
            resp.sendRedirect(req.getContextPath() + "/login"); // chuyển về login chung
        }
    }

    @Override
    public void init(FilterConfig filterConfig) {}

    @Override
    public void destroy() {}
}
