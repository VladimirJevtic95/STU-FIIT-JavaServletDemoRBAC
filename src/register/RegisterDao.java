package register;

import connection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterDao {

    public String registerUser(RegisterBean registerBean) {

        String firstname = registerBean.getFirstname();
        String lastname = registerBean.getLastname();
        String username = registerBean.getUsername();
        String email = registerBean.getEmail();
        String password = registerBean.getPassword();
        String role = registerBean.getRole();

        Connection con = null;
        PreparedStatement preparedStatement = null;

        try {
            con = DBConnection.getConnection();
            String query = "INSERT INTO users(id, firstname, lastname, username, email, password, role) VALUES (NULL, ?, ?, ?, ?, ?, ?)";
            preparedStatement = con.prepareStatement(query); //Making use of prepared statements to insert bunch of data
            preparedStatement.setString(1, firstname);
            preparedStatement.setString(2, lastname);
            preparedStatement.setString(3, username);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, password);
            preparedStatement.setString(6, role);

            int i = preparedStatement.executeUpdate();

            if (i != 0)  //Just to ensure data has been inserted into the database
                return "SUCCESS";
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Oops.. Something went wrong while REGISTER..";
    }
}