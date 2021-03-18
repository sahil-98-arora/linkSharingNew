
<div class="modal-content">
    <div class="modal-header">
        <h4 class="modal-title">Create Topic</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
    </div>
    <div class="modal-body">

        <g:form controller="topic" action="addNewTopic" method="POST">
%{--            <g:form >--}%
            <label for="topicName">Name:</label>
            <input type="text" class="form-control" id="topicName" placeholder="Enter Name" name="topicName">
            <br>
            <label> Visibility :   </label>
            <g:select name="visibility" from="${linksharing3.Topic.Visibility.values()}"/>
%{--            <select name="topicShow" id="topicShow">--}%
%{--                <option >Public</option>--}%
%{--                <option>Private</option>--}%
%{--            </select>--}%
            <br>
            <hr>
            <g:actionSubmit controller="topic" action="addNewTopic" value="Create Topic" class="btn btn-primary"/>
            <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: right">Close</button>
        </g:form>

    </div>
</div>