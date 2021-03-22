<div class="card-body" style="overflow-x: scroll; height: 1000px">

%{--    <g:if test="${subsInbox}">--}%
%{--        <g:each in="${subsInbox}" var="sub">--}%
%{--            <g:each in="${sub.topic.resources}" var="subs">--}%
%{--                <g:if test="${subs.readingItems }">--}%
%{--                    <div class="mark${subs.id}">--}%
%{--                        <div class="postImage">--}%
%{--                            <g:link controller="user" action="userProfile" params="${[userId: subs.createdBy.id]}">--}%
%{--                                <g:img dir="images/profilePic" class="pImage" file='${subs.createdBy.photo}' alt="Missing Image" />--}%
%{--                            </g:link>--}%
%{--                        </div>--}%
%{--                        <div class="postContent">--}%
%{--                            <p>--}%

%{--                                ${subs.createdBy.firstName} ${subs.createdBy.lastName}--}%
%{--                                <span style="color: gray;">--}%
%{--                                    <g:link controller="user" action="userProfile" params="${[userId: subs.createdBy.id]}">--}%
%{--                                        @${subs.createdBy.userName}--}%
%{--                                    </g:link>--}%
%{--                                    <span style="float: right;">--}%
%{--                                        <g:link controller="topic" action="topicShow" params="${[topicName: subs.topic.topicName, topicId:subs.topic.id]}">--}%
%{--                                            <span style="font-weight: 800">${subs.topic.topicName}</span>--}%
%{--                                        </g:link>--}%
%{--                                        <span style="color: gray; font-size: 12px">${subs.lastUpdated}</span>--}%
%{--                                    </span>--}%

%{--                                </span>--}%


%{--                                <br>--}%
%{--                                " ${subs.description} "--}%
%{--                                <br>--}%
%{--                                <span>--}%
%{--                                <i class="fab fa-facebook-square fa-2x" ></i>&nbsp;--}%
%{--                                <i class="fab fa-twitter-square fa-2x"></i>&nbsp;--}%
%{--                                <i class="fab fa-google-plus-g fa-2x"></i>&nbsp;--}%
%{--                                <span style="float: inline-end;">--}%
%{--                                    <a href="${subs.documentResources.filePath[0]}" download="">Download</a>&nbsp;&nbsp;&nbsp;--}%
%{--                                    <g:if test="${subs.documentResources.filePath[0]}">--}%
%{--                                        <g:link url="${subs.documentResources.filePath[0]}">Download</g:link>&nbsp;&nbsp;&nbsp;--}%
%{--                                    </g:if>--}%
%{--                                    <g:if test="${subs.linkResource.url[0]}">--}%
%{--                                        <a href="http://${subs.linkResource.url[0]}" target="_blank">View Full Site</a>&nbsp;&nbsp;&nbsp;--}%
%{--                                    </g:if>--}%
%{--                                    <span onclick="markAsRead(${subs.id})" style="color: dodgerblue">Mark as Read</span>&nbsp;&nbsp;&nbsp;--}%
%{--                                <g:link controller="topic" action="postShow" params="${[postId: subs.id]}">View Post</g:link>--}%
%{--                                </span>--}%
%{--                                </span>--}%
%{--                            </p>--}%

%{--                            <hr>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </g:if>--}%

%{--            </g:each>--}%
%{--        </g:each>--}%
    <g:if test="${subsInbox}">
        <g:each in="${subsInbox}" var="inboxItem">
                <div class="mark${inboxItem.id}">
                    <div class="postImage">
                        <g:link controller="user" action="userProfile" params="${[userId: inboxItem.resource.createdBy.id]}">
                            <g:img dir="images/profilePic" class="pImage" file='${inboxItem.resource.createdBy.photo}' alt="Missing Image" />
                        </g:link>
                    </div>
                    <div class="postContent">
                        <p>
                            ${inboxItem.resource.createdBy.firstName} ${inboxItem.resource.createdBy.lastName}
                            <span style="color: gray;">
                                <g:link controller="user" action="userProfile" params="${[userId: inboxItem.resource.createdBy.id]}">
                                    @${inboxItem.resource.createdBy.userName}
                                </g:link>
                                <span style="float: right;">
                                    <g:link controller="topic" action="topicShow" params="${[topicName: inboxItem.resource.topic.topicName, topicId:inboxItem.resource.topic.id]}">
                                        <span style="font-weight: 800">${inboxItem.resource.topic.topicName}</span>
                                    </g:link>
                                    <span style="color: gray; font-size: 12px">${inboxItem.resource.lastUpdated}</span>
                                </span>

                            </span>


                            <br>
                            " ${inboxItem.resource.description} "
                            <br>
                            <span>
                            <i class="fab fa-facebook-square fa-2x" ></i>&nbsp;
                            <i class="fab fa-twitter-square fa-2x"></i>&nbsp;
                            <i class="fab fa-google-plus-g fa-2x"></i>&nbsp;
                            <span style="float: inline-end;">
                                <g:if test="${inboxItem.resource.documentResources.filePath[0]}">
                                    <g:link url="${inboxItem.resource.documentResources.filePath[0]}">Download</g:link>&nbsp;&nbsp;&nbsp;
                                </g:if>
                                <g:if test="${inboxItem.resource.linkResource.url[0]}">
                                    <a href="http://${inboxItem.resource.linkResource.url[0]}" target="_blank">View Full Site</a>&nbsp;&nbsp;&nbsp;
                                </g:if>
                                <span onclick="markAsRead(${inboxItem.id})" style="color: dodgerblue">Mark as Read</span>&nbsp;&nbsp;&nbsp;
                            <g:link controller="topic" action="postShow" params="${[postId: inboxItem.resource.id]}">View Post</g:link>
                            </span>
                            </span>
                        </p>

                        <hr>
                    </div>
                </div>
        </g:each>
    </g:if>
    <g:else>
        <div style="text-align: center">Currently no posts on this topic. Be the first one ...</div>
    </g:else>
</div>

<script>
    function markAsRead(id){
        $.ajax({
            type: 'post',
            url: "http://localhost:8091/resource/markAsRead",
            data: {"readingItemId" : id}, //$("#topicName").val() },
            success: function (){
                $(".mark" + id).hide('slow');
            }
        });
    }
</script>