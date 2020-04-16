<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Add new watch</title>
        <link rel="stylesheet" type="text/css" href="css/css_add_new.css">
    </head>
    <% //In case, if Admin session is not set, redirect to Login page
        if ((request.getSession(false).getAttribute("Admin") == null)) {
    %>
    <jsp:forward page="login.jsp"></jsp:forward>
    <%} %>

    <body class="align">

        <div class="grid">

            <%
                String admin = null;
                if (session.getAttribute("Admin") == null) {
                    response.sendRedirect("login.jsp");
                } else {
                    admin = (String) session.getAttribute("Admin");
                }
            %>

            <form action="AddWatchServlet" method="post" class="form addnew">

                <div class="form__field">
                    <label for="brand">
                        <img src="svg/brand.svg" width="20px" height="20px" alt="brand_logo">
                        <span class="hidden">Brand</span>
                    </label>
                    <input id="brand" type="text" name="brand" class="form__input" placeholder="Brand"
                           required>
                </div>

                <div class="form__field">
                    <label for="model">
                        <img src="svg/model.svg" width="20px" height="20px" alt="model_logo">
                        <span class="hidden">Model</span>
                    </label>
                    <input id="model" type="text" name="model" class="form__input" placeholder="Model"
                           required>
                </div>

                <div class="form__field">
                    <label for="country">
                        <img src="svg/country.svg" width="20px" height="20px" alt="country_logo">
                        <span class="hidden">Country</span>
                    </label>
                    <input id="country" type="text" name="country" class="form__input" placeholder="Country"
                           required>
                </div>

                <div class="form__field">
                    <label for="exclusivity">
                        <img src="svg/exclusivity.svg" width="20px" height="20px" alt="exclusivity_logo">
                        <span class="hidden">Exclusivity</span>
                    </label>
                    <input id="exclusivity" type="text" name="exclusivity" class="form__input" placeholder="Exclusivity"
                           required>
                </div>

                <div class="form__field">
                    <label for="release_date">
                        <img src="svg/release_date.svg" width="20px" height="20px" alt="calendar_logo">
                        <span class="hidden">Release Date</span>
                    </label>
                    <input id="release_date" type="text" name="release_date" class="form__input"
                           placeholder="Release date"
                           required>
                </div>

                <div class="form__field">
                    <label for="price">
                        <img src="svg/price.svg" width="20px" height="20px" alt="price_logo">
                        <span class="hidden">Price</span>
                    </label>
                    <input id="price" type="text" name="price" class="form__input" placeholder="Price"
                           required>
                </div>

                <div class="form__field">
                    <label for="admin_username">
                        <img src="svg/username.svg" width="20px" height="20px" alt="profile_logo">
                        <span class="hidden">Admin Username</span>
                    </label>
                    <input id="admin_username" type="text" name="admin_username" class="form__input"
                           placeholder="Admin username" value="<%=admin%>" readonly
                           required>
                </div>

                <div class="form__field">
                    <input type="submit" value="Add new watch"/>
                </div>

            </form>

            <p class="text--center">Don't wanna add new watch?
                <a href="admin.jsp">Back to list</a>
            </p>

        </div>
    </body>
</html>
