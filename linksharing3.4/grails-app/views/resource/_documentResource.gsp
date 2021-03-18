%{--<div class="modal fade" id="myModal2">--}%
%{--    <div class="modal-dialog modal-dialog-centered">--}%
%{--        <div class="modal-content">--}%
%{--            <div class="modal-header">--}%
%{--                <h4 class="modal-title">Share Document</h4>--}%
%{--                <button type="button" class="close" data-dismiss="modal">&times;</button>--}%
%{--            </div>--}%
%{--            <div class="modal-body">--}%
%{--                <g:form controller="resource" action="saveDoc" method="POST" enctype="multipart/form-data">--}%
%{--                    <g:hiddenField name="extension" ></g:hiddenField>--}%
%{--                    <label style="float: left">Document :</label><input type="file" id="one" name="filePath"  >--}%
%{--                --}%%{--                    onchange="Call()"--}%
%{--                    <label style="float: left;margin-top: 5px">Description :</label><g:textArea style="margin-top: 5px" name="description" placeholder="enter..."/>--}%
%{--                    <br>--}%
%{--                    <br>--}%
%{--                    <label style="float: left">Topic :</label><g:select name="topicName" from="${com.link.Topic.list().topicName}" class="dropdown-toggle btn btn-default col-sm-8" value="${addedResource?.topicName}"></g:select>--}%
%{--                    <div>--}%
%{--                        --}%%{--                    <g:select name="visibility" from="${com.link.Topic.values()}"/>--}%
%{--                        <g:actionSubmit value="share" class="btn" style="float: left;" name="saveDoc" controller="resource" action="saveDoc"/>--}%
%{--                        <g:actionSubmit value="cancel" class="btn  close" data-dismiss="modal" />--}%
%{--                    </div>--}%
%{--                </g:form>--}%
%{--            --}%%{--                <script>--}%
%{--            --}%%{--                    function call() {--}%
%{--            --}%%{--                        var fileName = document.querySelector('#one').value;--}%
%{--            --}%%{--                        var extension = fileName.split('.').pop();--}%
%{--            --}%%{--                        document.querySelector('.output')--}%
%{--            --}%%{--                            .textContent = extension;--}%
%{--            --}%%{--                    };--}%
%{--            --}%%{--                </script>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</div>--}%