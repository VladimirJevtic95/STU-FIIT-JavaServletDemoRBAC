<%@ page import="watches.WatchBean" %>
<%@ page import="watches.WatchDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Watches Store</title>
        <link rel="stylesheet" type="text/css" href="css/css_user.css">
    </head>
    <% //In case, if User session is not set, redirect to Login page.
        if ((request.getSession(false).getAttribute("User") == null)) {
    %>
    <jsp:forward page="login.jsp"></jsp:forward>
    <%} %>

    <body>

        <%
            String user = null;
            if (session.getAttribute("User") == null) {
                response.sendRedirect("login.jsp");
            } else {
                user = (String) session.getAttribute("User");
            }
        %>

        <div style="text-align: center;"><h2>
            Welcome  <%=user %>
        </h2></div>

        <%
            List<WatchBean> items = null;
            try {
                items = WatchDao.getAll();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            assert items != null;
            Iterator<WatchBean> it = items.iterator();
        %>

        <div class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
                <thead>
                    <tr>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Country</th>
                        <th>Exclusivity</th>
                        <th>Release date</th>
                        <th>Price</th>
                        <th>Seller</th>
                    </tr>
                </thead>
            </table>
        </div>

        <div class="tabl-content">
            <table cellpadding="0" cellspacing="0" border="0">
                <tbody>
                    <%
                        while (it.hasNext()) {
                            WatchBean watch = it.next();
                    %>

                    <tr>
                        <td><%=watch.getBrand()%>
                        </td>
                        <td><%=watch.getModel()%>
                        </td>
                        <td><%=watch.getCountry()%>
                        </td>
                        <td><%=watch.getExclusivity()%>
                        </td>
                        <td><%=watch.getRelease_date()%>
                        </td>
                        <td><%=watch.getPrice()%> &euro;
                        </td>
                        <td><%=watch.getAdmin_username()%>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <br/>
        <hr/>
        <br/><br/>
        <div style="text-align: center"><a class="logouta" href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
        </div>
    </body>
</html>