<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>


    <g:external dir="stylesheets" file="dashboard.css"></g:external>
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
            <g:link controller="user" action="signup" style="font-size: 30px">Back to Homepage</g:link>
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
                <span style="color: yellow; font-weight: 800; font-size: 25px;">Dashboard</span>
                <!---->

                <form class="navbar-form form-inline navbar-right" action="/action_page.php">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search" name="search">
                        <button class="btn btn-success" type="submit">Search</button>
                    </div>
                    &nbsp;&nbsp;

                <span class="dash_links">
                    <i class="fas fa-comment fa-2x" data-toggle="modal" data-target="#myModal1"></i>&nbsp;&nbsp;
                    <i class="far fa-envelope fa-2x" data-toggle="modal" data-target="#myModal2"></i>&nbsp;&nbsp;
                    <i class="fas fa-link fa-2x" data-toggle="modal" data-target="#myModal3"></i>&nbsp;&nbsp;
                    <i class="far fa-plus-square fa-2x" data-toggle="modal" data-target="#myModal4"></i>&nbsp;&nbsp;
                </span>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div style="float: inline-end; ">
                    <a class="dash_links_ nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 20px">
                        <g:if test="${session.user}">
                        <i class="dash_links_ fas fa-user fa-1x"></i>&nbsp;&nbsp;${session.user.firstName}</a>
                        </g:if>
                        <g:else>
                            <i class="dash_links_ fas fa-user fa-1x"></i>&nbsp;&nbsp; Guest</a>
                        </g:else>
                            <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
                                <g:link controller="user" action="profile" class="dropdown-item">Profile</g:link>
                                <g:link controller="user" action="admin" class="dropdown-item">Users</g:link>
                                <g:link controller="topic" action="allTopics" class="dropdown-item">Topics</g:link>
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


                <g:render template="/topic/addNewTopic" />


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


                <!--                ----USER card----                    -->
                <div class="container">

                <g:if test="${flash.messageTopicCreated}">
                    <div style="text-align: center"><span class="message" style="display: block; color: limegreen; margin-left: 10px; font-weight: 800; margin-bottom: 10px">${flash.messageTopicCreated}</span></div>
                </g:if>
                <g:if test="${flash.errorTopicCreated}">
                    <div style="text-align: center"><span class="alert alert-error" style="display: block; color: red; margin-left: 10px;margin-bottom: 10px; font-weight: 800">${flash.errorTopicCreated}</span></div>
                </g:if>

                    <div class="card" style="border: 2px solid rgb(255, 166, 0);">
                        <div class="card-body" style="padding: 2%;">
                            <div class="postImage" style="width: 100px; height: 100px; margin-right: 10px; margin-top: 10px;">
                                <g:img dir="images" class="pImage" file='missing-image.jpg' alt="Missing Image" />
                            </div>
                            <div class="postContent">
                                <p>
                                    <span style="font-size: 25px;">${session.user.firstName} ${session.user.lastName}</span><br>
                                    <span style="color: gray;">@ ${session.user.userName}</span><br>
                                    <span style="float: left; margin-right: 50px; display: inline-flex">
                                        <g:link controller="topic" action="" class="dropdown-item">Subscriptions</g:link>
                                        <g:link controller="topic" action="myTopics" class="dropdown-item">Topics</g:link>
                                    </span>

                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!--                ----USER card----                    -->


                <br>


                <!--                ----Subscription card----                    -->
                <div class="container">
                    <div class="card">
                        <div class="card-header">Subscriptions
                            <a href="#" style="float: inline-end;">View All</a>
                        </div>
                        <div class="card-body">
                            <div class="postImage">
                                <g:img dir="images" class="pImage" file='missing-image.jpg' alt="Missing Image" />
                            </div>
                            <div class="postContent">
                                <p>
                                    <a href="#"> Topic </a><br>
                                    <span style="color: gray;">@Username</span>
                                    <a style="float: inline-end;" href="#">Unsubscriibe</a>
                                    <br>
                                    <span style="float: left; margin-right: 50px;">
                                        Subscriptions <br> 500 </span>
                                    <span>Topics <br> 500 </span>
                                </p>
                                <p style="float: inline-end;">
                                    <select>
                                        <option value = "serious" selected> serious</option>
                                        <option value = "casual"> casual</option>
                                        <option value = "veryserious"> Very serious</option>
                                    </select>
                                    &nbsp;&nbsp;
                                    <i class="far fa-envelope fa-2x"></i>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!--                ----Subscription card----                    -->


                <br>


                <!--                ----Trending card----                    -->
                <div class="container">
                    <div class="card">
                        <div class="card-header">Trending Topics
                            <a href="#" style="float: inline-end;"></a>
                        </div>
%{--                        <div class="card-body">--}%
%{--                            <div class="postImage">--}%
%{--                                <g:img dir="images" class="pImage" file='missing-image.jpg' alt="Missing Image" />--}%
%{--                            </div>--}%
%{--                            <div class="postContent">--}%
%{--                                <p>--}%
%{--                                    <a href="#"> Topic </a><br>--}%
%{--                                    <span style="color: gray;">@Username</span>--}%
%{--                                    <a style="float: inline-end;" href="#">Subscribe/Unsubscriibe</a>--}%
%{--                                    <br>--}%
%{--                                    <span style="float: left; margin-right: 50px;">--}%
%{--                                        Subscriptions <br> 500--}%
%{--                                    </span>--}%
%{--                                    <span>--}%
%{--                                        Topics <br> 500--}%
%{--                                    </span>--}%
%{--                                </p>--}%
%{--                                <hr>--}%
%{--                            </div>--}%
%{--                        </div>--}%
                        <g:render template="/topic/trendingTopic"/>
                    </div>
                </div>
                <!--                ----Trending card----                    -->
                <br>
            </div>



            <!--                ----Inbox card----                    -->
            <div class="container" style="width: 1500px;">
                <div class="card">
                    <div class="card-header">Inbox
                        <a href="#" style="float: inline-end;"></a>
                    </div>
                    <div class="card-body">
                        <div class="postImage">
                            <g:img dir="images" class="pImage" file='missing-image.jpg' alt="Missing Image" />
                        </div>
                        <div class="postContent">
                            <p>
                                Name <span style="color: gray;">@Username Time</span>
                                <a style="float: inline-end;" href="#"> Topic </a>
                                <br>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Et, exercitationem. Error sit eveniet ut libero itaque praesentium recu
                                <br>
                                <i class="fab fa-facebook-square fa-2x" ></i>&nbsp;
                                <i class="fab fa-twitter-square fa-2x"></i>&nbsp;
                                <i class="fab fa-google-plus-g fa-2x"></i>&nbsp;
                                <span style="float: inline-end;">
                                    <a href="#">Download</a>&nbsp;&nbsp;&nbsp;
                                    <a href="#">View Full Site</a>&nbsp;&nbsp;&nbsp;
                                    <a href="#">Mark as Read</a>&nbsp;&nbsp;&nbsp;
                                    <a href="#">View Post </a>
                                </span>
                            </p>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
            <!--                ----inbox card----                    -->

        </div>
    </g:else>

</body>
</html>