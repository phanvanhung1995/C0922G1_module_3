import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("mai văn Hoàn", "1983/08/20", "Hà Nội", "https://png.pngtree.com/element_our/20190528/ourlarge/pngtree-cartoon-kneeling-reading-boy-png-image_1181774.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983/08/21", "Bắc Giang", "https://png.pngtree.com/element_our/20190528/ourlarge/pngtree-cartoon-kneeling-reading-boy-png-image_1181774.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983/08/22", "Nam ĐỊNh", "https://png.pngtree.com/element_our/20190528/ourlarge/pngtree-cartoon-kneeling-reading-boy-png-image_1181774.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983/08/23", "Huế", "https://png.pngtree.com/element_our/20190528/ourlarge/pngtree-cartoon-kneeling-reading-boy-png-image_1181774.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983/08/24", "Nghệ an", "https://png.pngtree.com/element_our/20190528/ourlarge/pngtree-cartoon-kneeling-reading-boy-png-image_1181774.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);

        request.getRequestDispatcher("/customer.jsp").forward(request,response);
    }
}
