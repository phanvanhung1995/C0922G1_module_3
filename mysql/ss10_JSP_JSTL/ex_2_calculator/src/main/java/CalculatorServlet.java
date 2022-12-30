import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "CalculatorServlet", value = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float firstoperand = Float.parseFloat(request.getParameter("firstoperand"));
        float secondoperand = Float.parseFloat(request.getParameter("secondoperand"));
        char Operator = request.getParameter("operator").charAt(0);
        float result = Calculator.calculate(firstoperand, secondoperand, Operator);
        String error = "input secondoperand # 0";

        request.setAttribute("Operator", Operator);
        request.setAttribute("secondoperand", secondoperand);
        request.setAttribute("firstoperand", firstoperand);
        request.setAttribute("result", result);
        request.setAttribute("error", error);

        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }
}
