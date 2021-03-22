<div class="card" >
    <div class="card-header">Subscriptions
        <a href="#" style="float: inline-end;">View All</a>
    </div>
    <div style="overflow-x: scroll; height: 500px">
    <g:each in="${subsList}" var="subTopic">
        <div class="card-body card${subTopic.topic.id}">

            <div class="postImage">
                <g:link controller="user" action="userProfile" params="${[userId: subTopic.topic.users.id]}">
                    <g:img dir="images/profilePic" class="pImage" file='${subTopic.topic.users.photo}' alt="Missing Image" />
                </g:link>
            </div>
            <div class="postContent">
                <p>
                    <g:link controller="topic" action="topicShow" params="${[topicName: subTopic.topic.topicName, topicId:subTopic.topic.id]}">${subTopic.topic.topicName}</g:link>
                    <br>
                    <span style="color: gray;">@${subTopic.topic.users.userName}</span>
                    <a style="float: inline-end;" onclick="myfunction3(${subTopic.topic.id})">Unsubscriibe</a>
                    <br>
                    <div style="margin-top: -10px; margin-bottom: -20px">
                        <div style="float: left; margin-right: 50px; margin-left: 20px">
                            Subscriptions<br>
                            <ct:subscriptionCount userId="${subTopic.topic.users.id}"></ct:subscriptionCount>
                        </div>
                        <div>
                            Posts<br>
                            <ct:resourceCount topicId="${subTopic.topic.id}"></ct:resourceCount>
                        </div>
                    </div>
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
            <br>
        </div>
        </g:each>

%{--            <g:each in="${subsList}" var="subTopic">--}%
%{--                <div class="card-body card${subTopic.id}">--}%
%{--                    <div class="postImage">--}%
%{--                        <g:link controller="user" action="userProfile" params="${[userId: subTopic.users.id]}">--}%
%{--                            <g:img dir="images/profilePic" class="pImage" file='${subTopic.users.photo}' alt="Missing Image" />--}%
%{--                        </g:link>--}%
%{--                    </div>--}%
%{--                    <div class="postContent">--}%
%{--                        <p>--}%
%{--                            <g:link controller="topic" action="topicShow" params="${[topicName: subTopic.topicName, topicId:subTopic.id]}">${subTopic.topicName}</g:link>--}%
%{--                            <br>--}%
%{--                            <span style="color: gray;">@${subTopic.users.userName}</span>--}%
%{--                            <a style="float: inline-end;" onclick="myfunction3(${subTopic.id})">Unsubscriibe</a>--}%
%{--                            <br>--}%
%{--                            <div style="margin-top: -10px; margin-bottom: -20px">--}%
%{--                                <div style="float: left; margin-right: 50px; margin-left: 20px">--}%
%{--                                    Subscriptions<br>--}%
%{--                                    <ct:subscriptionCount userId="${subTopic.users.id}"></ct:subscriptionCount>--}%
%{--                                </div>--}%
%{--                                <div>--}%
%{--                                    Posts<br>--}%
%{--                                    <ct:resourceCount topicId="${subTopic.id}"></ct:resourceCount>--}%
%{--                                </div>--}%
%{--                            </div>--}%
%{--                        </p>--}%
%{--                        <p style="float: inline-end;">--}%
%{--                            <select>--}%
%{--                                <option value = "serious" selected> serious</option>--}%
%{--                                <option value = "casual"> casual</option>--}%
%{--                                <option value = "veryserious"> Very serious</option>--}%
%{--                            </select>--}%
%{--                            &nbsp;&nbsp;--}%
%{--                            <i class="far fa-envelope fa-2x"></i>--}%
%{--                        </p>--}%
%{--                    </div>--}%
%{--                    <br>--}%
%{--                </div>--}%
%{--                </g:each>--}%
    </div>
</div>


<script>
    function myfunction3(id){
        $.ajax({
            type: 'post',
            url: "http://localhost:8091/subscription/allSubs",
            data: {"topicId" : id},
            success: function (){
                $(".card" + id).hide('slow');
            }
        });
    };
</script>