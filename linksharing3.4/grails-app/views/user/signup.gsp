<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Link Sharing</title>

    <g:external dir="stylesheets" file="homepage.css"></g:external>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <script src="https://kit.fontawesome.com/a390992c2b.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css">

</head>
<body>

<!--###########################################-->
<!--                 NAVBAR                    -->
<nav class="navbar navbar-inverse navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Link Sharing</a>
        </div>

        <!---->
        <span style="color: yellow; font-weight: 800; font-size: 25px;">Homepage</span>
        <!---->

        <form class="navbar-form form-inline navbar-right" action="/action_page.php">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" name="search">
                <button class="btn btn-success" type="submit">Search</button>
            </div>
        </form>
    </div>
</nav>
<!--###########################################-->
<div>
    <div style="float: left">
        <div style="margin-top: 30px;">
            <!--###################################################-->
            <!--             Recent share and top posts            -->
            <div class="float-left" style="width: 700px; margin-left: 50px;">

                <div class="container">
                    <div class="card">
                        <div class="card-header">Recent Shares</div>
        %{--                <div class="card-body">--}%
        %{--                    <div class="postImage" >--}%
        %{--                        <g:img dir="images" class="pImage" file='missing-image.jpg' alt="Missing Image" />--}%
        %{--                    </div>--}%
        %{--                    <div class="postContent">--}%
        %{--                        <p>--}%
        %{--                            Name <span style="color: gray;">@Username Time</span>--}%
        %{--                            <a style="float: inline-end;" href="#"> Topic </a>--}%
        %{--                        </p>--}%
        %{--                        <p>--}%
        %{--                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit nobis blanditiis, optio voluptatum cum suscipit nostrum.--}%
        %{--                        </p>--}%
        %{--                        <p>--}%
        %{--                            <i class="fab fa-facebook-square fa-2x" ></i>&nbsp;--}%
        %{--                            <i class="fab fa-twitter-square fa-2x"></i>&nbsp;--}%
        %{--                            <i class="fab fa-google-plus-g fa-2x"></i>&nbsp;--}%

        %{--                            <a style="float: inline-end;" href="#">View Post </a>--}%
        %{--                        </p>--}%
        %{--                    </div>--}%
                            <g:render template="recentShares"/>
                    </div>
                </div>


                <div class="container" style="width: 100%;">
                    <h2></h2>
                    <div class="card">
%{--                        <div class="card-header">Top Posts--}%
%{--                            <form style="float: inline-end;">--}%
%{--                                <label> Select Duration </label>--}%
%{--                                <select>--}%
%{--                                    <option value = "Today" selected> Today </option>--}%
%{--                                    <option value = "Week"> 1 week </option>--}%
%{--                                    <option value = "Month"> 1 Month</option>--}%
%{--                                    <option value = "Year"> 1 Year</option>--}%
%{--                                </select>--}%
%{--                            </form>--}%
%{--                        </div>--}%
%{--                        <div class="card-body">--}%
%{--                            <div class="postImage">--}%
%{--                                <g:img dir="images" class="pImage" file='missing-image.jpg' alt="Missing Image" />--}%
%{--                            </div>--}%

%{--                            <div class="postContent">--}%
%{--                                <p>--}%
%{--                                    Name <span style="color: gray;">@Username Time</span>--}%
%{--                                    <a style="float: inline-end;" href="#"> Topic </a>--}%
%{--                                </p>--}%
%{--                                <p>--}%
%{--                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit nobis blanditiis, optio voluptatum cum suscipit nostrum.--}%
%{--                                </p>--}%
%{--                                <p>--}%
%{--                                    <i class="fab fa-facebook-square fa-2x" ></i>&nbsp;--}%
%{--                                    <i class="fab fa-twitter-square fa-2x"></i>&nbsp;--}%
%{--                                    <i class="fab fa-google-plus-g fa-2x"></i>&nbsp;--}%

