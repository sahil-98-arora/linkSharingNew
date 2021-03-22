<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Topic show</title>

    <g:external dir="stylesheets" file="topicshow.css"></g:external>

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
        <span style="color: yellow; font-weight: 800; font-size: 25px;">Topic Show</span>
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
                -->
                <i class="fas fa-link fa-2x" data-toggle="modal" data-target="#myModal3"></i>&nbsp;&nbsp;
                <i class="far fa-plus-square fa-2x" data-toggle="modal" data-target="#myModal4"></i>&nbsp;&nbsp;
            </span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div style="float: inline-end; ">
                <a class="dash_links nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 20px">
                    <i class="dash_links fas fa-user fa-1x"></i> ${session.user.firstName} </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
                    <g:link controller="user" action="profile" class="dropdown-item">Profile</g:link>
                    <g:link controller="user" action="logout" class="dropdown-item">Logout</g:link>
                </div>
            </div>


        </form>
    </div>
</nav>
<!--###########################################-->



<!--###########################################-->
<!--             The Modal Links               -->

<!--      ---------Create topic----------      -->
<div class="modal fade" id="myModal1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Create Topic</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form class="form" action="/action_page.php">
                    <label for="name"></label>Name:</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter Name" name="link">
                    <br>
                    <label> Visibility :   </label>
                    <select>
                        <option value = "visibility">Public</option>
                    </select>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" data-dismiss="modal">Save</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!--      ---------Send invitaion----------      -->
<div class="modal fade" id="myModal2">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Send Invitation</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form class="form" action="/action_page.php">
                    <label for="email"></label>Email:</label>
                    <input type="text" class="form-control" id="email" placeholder="Enter Email" name="link">
                    <br>
                    <label> Topic:   </label>
                    <select>
                        <option value = "topicid">Topic</option>
                    </select>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Invite</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!--      ---------Create resource/share document----------      -->
<div class="modal fade" id="myModal3">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Create Resource - Share Document</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form class="form" action="/action_page.php">
                    <label for="document"></label>Document:</label>
                    <input type="file" class="form-control" id="document"  name="document">
                    <br>
                    <label for="description">Description</label>
                    <textarea rows="2" cols="45" name="description" placeholder="Enter description here"></textarea>
                    <br><br>
                    <label> Topic:  </label>
                    <select>
                        <option value = "topicid"> topic </option>
                    </select>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Share</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!--      ---------Create resource/share link----------      -->
<div class="modal fade" id="myModal4">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Create Resource - Share Link</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form class="form" action="/action_page.php">
                    <label for="link"></label>Link:</label>
                    <input type="text" class="form-control" id="link" placeholder="Enter Link" name="link">
                    <br>
                    <label for="description">Description</label>
                    <textarea rows="2" cols="45" name="description" placeholder="Enter description here"></textarea>
                    <br><br>
                    <label> Topic:  </label>
                    <select>
                        <option value = "topicid"> topic </option>
                    </select>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Share</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



<!--################################################-->
<!--                    BODY                        -->
<div style="margin-left: 50px; margin-top: 20px;">
    <div style="float: left; width: 450px; margin-right: 20px; ">


        <!--                ----TOPIC card----                    -->
        <div class="container" style="filter: drop-shadow(0 0 2px #333);">
            <div class="card">
                <div class="card-header">Topic : <span style="font-weight: 700; font-size: 20px">${topic.topicName}</span>

                </div>
                <div class="card-body">
                    <div class="postImage">
                        <g:link controller="user" action="userProfile" params="${[userId: topic.users.id]}">
                            <g:img dir="images/profilePic" class="pImage" file='${topic.users.photo}' alt="Missing Image" />
                        </g:link>

                    </div>
                    <div class="postContent">
                        <p>
                            <a href="#"> ${topic.topicName} </a>&nbsp; <span style="float: right">${topic.visibility}</span><br>
                            <span style="color: gray;">
                                <g:link controller="user" action="userProfile" params="${[userId: topic.users.id]}">
                                    @${topic.users.userName}
                                </g:link>
                            </span>
                            <a href="#" style="float: inline-end;">Subscribe/Unsubscriibe</a>
                            <br>
                            <a style="float: inline-end;" href="#"></a>
                                <div style="margin-top: -10px">
                                    <div style="float: left; margin-right: 50px; margin-left: 20px">
                                        Subscriptions<br>
                                        <ct:subscriptionCount userId="${topic.users.id}"></ct:subscriptionCount>
                                    </div>
                                    <div>
                                        Posts<br>
                                        <ct:resourceCount topicId="${topic.id}"></ct:resourceCount>
                                    </div>
                                </div>

                        </p>
                        <span style="float: inline-end; display: inline-flex">
                            <select>
                                <option value = "serious" selected> serious</option>
                                <option value = "casual"> casual</option>
                                <option value = "veryserious"> Very serious</option>
                            </select>
                            &nbsp;&nbsp;
                            <i class="far fa-envelope fa-2x"></i>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <!--                ----TOPIC card----                    -->


        <br>


        <!--                ----Users of this topic card----                    -->
        <div class="container">
            <div class="card">
                <div class="card-header">Users / Subscribers of : "<span style="font-weight: 700; font-size: 20px">${topic.topicName}</span>"
                    <a href="#" style="float: inline-end;"></a>
                </div>
                <div class="card-body">
                    <g:each in="${subscribers}" var="thisUser">
                    <div class="postImage">
                        <g:link controller="user" action="userProfile" params="${[userId: thisUser.user.id]}">
                            <g:img dir="images/profilePic" class="pImage" file='${thisUser.user.photo}' alt="Missing Image" />
                        </g:link>
                    </div>
                    <div class="postContent">
                        <p>
                            <span style="font-size: 20px;"> ${thisUser.user.firstName} ${thisUser.user.lastName} </span><br>

                            <span style="color: gray;">
                                <g:link controller="user" action="userProfile" params="${[userId: thisUser.user.id]}">
                                    @${thisUser.user.userName}
                                </g:link>
                            </span>
                            <br>
                        <div style="margin-top: -10px">
                            <div style="float: left; margin-right: 50px; margin-left: 10px">
                                Subscriptions<br>
                                <ct:subscriptionCount userId="${thisUser.user.id}"></ct:subscriptionCount>
                            </div>
                            <div>
                                Topics<br>
                                <ct:topicCount userId="${thisUser.user.id}"></ct:topicCount>
                            </div>
                        </div>
                        </p>
                        <hr>
                    </div>
                </g:each>
                </div>
            </div>
        </div>
        <!--                ----Users of this topic card----                    -->
        <br>
    </div>



    <!--                ----All posts of the current Topic card----                    -->
    <div class="container" style="width: 1500px;">
        <div class="card">
            <div class="card-header"><span style="line-height: 30px; font-size: 20px; font-weight: 900;">Posts : "${topic.topicName}"</span>
                <a href="#" style="float: inline-end;"></a>
                <span class="input-group" style="float: inline-end;">
                    <input type="text" class="form-control" placeholder="Search" name="search" style="float: left;">
                    <button class="btn btn-success" type="submit">Search</button>
                </span>
            </div>

            <g:render template="/topic/allPosts"/>
        </div>
    </div>
    <!--                ----All posts of the current Topic card----                    -->

</div>



</body>
</html>