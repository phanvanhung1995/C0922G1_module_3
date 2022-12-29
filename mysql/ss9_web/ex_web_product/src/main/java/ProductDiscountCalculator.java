import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Product Discount Calculator", value = "/ProductDiscountCalculator")
public class ProductDiscountCalculator extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double Price = Double.parseDouble(request.getParameter("Price"));
        double Percent = Double.parseDouble(request.getParameter("Percent"));
        String Description = request.getParameter("Description");

        double Discount_Amount = Price * Percent * 0.01 ;
        double Discount_Price = Price - Discount_Amount ;

        request.setAttribute("Discount_Amount",Discount_Amount);
        request.setAttribute("Discount_Price",Discount_Price);
        request.setAttribute("Description",Description);

        request.getRequestDispatcher("/display.jsp").forward(request,response);
    }
}
