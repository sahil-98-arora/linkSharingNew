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
            <span style="color: yellow; font-weight: 800; font-size: 25px;">Profile</span>
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
                            <g:link controller="user" action="userProfile" params="${[userId: userProfileData.id]}">
                                <g:img dir="images/profilePic" class="pImage" file='${userProfileData.photo}' alt="Missing Image" />
                            </g:link>
                        </div>
                        <div class="postContent">
                            <p>
                                <span style="font-size: 25px;">${userProfileData.firstName} ${userProfileData.lastName}</span><br>
                                <span style="color: gray;">
                                    <g:link controller="user" action="userProfile" params="${[userId: session.user.id]}">
                                        @${userProfileData.userName}
                                    </g:link>
                                </span>
                                <span style="color: gray; float: inline-end;">${userProfileData.email}</span><br>
                            <div style="margin-top: -10px; margin-bottom: -20px">
                                <div style="float: left; margin-right: 50px; margin-left: 20px">
                                    Subscriptions<br>
                                    <ct:subscriptionCount userId="${userProfileData.id}"></ct:subscriptionCount>
                                </div>
                                <div>
                                    Topics<br>
                                    <ct:topicCount userId="${userProfileData.id}"></ct:topicCount>
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

            <!--                ----Subscription card----                    -->
            <div class="container">
                <div class="card">
                    <div class="card-header">Subscriptions
                        <a href="#" style="float: inline-end;">View All</a>
                    </div>

                    <g:render template="/user/subscriptions"/>
                </div>
            </div>
            <!--                ----Subscription card----      -->
        </div>

        <!--                ----Posts By the userName card----                    -->
        <div class="container" style="width: 1500px;" id="inbox">
            <div class="card">
                <div class="card-header">Posts
                    <a href="#" style="float: inline-end;"></a>
                </div>
                <div class="card-body">
                    <g:if test="${posts}">
                        <g:each in="${posts}" var="post">
%{--                            <div class="postImage">--}%
%{--                                <g:link controller="user" action="userProfile" params="${[userId: post.createdBy.id]}">--}%
%{--                                    <g:img dir="images/profilePic" class="pImage" file='${post.createdBy.photo}' alt="Missing Image" />--}%
%{--                                </g:link>--}%
%{--                            </div>--}%
                            <div class="postContent" style="margin-left: -100px;">
                                <p>

                                    <g:link controller="topic" action="topicShow" params="${[topicName: post.topic.topicName, topicId:post.topic.id]}">
                                        <span style="font-weight: 800">${post.topic.topicName}</span>
                                    </g:link>
                                    <span style="color: gray;">

                                        <span style="float: right;">

                                            <span style="color: gray; font-size: 12px">${post.lastUpdated}</span>
                                        </span>

                                    </span>


                                    <br>
                                    " ${post.description} "
                                    <br>
                                    <span >
                                    <i class="fab fa-facebook-square fa-2x" ></i>&nbsp;
                                    <i class="fab fa-twitter-square fa-2x"></i>&nbsp;
                                    <i class="fab fa-google-plus-g fa-2x"></i>&nbsp;
                                    <span style="float: inline-end;">
                                        <a href="#">Download</a>&nbsp;&nbsp;&nbsp;
                                        <a href="${post.linkResource.url}">View Full Site</a>&nbsp;&nbsp;&nbsp;
                                        <a href="#">Mark as Read</a>&nbsp;&nbsp;&nbsp;
                                    <g:link controller="topic" action="postShow" params="${[postId: post.id]}">View Post</g:link>
                                    </span>
                                    </span>
                                </p>

                                <hr>
                            </div>
                        </g:each>
                    </g:if>
%{--                    <g:else>--}%
%{--                        <div style="text-align: center">Currently no posts by this User. He is an introvert.</div>--}%
%{--                    </g:else>--}%
                </div>
            </div>
        </div>
        </div>
        <!--                ----Posts By the userName card----                    -->



    </div>




</g:else>
</body>
</html>