package watches;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/AddWatchServlet")
public class AddWatchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public AddWatchServlet() {
        super();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().append("Served at : ").append(req.getContextPath());
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);

        String brand = req.getParameter("brand");
        String model = req.getParameter("model");
        String country = req.getParameter("country");
        String exclusivity = req.getParameter("exclusivity");
        String release_date = req.getParameter("release_date");
        int price = Integer.parseInt(req.getParameter("price"));
        String admin_username = req.getParameter("admin_username");

        WatchBean watchBean = new WatchBean(0, brand, model, country, exclusivity, release_date, price, admin_username);
        try {
            WatchDao.addNewWatch(watchBean);
            System.out.println("ADDED !!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("NOT ADDED .. ERROR - " + e);
        }
        resp.sendRedirect("admin.jsp");
    }
}
