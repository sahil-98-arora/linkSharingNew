
    <div class="card-body" >
    <g:if test="${postsOfTopic}">
        <g:each in="${postsOfTopic}" var="post">
        <div class="postImage" >
            <g:img dir="images/profilePic" class="pImage" file='${post.createdBy.photo}' alt="Missing Image" />
        </div>
        <div class="postContent">
            <p>
                ${post.createdBy.firstName} ${post.createdBy.lastName} <span style="color: gray;">@${post.createdBy.userName} <a style="float: inline-end;" href="#"> ${post.topic.topicName} </a></span>
                <br><span>${post.dateCreated}</span>

            </p>
            <p>
                ${post.description}
            </p>
            <p>
                <i class="fab fa-facebook-square fa-2x" ></i>&nbsp;
                <i class="fab fa-twitter-square fa-2x"></i>&nbsp;
                <i class="fab fa-google-plus-g fa-2x"></i>&nbsp;

                <a style="float: inline-end;" href="#">View Post </a>
            </p>
            <hr>
        </g:each>
        </g:if>
    <g:else>
        <div style="text-align: center">No posts available. Add posts ...</div>
    </g:else>
        </div>
    </div>

