package watches;

import connection.DBConnection;

import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class WatchDao {

    public static List<WatchBean> getAll() throws SQLException {

        Connection con;
        Statement statement;
        ResultSet resultSet;

        List<WatchBean> listWatches = new LinkedList<>();
        con = DBConnection.getConnection();
        statement = con.createStatement();
        resultSet = statement.executeQuery("SELECT watch_id, brand, model, country, exclusivity, release_date, price, admin_username FROM watches ORDER BY price DESC ");

        while (resultSet.next()) {
            WatchBean watchBean = new WatchBean(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3),
                    resultSet.getString(4), resultSet.getString(5),
                    resultSet.getString(6), resultSet.getInt(7), resultSet.getString(8));
            listWatches.add(watchBean);
        }
        return listWatches;
    }

    public static void addNewWatch(WatchBean wb) throws SQLException {
        String sql = "INSERT INTO watches (watch_id, brand, model, country, exclusivity, release_date, price, admin_username) " +
                "VALUES ( NULL, '" + wb.getBrand() + "','" + wb.getModel() + "','" + wb.getCountry() + "','" + wb.getExclusivity() + "','"
                + wb.getRelease_date() + "','" + wb.getPrice() + "','" + wb.getAdmin_username() + "')";

        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.executeUpdate();
    }

    public static void deleteWatch(int watch_id) throws SQLException {
        String sql = "DELETE FROM watches WHERE watch_id=" + watch_id;
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.executeUpdate();
    }

    public static WatchBean getWatchByID(int watch_id) throws SQLException {
        WatchBean watchBean;
        String sql = "SELECT * FROM watches WHERE watch_id=" + watch_id;
        ResultSet resultSet = DBConnection.getPreparedStatement(sql).executeQuery();
        resultSet.next();
        watchBean = new WatchBean(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4),
                resultSet.getString(5), resultSet.getString(6), resultSet.getInt(7), resultSet.getString(8));

        return watchBean;
    }

    public static void updateWatch(WatchBean wb) throws SQLException {
        String sql = "UPDATE watches SET brand='" + wb.getBrand() + "' " +
                ", model='" + wb.getModel() + "' " +
                ", country='" + wb.getCountry() + "' " +
                ", exclusivity='" + wb.getExclusivity() + "' " +
                ", release_date='" + wb.getRelease_date() + "' " +
                ", price='" + wb.getPrice() + "' " +
                ", admin_username='" + wb.getAdmin_username() + "'" +
                " WHERE watch_id=" + wb.getId();
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        ps.executeUpdate();
    }

}
