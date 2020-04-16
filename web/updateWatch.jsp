
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*,watches.WatchBean,watches.WatchDao" %>
<html>
    <head>
        <title>Update</title>
        <link rel="stylesheet" type="text/css" href="css/css_update.css">
    </head>
    <% //In case, if Admin session is not set, redirect to Login page
        if ((request.getSession(false).getAttribute("Admin") == null)) {
    %>
    <jsp:forward page="login.jsp"></jsp:forward>
    <%} %>

    <body class="align">

        <div class="grid">

<%--            <%--%>
<%--                String admin = null;--%>
<%--                if (session.getAttribute("Admin") == null) {--%>
<%--                    response.sendRedirect("login.jsp");--%>
<%--                } else {--%>
<%--                    admin = (String) session.getAttribute("Admin");--%>
<%--                }--%>
<%--            %>--%>

            <%
                String idTemp = request.getParameter("watch_id");
                int watch_id = Integer.parseInt(idTemp);
                WatchBean watch = null;
                try {
                    watch = WatchDao.getWatchByID(watch_id);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                assert watch != null;%>

            <form action="UpdateWatchServlet" method="post" class="form update">
                <input type="hidden" name="watch_id" value="<%=watch.getId()%>">

                <div class="form__field">
                    <label for="brand">
                        <img src="svg/brand.svg" width="20px" height="20px" alt="logo_brand">
                        <span class="hidden">Brand</span>
                    </label>
                    <input id="brand" type="text" name="brand" class="form__input" placeholder="Brand"
                           value="<%=watch.getBrand()%>"
                           required>
                </div>

                <div class="form__field">
                    <label for="model">
                        <img src="svg/model.svg" width="20px" height="20px" alt="model">
                        <span class="hidden">Model</span>
                    </label>
                    <input id="model" type="text" name="model" class="form__input" placeholder="Model"
                           value="<%=watch.getModel()%>"
                           required>
                </div>

                <div class="form__field">
                    <label for="country">
                        <img src="svg/country.svg" width="20px" height="20px"  alt="country">
                        <span class="hidden">Country</span>
                    </label>
                    <input id="country" type="text" name="country" class="form__input" placeholder="Country"
                           value="<%=watch.getCountry()%>"
                           required>
                </div>

                <div class="form__field">
                    <label for="exclusivity">
                        <img src="svg/exclusivity.svg" width="20px" height="20px"  alt="vip">
                        <span class="hidden">Exclusivity</span>
                    </label>
                    <input id="exclusivity" type="text" name="exclusivity" class="form__input" placeholder="Exclusivity"
                           value="<%=watch.getExclusivity()%>"
                           required>
                </div>

                <div class="form__field">
                    <label for="release_date">
                        <img src="svg/release_date.svg" width="20px" height="20px" alt="date">
                        <span class="hidden">Release Date</span>
                    </label>
                    <input id="release_date" type="text" name="release_date" class="form__input"
                           placeholder="Release date" value="<%=watch.getRelease_date()%>"
                           required>
                </div>

                <div class="form__field">
                    <label for="price">
                        <img src="svg/price.svg" width="20px" height="20px" alt="price">
                        <span class="hidden">Price</span>
                    </label>
                    <input id="price" type="text" name="price" class="form__input" placeholder="Price"
                           value="<%=watch.getPrice()%>"
                           required>
                </div>

                <input type="hidden" name="admin_username" value="<%=watch.getAdmin_username()%>">

                <div class="form__field">
                    <input type="submit" value="Update"/>
                </div>

            </form>

            <p class="text--center">Don't wanna update the watch?
                <a href="admin.jsp">Back to list</a>
            </p>

        </div>

    </body>
</html>
