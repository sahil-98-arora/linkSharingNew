<div class="card-body">
    <g:each in="${subsList}" var="subTopic">
    <div class="postImage">
        <g:img dir="images/profilePic" class="pImage" file='${subTopic.topic.users.photo}' alt="Missing Image" />
    </div>
    <div class="postContent">
        <p>
            <g:link controller="topic" action="topicShow" params="${[topicName: subTopic.topic.topicName, topicId:subTopic.topic.id]}">${subTopic.topic.topicName}</g:link>
            <br>
            <span style="color: gray;">@${subTopic.topic.users.userName}</span>
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
        <br>
        <br><hr>
    </g:each>
</div>