<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POST</title>

    <g:external dir="stylesheets" file="post.css"></g:external>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://kit.fontawesome.com/a390992c2b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

</head>
<body>

<!--###########################################-->
<!--                 NAVBAR                    -->
<nav class="navbar navbar-inverse navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <g:if test="${session.user}">
        <div class="navbar-header">
            <g:link controller="user" action="dashboard" style="font-weight: 1000;" class="navbar-brand">Link Sharing</g:link>
        </div>
        </g:if>
        <g:else>
            <div class="navbar-header">
                <g:link style="font-weight: 1000;" class="navbar-brand">Link Sharing</g:link>
            </div>
        </g:else>
        <!---->
        <span style="color: yellow; font-weight: 800; font-size: 25px;">Post Show</span>
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
                <g:if test="${session.user}">
                <i class="fas fa-link fa-2x" data-toggle="modal" data-target="#myModal3"></i>&nbsp;&nbsp;
                <i class="far fa-plus-square fa-2x" data-toggle="modal" data-target="#myModal4"></i>&nbsp;&nbsp;
                </g:if>
            </span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div style="float: inline-end; ">
                <g:if test="${session.user}">
                <a class="dash_links nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 20px">
                    <i class="dash_links fas fa-user fa-1x"></i> ${session.user.firstName} </a>
                <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
                    <g:link controller="user" action="profile" class="dropdown-item">Profile</g:link>
                    <g:link controller="user" action="logout" class="dropdown-item">Logout</g:link>
                </div>
                </g:if>
                <g:else>
                    <g:link controller="user" action="signup" class="dropdown-item">SignUp</g:link>
                </g:else>
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
    <div style="float: left; width: 700px; margin-right: 20px; ">



        <!--                ----Inbox card----                    -->
        <div class="container" style="width: 700px; filter: drop-shadow(0 0 4px #333);">
            <div class="card" id="#postcard1">
%{--                <div class="card-header">Inbox--}%
%{--                    <a href="#" style="float: inline-end;"></a>--}%
%{--                </div>--}%
                <div class="card-body">
                    <div class="postImage">
                        <g:link controller="user" action="userProfile" params="${[userId: thisPost.createdBy.id]}">
                            <g:img dir="images/profilePic" class="pImage" file='${thisPost.createdBy.photo}' alt="Missing Image" />
                        </g:link>
                    </div>
                    <div class="postContent">
                        <p style="font-size: 18px;">
                            ${thisPost.createdBy.firstName} ${thisPost.createdBy.lastName}
                            <span style="color: gray;">
                                <g:link controller="user" action="userProfile" params="${[userId: thisPost.createdBy.id]}">
                                    @${thisPost.createdBy.userName}
                                </g:link>
                            </span>
                            <g:link controller="topic" action="topicShow" params="${[topicName: thisPost.topic.id,topicId: thisPost.topic.id]}" style="float: inline-end;  font-weight: 900;">${thisPost.topic.topicName}</g:link>

                            <br>
                        <p>
                            <div id="rateYo" style="margin-left: 80px;"></div>
%{--                            <span class="fa fa-star checked"></span>--}%
%{--                            <span class="fa fa-star checked"></span>--}%
%{--                            <span class="fa fa-star checked"></span>--}%
%{--                            <span class="fa fa-star"></span>--}%
%{--                            <span class="fa fa-star"></span>--}%

                            <span style="color: gray; float: inline-end;">${thisPost.dateCreated}</span>
                        </p>
                        <br>
                        ${thisPost.description}<br>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Doloremque soluta, error natus dolorem iusto pariatur iste ipsa et suscipit odio reiciendis? Et iste dolor aliquid veniam vero! Accusantium, tempora nesciunt.
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Porro soluta reiciendis placeat nesciunt numquam, accusantium tenetur architecto eligendi, labore sapiente tempora? Earum animi placeat odio modi dolorem, numquam in voluptatibus.
                        <br>
                        <br>
                        <i class="fab fa-facebook-square fa-2x" ></i>&nbsp;
                        <i class="fab fa-twitter-square fa-2x"></i>&nbsp;
                        <i class="fab fa-google-plus-g fa-2x"></i>&nbsp;
                        <span style="float: inline-end;">
                            <g:if test="${thisPost.createdBy.id == session.user.id}">
                                <a href="" style="color: red" onclick="myfunction3(${thisPost.id})">Delete</a>&nbsp;&nbsp;&nbsp;
                                <a href="">Edit</a>&nbsp;&nbsp;&nbsp;
                            </g:if>
                            <g:if test="${session.user.admin == true}">
                                <a href="" style="color: red" onclick="myfunction3(${thisPost.id})">Delete</a>&nbsp;&nbsp;&nbsp;
                                <a href="">Edit</a>&nbsp;&nbsp;&nbsp;
                            </g:if>

                        <g:if test="${thisPost?.documentResources.filePath[0]}">
                                <g:link url="${thisPost?.documentResources.filePath[0]}">Download</g:link>&nbsp;&nbsp;&nbsp;
                            </g:if>
                            <g:if test="${thisPost?.linkResource.url[0]}">
                                <a href="http://${thisPost?.linkResource.url[0]}" target="_blank">View Full Site</a>&nbsp;&nbsp;&nbsp;
                            </g:if>

                        </span>
                    </p>
                    </div>
                </div>
            </div>
        </div>
        <!--                ----inbox card----                    -->

        <br>
    </div>

    <!--                ----Trending card----                    -->
    <div class="container">
        <g:render template="/user/trendingTopic"/>
    </div>
    <!--                ----Trending card----                    -->



</div>

<script>
    function myfunction3(id){
        $.ajax({
            method: 'post',
            url: "http://localhost:8091/resource/allResources",
            data: {"resourceId" : id}, //$("#topicName").val() },
            success: function (){
                alert("hello")
                $("#postcard1").hide('slow');
                //alert("working");
            }
        });
    };


    $(function () {

        $("#rateYo").rateYo({
            starWidth: "20px",
            rating    : 1.6,
            spacing   : "5px",
            multiColor: {

                "startColor": "#FF0000", //RED
                "endColor"  : "#00FF00"  //GREEN
            }
        });

    });
</script>


</body>
</html>