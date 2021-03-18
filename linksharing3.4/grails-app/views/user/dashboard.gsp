<%@ page import="linksharing3.Topic" %>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                        <input type="text" class="form-control" placeholder="Search" name="search" id="search">
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
                        <g:form controller="resource" action="addDocumentResource" method="POST" enctype="multipart/form-data">
                        <form class="form" action="/action_page.php">
                            <g:hiddenField name="extension" ></g:hiddenField>
                            <label for="document"></label>Document:</label>
                            <input type="file" class="form-control" id="document"  name="filePath">
                            <br>
                            <label for="description">Description</label>
                            <textarea rows="2" cols="45" id="description" name="description" placeholder="Enter description here"></textarea>
                            <br><br>
                            <label> Topic:  </label>
%{--                            <select>--}%
%{--                                <option value = "topicid"> topic </option>--}%
%{--                            </select>--}%
%{--                            <g:select name="topicName" from="${linksharing3.Topic.list().topicName}" class="dropdown-toggle btn btn-default col-sm-8" value="${addedResource?.topicName}"></g:select>--}%
                            <g:select name="topicName" from="${linksharing3.Subscription.findAllByUser(session.user).topic.topicName}" class="dropdown-toggle btn btn-default col-sm-8" value="${addedResource?.topicName}" ></g:select>
                            <br><br>
                            <g:actionSubmit value="share" class="btn btn-primary" style="float: left;" name="addDocumentResource" controller="resource" action="addDocumentResource"/>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: right">Close</button>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>

        <!--      ---------Create resource/share link----------      -->
        <div class="modal fade" id="myModal4">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <g:render template="/resource/linkResource"/>
                </div>
            </div>
        </div>


        <g:if test="${flash.messageLoggedIn}">
            <div style="text-align: center"><span class="message" style="display: block; color: limegreen; font-weight: 900; margin-top: 20px">${flash.messageLoggedIn}</span></div>
        </g:if>


        <!--################################################-->
        <!--                    BODY                        -->
        <div style="margin-left: 50px; margin-top: 20px;">
            <div style="float: left; width: 450px; margin-right: 20px; ">



                <!--                ----USER card----                    -->
                <div class="container" style="filter: drop-shadow(0 0 4px orange);">

                <g:if test="${flash.messageTopicCreated}">
                    <div style="text-align: center"><span class="message" style="display: block; color: limegreen; margin-left: 10px; font-weight: 800; margin-bottom: 10px">${flash.messageTopicCreated}</span></div>
                </g:if>
                <g:if test="${flash.errorTopicCreated}">
                    <div style="text-align: center"><span class="alert alert-error" style="display: block; color: red; margin-left: 10px;margin-bottom: 10px; font-weight: 800">${flash.errorTopicCreated}</span></div>
                </g:if>

                    <div class="card" style="border: 2px solid rgb(255, 166, 0);">
                        <div class="card-body" style="padding: 2%;">
                            <div class="postImage" style="width: 100px; height: 100px; margin-right: 10px; margin-top: 10px;">
                                <g:img dir="images/profilePic" class="pImage" file='${session.user.photo}' alt="Missing Image" />
                            </div>
                            <div class="postContent">
                                <p>
                                    <span style="font-size: 25px;">${session.user.firstName} ${session.user.lastName}</span><br>
                                    <span style="color: gray;">@ ${session.user.userName}</span>
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


                <!--                ----Subscription card----                    -->
                <div class="container">


                        <g:render template="/user/subscriptions"/>

                </div>
                <!--                ----Subscription card----                    -->


                <br>


                <!--                ----Trending card----                    -->
                <div class="container">

                    <g:render template="/user/trendingTopic"/>

                </div>
                <!--                ----Trending card----                    -->
                <br>
            </div>



            <!--                ----Inbox card----                    -->
            <div class="container" style="width: 1500px;" id="inbox">
                <div class="card">
                    <div class="card-header">Inbox
                        <a href="#" style="float: inline-end;"></a>
                    </div>
                        <g:render template="/user/inbox"/>
                </div>
            </div>
            <!--                ----inbox card----                    -->


            <div id="results" style="font-size: 20px; width:700px; margin-left: 500px;">
                <span id="searchOutput">  </span>
            </div>

        </div>
    </g:else>

<script>
    $(document).ready(function(){
       $('#search').keyup(function (){
          var text = $(this).val() ;
          if(text != ''){
              myfunction1(text);
          }
          else{
              $('#results').html('');

          }
       });
    });

    function myfunction1(text){
        $.ajax({
           method: 'post',
           url: "http://localhost:8091/user/search",
           data: {search: $('#search').val()},
           dataType: "JSON",
           success: function (result){
               $('#inbox').hide('slow');
               //$('#results').text(result.topicName + result.resourceDescription);
               $('#results').html('<li class="list-group-item">' + result.topicName +' | <span class="text-muted">' + result.creator +'</span></li>');
               %{--$('#results').html('<li class="list-group-item">' + '<g:link controller="topic" action="topicShow" params="${[topicName: result.topicName, topicId:result.topicId]}">' + result.topicName + '</g:link>' + result.creator +'</span></li>');--}%
               // $.each(result, function(key,value) {
               //     $('#results').text(value.topicName + value.resourceDescription);
               // });


           }
        });
    };
</script>

</body>
</html>