<div class="modal-header">
    <h4 class="modal-title">Create Resource - Share Link</h4>
    <button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
<g:form controller="resource" action="addLinkResource" method="POST">
    <label for="url"></label>Link:</label>
    <input type="text" class="form-control" id="url" placeholder="Enter Link" name="url">
    <br>
    <label for="description">Description</label>
    <textarea rows="2" cols="45" name="description" id="description" placeholder="Enter description here"></textarea>
    <br><br>
    <label for="topicName"> Topic:  </label>
%{--                            <select>--}%
%{--                                <g:each in="${topicList}" var="num">--}%
%{--                                <option value="${addedResource?.topicName}"> ${num.topicName} </option>--}%
%{--                                </g:each>--}%
%{--                            </select>--}%
    <g:select name="topicName" from="${linksharing3.Topic.list().topicName}" class="dropdown-toggle btn btn-default col-sm-8" value="${addedResource?.topicName}"></g:select>

    <br><br>
    <g:actionSubmit value="Submit" controller="resource" action="addLinkResource" class="btn btn-primary"/>
    <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: right">Close</button>
</g:form>
</div>