%{--                                    <a style="float: inline-end;" href="#">View Post </a>--}%
%{--                                </p>--}%
%{--                                <hr>--}%
%{--                            </div>--}%
%{--                        </div>--}%
                        <g:render template="topPosts"/>
                    </div>
                </div>

            </div>
            <!--###########################################-->
        </div>
    </div>


    <div class="float-right" style="position: absolute; margin-left: 800px">
        <!--###########################################-->
        <!--            Login and Register             -->
        <div class="loginBody" >
            <g:if test="${flash.messageSignupSuccessful}">
                <div style="text-align: center"><span class="message" style="display: block; color: limegreen; font-weight: 800">${flash.messageSignupSuccessful}</span></div>
            </g:if>
            <g:if test="${flash.errorUpdateDetails}">
                <div style="text-align: center"><span class="alert alert-error" style="display: block; color: red; font-weight: 800">${flash.messageSignupFailed}</span></div>
            </g:if>
            <div class="section">
                <div class="container" style="margin-top: -55px;">
                    <div class="row full-height justify-content-center">
                        <div class="col-12 text-center align-self-center py-1">
                            <div class="section pb-5 pt-1 pt-sm-1 text-center">
                                <h6 class="mb-0 pb-1"><span>Log In </span><span>Sign Up</span></h6>
                                <input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
                                <label for="reg-log"></label>
                                <div class="card-3d-wrap mx-auto">
                                    <div class="card-3d-wrapper">

                                        <!--            Login             -->
                                        <div class="card-front">
                                            <div class="center-wrap">
                                                <div class="section text-center">
                                                    <h4 class="mb-4 pb-3" style="color: white;">Log In</h4>
                                                    <g:form controller="User" action="login" method="POST">
                                                    <div class="form-group">
                                                        <input type="text" name="userName" class="form-style" placeholder="Your Username" id="userName" autocomplete="off" value="${user?.userName}">
                                                        <i class="input-icon uil uil-user-circle"></i>
                                                    </div>
                                                    <div class="form-group mt-2">
                                                        <input type="password" name="password" class="form-style" placeholder="Your Password" id="password" autocomplete="off" value="${user?.password}">
                                                        <i class="input-icon uil uil-lock-alt"></i>
                                                    </div>

                                                        <g:actionSubmit value="login" class="btn mt-4" style="background-color: white;"/>
                                                    </g:form>
                                                    <p class="mb-0 mt-4 text-center"><a href="#0" class="link" data-toggle="collapse" data-target="#demo">Forgot your password?</a></p>
                                                    <br>
                                                    <g:form  controller="user" action="forgotPassword">
                                                    <div id="demo" class="collapse">
                                                        <div class="form-group mt-2">
                                                            <input type="email" name="email" class="form-style" placeholder="Your Email" id="email" autocomplete="off">
                                                            <i class="input-icon uil uil-at"></i>
                                                        </div>
                                                        <g:actionSubmit value="submit" action="forgotPassword" class="btn mt-4" style="background-color: white;"/>
                                                    </div>
                                                    </g:form>
                                                </div>
                                            </div>
                                        </div>

                                        <!--            Register             -->
                                        <div class="card-back">
                                            <div class="center-wrap">
                                                <div class="section text-center" style="margin-top: 250px;">
                                                    <h4 class="mb-4 pb-3" style="color: white;">Sign Up</h4>
                                                    <g:if test="${flash.message}">
                                                        <div class="alert alert-error" style="display: block">${flash.message}</div>
                                                    </g:if>
                                                    <g:form controller="User" action="signup" method="POST" enctype="multipart/form-data">
                                                        <div class="form-group">
                                                            <input type="text" name="firstName" class="form-style" placeholder="Your First Name" id="firstName" autocomplete="off">
                                                            <i class="input-icon uil uil-user"></i>
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" name="lastName" class="form-style" placeholder="Your Last Name" id="lastName" autocomplete="off">
                                                            <i class="input-icon uil uil-user"></i>
                                                        </div>
                                                        <div class="form-group mt-2">
                                                            <input type="email" name="email" class="form-style" placeholder="Your Email" id="email" autocomplete="off">
                                                            <i class="input-icon uil uil-at"></i>
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="text" name="userName" class="form-style" placeholder="Your Username" id="userName" autocomplete="off">
                                                            <i class="input-icon uil uil-user-circle"></i>
                                                        </div>
                                                        <div class="form-group mt-2">
                                                            <input type="password" name="password" class="form-style" placeholder="Your Password" id="password" autocomplete="off">
                                                            <i class="input-icon uil uil-lock-alt"></i>
                                                        </div>
                                                        <div class="form-group mt-2">
                                                            <input type="password" name="confirmPassword" class="form-style" placeholder="Confirm Password" id="confirmPassword" autocomplete="off">
                                                            <i class="input-icon uil uil-lock-alt"></i>
                                                        </div>
                                                        <div class="form-group mt-2">
                                                            <input type="file" name="photo" class="form-style" placeholder="Choose Photo" id="photo" autocomplete="off">
                                                            <i class="input-icon uil uil-image-plus"></i>
                                                        </div>
                                                        <!--<a href="#" class="btn mt-4" style="background-color: white;">register</a>-->
                                                        <g:actionSubmit value="signup" class="btn mt-4" style="background-color: white;"/>
                                                    </g:form>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--######################################################-->
    </div>

</div>
</body>
</html>