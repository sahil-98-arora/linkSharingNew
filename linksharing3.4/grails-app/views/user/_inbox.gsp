<div class="card-body" style="overflow-x: scroll; height: 1000px">
    <g:if test="${subsInbox}">
        <g:each in="${subsInbox}" var="sub">
            <g:each in="${sub.topic.resources}" var="subs">
%{--            ${subs}--}%
            <div class="postImage">
                <g:link controller="user" action="userProfile" params="${[userId: subs.createdBy.id]}">
                    <g:img dir="images/profilePic" class="pImage" file='${subs.createdBy.photo}' alt="Missing Image" />
                </g:link>
            </div>
            <div class="postContent">
                <p>

                    ${subs.createdBy.firstName} ${subs.createdBy.lastName}
                    <span style="color: gray;">
                        <g:link controller="user" action="userProfile" params="${[userId: subs.createdBy.id]}">
                            @${subs.createdBy.userName}
                        </g:link>
                        <span style="float: right;">
                            <g:link controller="topic" action="topicShow" params="${[topicName: subs.topic.topicName, topicId:subs.topic.id]}">
                                <span style="font-weight: 800">${subs.topic.topicName}</span>
                            </g:link>
                            <span style="color: gray; font-size: 12px">${subs.lastUpdated}</span>
                        </span>

                    </span>


                    <br>
                    " ${subs.description} "
                    <br>
                    <span style="display: inline-flex">
                    <i class="fab fa-facebook-square fa-2x" ></i>&nbsp;
                    <i class="fab fa-twitter-square fa-2x"></i>&nbsp;
                    <i class="fab fa-google-plus-g fa-2x"></i>&nbsp;
                    <span style="float: inline-end;">
                        <a href="#">Download</a>&nbsp;&nbsp;&nbsp;
                        <a href="${subs.linkResource.url}">View Full Site</a>&nbsp;&nbsp;&nbsp;
                        <a href="#">Mark as Read</a>&nbsp;&nbsp;&nbsp;
                    <g:link controller="topic" action="postShow" params="${[postId: subs.id]}">View Post</g:link>
                    </span>
                    </span>
                </p>

                <hr>
            </div>
            </g:each>
        </g:each>
    </g:if>
    <g:else>
        <div style="text-align: center">Currently no posts on this topic. Be the first one ...</div>
    </g:else>
</div>