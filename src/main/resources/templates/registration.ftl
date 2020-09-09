<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title> Login page </title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/styles/main.css">

</head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" >My best app</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent"></div>

        </nav>

        <div class="container mt-3">

            <form action="/registration" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />

                <div class="form-group">
                    <label> Create your Name <input type="text" class="form-control" name="username" placeholder="Who are you?"/> </label>
                    <#if errorUserMessage??>
                        <p>${errorUserMessage}</p>
                    </#if>
                </div>

                <div class="form-group">
                    <label> Password: <input type="password" class="form-control" name="password" placeholder="Your password"/> </label>
                </div>

                <div class="form-group">
                    <label> Confirm password: <input type="password" class="form-control" name="confirmPassword" placeholder="Your password"/> </label>
                    <#if errorPswdMessage??>
                        <p>${errorPswdMessage}</p>
                    </#if>
                </div>

                <input type="submit" class="btn btn-primary" value="Add me"/>
                <#--<button type="submit" class="btn btn-primary">Submit</button>-->
            </form>
        </div>

    </body>
</html>