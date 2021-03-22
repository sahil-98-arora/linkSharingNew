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

<g:if test="${session.user == NULL}">
    <div class="container">
        <div class="center" style="text-align: center; margin-top: 100px;">
            <h1 style="font-size: 50px;">Page Not Found</h1>
            <hr>
            <g:link controller="user" action="signup" style="font-size: 30px;">Back to Homepage</g:link>
        </div>
    </div>
</g:if>

<g:else>
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
            <div class="container" style="filter: drop-shadow(0 0 4px orange);">
                <div class="card" style="border: 2px solid rgb(255, 166, 0);">
                    <div class="card-body" style="padding: 2%;">
                        <div class="postImage" style="width: 100px; height: 100px; margin-right: 10px; margin-top: 10px;">
                            <g:link controller="user" action="userProfile" params="${[userId: session.user.id]}">
                                <g:img dir="images/profilePic" class="pImage" file='${session.user.photo}' alt="Missing Image" />
                            </g:link>
                        </div>
                        <div class="postContent">
                            <p>
                                <span style="font-size: 25px;">${session.user.firstName} ${session.user.lastName}</span><br>
                                <span style="color: gray;">
                                    <g:link controller="user" action="userProfile" params="${[userId: session.user.id]}">
                                        @${session.user.userName}
                                    </g:link>
                                </span>
                                <span style="color: gray; float: inline-end;">${session.user.email}</span><br>
                                <div style="margin-top: -10px">
                                    <div style="float: left; margin-right: 50px; margin-left: 10px">
                                        Subscriptions<br>
                                        <ct:subscriptionCount userId="${session.user.id}"></ct:subscriptionCount>
                                    </div>
                                    <div>
                                        Topics<br>
                                        <ct:topicCount userId="${session.user.id}"></ct:topicCount>
                                    </div>
                                </div>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!--                ----USER card----                    -->


            <br>


            <!--                ----Topics created by user card----                    -->
            <div class="container">

                    <g:render template="topicsCreated"/>
            </div>
            <!--                ----Topics created by user card----                    -->

            <br>
        </div>



        <!--                ----Profile card----                    -->
        <div class="container">
        <g:if test="${flash.messageUpdateDetails}">
            <div style="text-align: center"><span class="message" style="display: block; color: limegreen; margin-left: 140px; font-weight: 800">${flash.messageUpdateDetails}</span></div>
        </g:if>
        <g:if test="${flash.errorUpdateDetails}">
            <div style="text-align: center"><span class="alert alert-error" style="display: block; color: red; margin-left: 140px; font-weight: 800">${flash.errorUpdateDetails}</span></div>
        </g:if>
            <div class="card">
                <div class="card-header">Profile
                    <a href="#" style="float: inline-end;"></a>
                </div>
                <div class="card-body">

%{--                    <form>--}%
                    <g:form controller="User" action="updateDetails" method="POST" update="allTheMessages" name="updateDetails" enctype="multipart/form-data">
                        <div class="form-group row">
                            <label for="firstName" class="col-sm-2 col-form-label">Firstname</label>
                            <div class="col-sm-10">
                                <input type="text" name="firstName" class="form-control" id="firstName" placeholder="Firstname" value="${session.user.firstName}" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="lastName" class="col-sm-2 col-form-label">Lastname</label>
                            <div class="col-sm-10">
                                <input type="text" name="lastName" class="form-control" id="lastName" placeholder="Lastname" value="${session.user.lastName}" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="userName" class="col-sm-2 col-form-label">Username</label>
                            <div class="col-sm-10">
                                <input type="text" name="userName" class="form-control" id="userName" placeholder="Username" value="${session.user.userName}" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="photo" class="col-sm-2 col-form-label">Photo</label>
                            <div class="col-sm-10">
                                <input type="file" class="form-control" name="photo" id="photo" required>
                            </div>
                        </div>
                        <g:hiddenField name="id" value="${session.user.id}"></g:hiddenField>
                        <div class="form-group row">
                            <div class="col-sm-10">
%{--                                <button type="submit" class="btn btn-primary">Update</button>--}%
                                <g:actionSubmit action="updateDetails" value="Update" class="btn btn-primary"></g:actionSubmit>
                            </div>

                        </div>

                    </g:form>
%{--                    </form>--}%
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

                    <g:form controller="User" action="updatePassword" method="POST" update="allTheMessages" name="updatePassword">
                        <div class="form-group row">
                            <label for="password" class="col-sm-2 col-form-label">Password</label>
                            <div class="col-sm-10">
                                <input type="password" name="password" class="form-control" id="password" placeholder="Password" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="confirmPassword" class="col-sm-2 col-form-label">Confirm Password</label>
                            <div class="col-sm-10">
                                <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" placeholder="Confirm Password" required>
                            </div>
                        </div>
                        <g:hiddenField name="id" value="${session.user.id}"></g:hiddenField>
                        <div class="form-group row">
                            <div class="col-sm-10">
                                <g:actionSubmit action="updatePassword" value="Update" class="btn btn-primary"></g:actionSubmit>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
        <!--                ----Chaange Password card----                    -->

        <br><br>
    </div>




</g:else>

</body>
</html>