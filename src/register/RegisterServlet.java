package register;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    public RegisterServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Copying all the input parameters in to local variables
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = "user";

        RegisterBean registerBean = new RegisterBean();
        registerBean.setFirstname(firstname);
        registerBean.setLastname(lastname);
        registerBean.setUsername(username);
        registerBean.setEmail(email);
        registerBean.setPassword(password);
        registerBean.setRole(role);

        RegisterDao registerDao = new RegisterDao();

            //insert user data in to the database.
            String userRegistered = registerDao.registerUser(registerBean);

            if (userRegistered.equals("SUCCESS"))
            {
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else
            {
                request.setAttribute("errMessage", userRegistered);
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            }
    }
}
