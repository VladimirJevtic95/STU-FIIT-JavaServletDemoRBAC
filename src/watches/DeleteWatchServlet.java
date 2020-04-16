package watches;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteWatchServlet")
public class DeleteWatchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public DeleteWatchServlet() {
        super();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().append("Served at : ").append(req.getContextPath());

        String idTemp = req.getParameter("watch_id");
        int watch_id = Integer.parseInt(idTemp);

        try {
            WatchDao.deleteWatch(watch_id);
            System.out.println("DELETED !!!!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("NOT DELETED .. ERROR - " + e);
        }
        resp.sendRedirect("admin.jsp");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
