<#macro page title>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title> ${title} </title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="stylesheet" href="/static/styles/main.css">

    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item ">
                        <a class="nav-link" href="/home"> Home </a>
                    </li>
                </ul>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/home/MyDB"> DataBase </a>
                    </li>
                </ul>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/home/calc"> Calculator </a>
                    </li>
                </ul>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/bye"> Just some page </a>
                    </li>
                </ul>

                <form action="/logout" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <input type="submit" value="Sign Out">
                </form>
            </div>

        </nav>
        <div class="container mt-2">
            <#nested >
       </div>
    </body>
    </html>
</#macro>

<#macro form_btn >
    <div class="form_btns">
        <p class="form_btns form_p"> Action </p>
        <button type="submit" class="btn btn-primary">Submit</button>
        <button type="reset" class="btn btn-secondary"> reset </button>
    </div>
</#macro>
