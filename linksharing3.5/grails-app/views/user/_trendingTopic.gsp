<div class="card">
    <div class="card-header">Trending Topics
        <a href="#" style="float: inline-end;"></a>
    </div>
    <div class="card-body" style="overflow-x: scroll; height: 400px">
%{--        ${trendT}--}%
        <g:each in="${trendT}" var="num">
            <div class="postImage">
                <g:link controller="user" action="userProfile" params="${[userId: num.users.id]}">
                    <g:img dir="images/profilePic" class="pImage" file='${num.users.photo}' alt="Missing Image" />
                </g:link>
            </div>
            <div class="postContent">
                <p>
%{--                    <a href="#"> ${num.topicName} </a><br>--}%
                    <g:link controller="topic" action="topicShow" params="${[topicName: num.topicName, topicId:num.id]}" style="font-weight: 800;">${num.topicName}</g:link><br>
                    <span style="color: gray;">
                        <g:link controller="user" action="userProfile" params="${[userId: num.users.id]}">
                            @${num.users.userName}
                        </g:link>
                    </span>
%{--            //////////////////////////////////////////////////////////////////////--}%
            <g:if test="${((subsList.user.id).contains(session.user.id))&&((subsList.topic.id).contains(num.id))}">
                <a style="float: inline-end;" class="Unsubscribe${num.id}" onclick="unsubscribe(${num.id})">Unsubscribe</a>
            </g:if>
            <g:else>
                <a style="float: inline-end;" class="subscribe${num.id}" onclick="subscribe(${num.id})">Subscribe</a>
            </g:else>
        %{--     //////////////////////////////////////////////////////////////////////--}%


                    <br>
            <div style="margin-top: -10px; margin-bottom: -20px">
                <div style="float: left; margin-right: 50px; margin-left: 20px">
                    Subscriptions<br>
                    <ct:subscriptionCount userId="${num.users.id}"></ct:subscriptionCount>
                </div>
                <div>
                    Posts<br>
                    <ct:resourceCount topicId="${num.id}"></ct:resourceCount>
                </div>
                <br>
            </div>
                </p>
                <hr>
            </div>
        </g:each>
    </div>
</div>

<script>
    function subscribe(id){
        $.ajax({
            type: 'post',
            url: "http://localhost:8091/subscription/subscribeTheTopics",
            data: {"topicId" : id}, //$("#topicName").val() },
            success: function (){
                // //$(".subscribe" + id).text("Unsubscribe");
                // $(".subscribe" + id).hide();
                // $(".Unsubscribe" + id).text("Unsubscribe");
                location.reload(true);

            }
        });
    };
    function unsubscribe(id){
        $.ajax({
            type: 'post',
            url: "http://localhost:8091/subscription/unsubscribeTheTopic",
            data: {"topicId" : id}, //$("#topicName").val() },
            success: function (){
                // //$(".subscribe" + id).text("Unsubscribe");
                // $(".subscribe" + id).show("subscribe");
                // $(".Unsubscribe" + id).hide();
                location.reload(true);

            }
        });
    };
</script>