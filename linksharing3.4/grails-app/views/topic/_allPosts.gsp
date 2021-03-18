<div class="card-body">
    <g:if test="${postsOfTopic}">
    <g:each in="${postsOfTopic}" var="post">
    <div class="postImage">
        <g:link controller="user" action="userProfile" params="${[userId: post.createdBy.id]}">
            <g:img dir="images/profilePic" class="pImage" file='${post.createdBy.photo}' alt="Missing Image" />
        </g:link>
    </div>
    <div class="postContent">
        <p>
            ${post.createdBy.firstName} ${post.createdBy.lastName}
            <span style="color: gray;">
                <g:link controller="user" action="userProfile" params="${[userId: post.createdBy.id]}">@${post.createdBy.userName}</g:link>
                <span style="float: right">
                    ${post.dateCreated}
                </span>
            </span>
            <br>
            " ${post.description} "
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Et, exercitationem. Error sit eveniet ut libero itaque praesentium recu
            <br>
            <i class="fab fa-facebook-square fa-2x" ></i>&nbsp;
            <i class="fab fa-twitter-square fa-2x"></i>&nbsp;
            <i class="fab fa-google-plus-g fa-2x"></i>&nbsp;
            <span style="float: inline-end;">
                <a href="${subs?.documentResources?.filePath}" download="${subs?.documentResources?.filePath}">Download</a>&nbsp;&nbsp;&nbsp;
                <a href="${subs?.linkResource?.url}">View Full Site</a>&nbsp;&nbsp;&nbsp;
                <a href="#">Mark as Read</a>&nbsp;&nbsp;&nbsp;
                <g:link controller="topic" action="postShow" params="${[postId: post.id]}">View Post</g:link>
            </span>
        </p>

        <hr>
    </div>
    </g:each>
    </g:if>
    <g:else>
        <div style="text-align: center">Currently no posts on this topic. Be the first one ...</div>
    </g:else>
</div>