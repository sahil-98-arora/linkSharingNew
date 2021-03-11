<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://kit.fontawesome.com/a390992c2b.js" crossorigin="anonymous"></script>
    <style>
    .dash_links{
        color: white;
        align-items: center;
    }

    .dash_links_{
        text-decoration: none;
        color: white;
        padding: 0%;
        font-size: 15px;
        font-weight: 500;
    }
    </style>
</head>
<body>
<!--###########################################-->
<!--                 NAVBAR                    -->
<nav class="navbar navbar-inverse navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" style="font-weight: 1000;">Link Sharing</a>
        </div>

        <!---->
        <span style="color: yellow; font-weight: 800; font-size: 25px;">All Topics</span>
        <!---->

        <form class="navbar-form form-inline navbar-right" action="/action_page.php">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" name="search">
                <button class="btn btn-success" type="submit">Search</button>
            </div>
            &nbsp;&nbsp;
            <span class="dash_links">
                &nbsp;&nbsp;
                <i class="fas fa-comment fa-2x" data-toggle="modal" data-target="#myModal1"></i>&nbsp;&nbsp;
                <i class="far fa-envelope fa-2x" data-toggle="modal" data-target="#myModal2"></i>&nbsp;&nbsp;
                <i class="fas fa-link fa-2x" data-toggle="modal" data-target="#myModal3"></i>&nbsp;&nbsp;
                <i class="far fa-plus-square fa-2x" data-toggle="modal" data-target="#myModal4"></i>&nbsp;&nbsp;
            </span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div style="float: inline-end; ">
                <a class="dash_links_ nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size:20px;">
                    <i class="dash_links_ fas fa-user fa-1x"></i> Profile </a>
                <div class=" dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
                    <a class="dropdown-item" href="#">My account</a>
                    <a class="dropdown-item" href="#">Log out</a>
                </div>
            </div>

    </div>
</form>
</div>
</nav>
<!--###########################################-->
<div class="container" style="margin-top: 50px;">
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th>Name</th>
            <th>Topic Visibility</th>
            <th>Date Created</th>
            <th>Last Updated</th>
            <th>Created By</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${alltopics}" var="num">
            <tr>
                <td>${num.topicName}</td>
                <td>${num.topicShow}</td>
                <td>${num.dateCreated}</td>
                <td>${num.lastUpdated}</td>
                <td>${num.users.userName}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</body>
</html>