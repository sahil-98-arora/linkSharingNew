
<div class="card">
    <div class="card-header">Topics Created
        <a href="#" style="float: inline-end;"></a>
    </div>
    <g:each in="${myTopics}" var="num">
        <div class="card-body card${num.id}" style="border: 1px solid #c7c7c7">

            <div class="postImage">
                <g:img dir="images/profilePic" class="pImage" file='${num.users.photo}' alt="Missing Image" />
            </div>
            <div class="postContent">
                <p>
                    <g:link controller="topic" action="topicShow" params="${[topicName: num.topicName, topicId:num.id]}">${num.topicName}</g:link>
                    <span id="topicName" style="color: gray; float: right">@${num.users.userName}</span>
%{--                    <span id="topicId" style="color: gray;">@${num.id}</span>--}%
                    <br>
                    <span style="float: left; margin-right: 70px;">
                        Subscriptions <br> 500 </span>
                    <span>Posts <br> 500 </span>
                </p>
            </div>
            <p style="float: inline-end; margin-bottom: 0%;">
                <span style="display:flex; justify-content: space-between">
                    <select style="margin-left: 20px">
                        <option value = "serious" selected> serious</option>
                        <option value = "casual"> casual</option>
                        <option value = "veryserious"> Very serious</option>
                    </select>
                    <select style="margin-left: 20px">
                        <option value = "serious" selected> Public</option>
                        <option value = "casual"> Private</option>
                    </select>
                    &nbsp;&nbsp;

                    <i class="far fa-plus-square fa-2x" style="margin-left: 20px"></i>&nbsp;&nbsp;
                    <i class="far fa-envelope fa-2x" style="margin-left: 20px"></i>&nbsp;&nbsp;
                    <i id="deleteTopic" class="far fa-trash-alt fa-2x" style="margin-left: 20px" onclick="myfunction1(${num.id})"></i>
%{--                    <g:link controller="topic" action="delete" params="num.id"><i class="far fa-trash-alt fa-2x" style="margin-left: 20px"></i></g:link>--}%
                </span>
            </p><br>
        </div>
        </g:each>
</div>



    <script>
        // $(document).ready(function (){
        //     $("#deleteTopic").on("click", function(){
        //         myfunction1();
        //     });
        // });

        function myfunction1(id){
          $.ajax({
              type: 'post',
              url: "http://localhost:8081/topic/allTopics",
              data: {"topicId" : id}, //$("#topicName").val() },
              success: function (){
                  $(".card" + id).hide('slow');
                  //alert("working");
              }
          });
        };


    </script>
