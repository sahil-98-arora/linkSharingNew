<div class="card">
    <div class="card-header">Trending Topics
        <a href="#" style="float: inline-end;"></a>
    </div>
    <div class="card-body " >
%{--        ${trendT}--}%
        <g:each in="${trendT}" var="num">
            <div class="postImage">
                <g:img dir="images/profilePic" class="pImage" file='${num.users.photo}' alt="Missing Image" />
            </div>
            <div class="postContent">
                <p>
%{--                    <a href="#"> ${num.topicName} </a><br>--}%
                    <g:link controller="topic" action="topicShow" params="${[topicName: num.topicName, topicId:num.id]}">${num.topicName}</g:link><br>
                    <span style="color: gray;">@${num.users.userName}</span>

                    <a style="float: inline-end;" class="subscribe${num.id}" onclick="subscribe(${num.id})">Subscribe</a>
                    <a style="float: inline-end;" class="Unsubscribe${num.id}" onclick="unsubscribe(${num.id})"></a>
                    <br>
                    <span style="float: left; margin-right: 50px;">
                        Subscriptions <br> 500
                    </span>
                    <span>
                        Posts <br> 500
                    </span>
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
            url: "http://localhost:8081/subscription/subscribeTheTopics",
            data: {"topicId" : id}, //$("#topicName").val() },
            success: function (){
                //$(".subscribe" + id).text("Unsubscribe");
                $(".subscribe" + id).hide();
                $(".Unsubscribe" + id).text("Unsubscribe");

            }
        });
    };
    function unsubscribe(id){
        $.ajax({
            type: 'post',
            url: "http://localhost:8081/subscription/unsubscribeTheTopic",
            data: {"topicId" : id}, //$("#topicName").val() },
            success: function (){
                //$(".subscribe" + id).text("Unsubscribe");
                $(".subscribe" + id).show("subscribe");
                $(".Unsubscribe" + id).hide();

            }
        });
    };
</script>