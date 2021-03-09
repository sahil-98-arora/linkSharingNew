<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>

    <g:external dir="stylesheets" file="profile.css"></g:external>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://kit.fontawesome.com/a390992c2b.js" crossorigin="anonymous"></script>


</head>
<body>

<!--###########################################-->
<!--                 NAVBAR                    -->
<nav class="navbar navbar-inverse navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <div class="navbar-header">
            <g:link controller="user" action="dashboard" style="font-weight: 1000;" class="navbar-brand">Link Sharing</g:link>
        </div>

        <!---->
        <span style="color: yellow; font-weight: 800; font-size: 25px;">Edit Profile</span>
        <!---->

        <form class="navbar-form form-inline navbar-right" action="/action_page.php">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" name="search">
                <button class="btn btn-success" type="submit">Search</button>
            </div>
            &nbsp;&nbsp;
            <span class="dash_links">
                &nbsp;&nbsp;
                <!--
                <i class="fas fa-comment fa-2x" data-toggle="modal" data-target="#myModal1"></i>&nbsp;&nbsp;
                <i class="far fa-envelope fa-2x" data-toggle="modal" data-target="#myModal2"></i>&nbsp;&nbsp;
                <i class="fas fa-link fa-2x" data-toggle="modal" data-target="#myModal3"></i>&nbsp;&nbsp;
                <i class="far fa-plus-square fa-2x" data-toggle="modal" data-target="#myModal4"></i>&nbsp;&nbsp;
                -->
            </span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div style="float: inline-end; ">
                <a class="dash_links nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 20px">
                    <i class="dash_links fas fa-user fa-1x"></i> ${session.user.firstName} </a>
                <div class=" dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
                    <g:link controller="user" action="profile" class="dropdown-item">Profile</g:link>
                    <g:link controller="user" action="logout" class="dropdown-item">Logout</g:link>
                </div>
            </div>


        </form>
    </div>
</nav>
<!--###########################################-->



<!--################################################-->
<!--                    BODY                        -->
<div style="margin-left: 50px; margin-top: 20px;">
    <div style="float: left; width: 520px; margin-right: 15px; ">


        <!--                ----USER card----                    -->
        <div class="container">
            <div class="card" style="border: 2px solid rgb(255, 166, 0);">
                <div class="card-body" style="padding: 2%;">
                    <div class="postImage" style="width: 100px; height: 100px; margin-right: 10px; margin-top: 10px;">
                        <g:img dir="images" class="pImage" file='missing-image.jpg' alt="Missing Image" />
                    </div>
                    <div class="postContent">
                        <p>
                            <span style="font-size: 25px;">${session.user.firstName} ${session.user.lastName}</span><br>
                            <span style="color: gray;">@ ${session.user.userName}</span><span style="color: gray; float: inline-end;">${session.user.email}</span><br>
                            <span style="float: left; margin-right: 50px;">
                                Subscriptions <br> 500
                            </span>
                            <span>
                                Topics <br> 500
                            </span>

                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!--                ----USER card----                    -->


        <br>


        <!--                ----Topics created by user card----                    -->
        <div class="container">
            <div class="card">
                <div class="card-header">Topics Created
                    <a href="#" style="float: inline-end;"></a>
                </div>

                <div class="card-body">
                    <div class="postImage">
                        <g:img dir="images" class="pImage" file='missing-image.jpg' alt="Missing Image" />
                    </div>
                    <div class="postContent">
                        <p>
                            <a href="#"> Topic_Name </a><br>
                            <span style="color: gray;">@Username</span>

                            <br>
                            <span style="float: left; margin-right: 70px;">
                                Subscriptions <br> 500 </span>
                            <span>Topics <br> 500 </span>
                        </p>
                    </div>
                    <p style="float: inline-end; margin-bottom: 0%;">
                        <select>
                            <option value = "serious" selected> serious</option>
                            <option value = "casual"> casual</option>
                            <option value = "veryserious"> Very serious</option>
                        </select>
                        <select>
                            <option value = "serious" selected> Public</option>
                            <option value = "casual"> Private</option>
                        </select>
                        &nbsp;&nbsp;
                        <i class="far fa-envelope fa-2x"></i>&nbsp;&nbsp;
                        <i class="far fa-plus-square fa-2x"></i>&nbsp;&nbsp;
                        <i class="far fa-trash-alt fa-2x"></i>
                    </p>

                </div>
                <hr>
            </div>
        </div>
        <!--                ----Topics created by user card----                    -->

        <br>
    </div>



    <!--                ----Profile card----                    -->
    <div class="container">
        <div class="card">
            <div class="card-header">Profile
                <a href="#" style="float: inline-end;"></a>
            </div>
            <div class="card-body">

                <form>
                    <div class="form-group row">
                        <label for="firstName" class="col-sm-2 col-form-label">Firstname</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="firstName" placeholder="Firstname">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="lastName" class="col-sm-2 col-form-label">Lastname</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="lastName" placeholder="Lastname">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="userName" class="col-sm-2 col-form-label">Username</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="userName" placeholder="Username">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="photo" class="col-sm-2 col-form-label">Photo</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="photo">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-10">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--                ----Profile card----                    -->

    <br>

    <!--                ----Change Password card----                    -->
    <div class="container">
        <div class="card">
            <div class="card-header">Change Password
                <a href="#" style="float: inline-end;"></a>
            </div>
            <div class="card-body">

                <form>
                    <div class="form-group row">
                        <label for="password" class="col-sm-2 col-form-label">Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" placeholder="Password">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="confirmPassword" class="col-sm-2 col-form-label">Confirm Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-10">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--                ----Chaange Password card----                    -->

    <br><br>
</div>

</body>
</html>