<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Hello!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/styles/main.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">My best app</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent"></div>

        <form action="/home">
            <input type="hidden" name="_csrf" value="${_csrf.token}" >
            <input type="submit" class="btn btn-primary calc_history" value="Go to main page" />
        </form>

    </nav>

    <h2> Hello user</h2>

    <p> You will find here few interesting things which you can use</p>
        <ul>
            <li>
                <p>Mega Calculator with history</p>
            </li>

            <li>
                <p>Interface which connected to the best DataBase</p>
            </li>
        </ul>

</body>
</html>