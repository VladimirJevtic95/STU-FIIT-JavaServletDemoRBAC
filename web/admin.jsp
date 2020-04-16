<%--suppress HtmlDeprecatedAttribute --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="watches.WatchBean" %>
<%@ page import="watches.WatchDao" %>
<!DOCTYPE html PUBLIC>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Admin</title>
        <link rel="stylesheet" type="text/css" href="css/css_admin.css">
    </head>
    <% //In case, if Admin session is not set, redirect to Login page
        if ((request.getSession(false).getAttribute("Admin") == null)) {
    %>
    <jsp:forward page="login.jsp"></jsp:forward>
    <%} %>

    <body>

        <%
            String admin = null;
            if (session.getAttribute("Admin") == null) {
                response.sendRedirect("login.jsp");
            } else {
                admin = (String) session.getAttribute("Admin");
            }
        %>

        <div style="text-align: center;"><h2>
            Welcome <%=admin %>
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


        <a href="addWatch.jsp">
            <input type="button" value="ADD NEW WATCH">
        </a>
        <br/>
        <br/>

        <div class="tbl-header">

<%--suppress HtmlDeprecatedAttribute --%>
            <table cellpadding="0" cellspacing="0" border="0">
                <thead>
                    <tr>
                        <th>Brand</th>
                        <th>Model</th>
                        <th>Country</th>
                        <th>Exclusivity</th>
                        <th>Release date</th>
                        <th>Price</th>
                        <th>Admin username</th>
                        <th></th>
                    </tr>
                </thead>
            </table>
        </div>
        <div class="tbl-content">
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
                        <td>
                            <a href="DeleteWatchServlet?watch_id=<%=watch.getId()%>"><input type="button"
                                                                                            value="Delete"></a>
                            <a href="updateWatch.jsp?watch_id=<%=watch.getId()%>"><input type="button"
                                                                                         value="Update"></a>
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