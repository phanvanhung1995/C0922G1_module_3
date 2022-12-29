import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Login", value = "/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        request.setAttribute("use", username);
        request.setAttribute("pass", password);

        if ("admin".equals(username) && "admin".equals(password)) {

            request.getRequestDispatcher("welcome.jsp").forward(request,response);
        } else {
            request.getRequestDispatcher("Error.jsp").forward(request,response);
        }

    }
}
