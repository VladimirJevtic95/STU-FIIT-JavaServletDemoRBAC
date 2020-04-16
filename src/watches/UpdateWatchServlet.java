package watches;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/UpdateWatchServlet")
public class UpdateWatchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public UpdateWatchServlet() {
        super();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().append("Served at : ").append(req.getContextPath());
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);

        int watch_id = Integer.parseInt(req.getParameter("watch_id"));
        String brand = req.getParameter("brand");
        String model = req.getParameter("model");
        String country = req.getParameter("country");
        String exclusivity = req.getParameter("exclusivity");
        String release_date = req.getParameter("release_date");
        int price = Integer.parseInt(req.getParameter("price"));
        String admin_username = req.getParameter("admin_username");

        WatchBean bean = new WatchBean(watch_id, brand, model, country, exclusivity, release_date, price, admin_username);

        try {
            WatchDao.updateWatch(bean);
            System.out.println("UPDATED !!!!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("NOT UPDATED .. ERROR - " + e);
        }
        resp.sendRedirect("admin.jsp");
    }
}