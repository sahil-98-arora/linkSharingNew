<div class="card-body">
<g:each in="${trendT}" var="num">
    <div class="postImage">
        <g:img dir="images" class="pImage" file='missing-image.jpg' alt="Missing Image" />
    </div>
    <div class="postContent">
        <p>
            <a href="#"> ${num.topicName} </a><br>
            <span style="color: gray;">@Username</span>
            <a style="float: inline-end;" href="#">Subscribe/Unsubscriibe</a>
            <br>
            <span style="float: left; margin-right: 50px;">
                Subscriptions <br> 500
            </span>
            <span>
                Topics <br> 500
            </span>
        </p>
        <hr>
    </div>
</g:each>
</div>