package linksharing3
import linksharing3.Resource
import grails.converters.JSON
import linksharing3.User
import linksharing3CO.UserCO
import grails.validation.Validateable
////////////////experimant
import org.hibernate.criterion.CriteriaSpecification;
////////////////////////
import javax.imageio.ImageIO
import java.awt.image.BufferedImage
import java.io.File


class UserController {

    UserService userService
    TopicService topicService

    def index() {
        render "hello"
    }

    def index1(){
        println "---displaying allusers---"
        def allUsers = User.list()
        render ("Using only controller")
        render (view:'index1', model:[allusers:allUsers])
    }




    def admin(){
        println "---displaying allusers---"
        def allUsers = userService.displayUsers()
        render (view:'admin', model:[allusers:allUsers])
    }

    def signup(){
        println "---registering a user---"
        UserCO userCO = new UserCO()
        bindData(userCO, params, [exclude: ['photo', 'admin', 'active']])
        //bindData(userCO, params, [exclude: ['admin', 'active']])
        if (userCO.validate()){
            def data = userService.saveUser(userCO)
            if (data) {
                println("\n\n---signup successful---\n\n")
                flash.messageSignupSuccessful = "Signup Successful"
                redirect(action: 'login')
            }
            else {
                println("\n\n---signup failed---\n\n")
                flash.messageSignupFailed = "Signup Failed"
                redirect(action: 'signup')
            }
        }
        def postsOfTopic = Resource.list(sort:'dateCreated',order:'desc', offset:0, max:2)
        render (view:"signup", model: [postsOfTopic:postsOfTopic])
    }


    def login() {
        def user = User.findWhere(userName: params['userName'], password: params['password'])
        if (user){
            session.user = user
            println("\n\n---user logged in---\n\n")
            flash.messageLoggedIn = "Logged in as $user.firstName $user.lastName ($user.email)"
            redirect(action: 'dashboard')
        }
//        else{
//            println("\n\n\n---user not logged in---\n\n\n")
//            redirect(controller:'user',action:'login')
//            flash.message = "Invalid Username/Password, please try again."
//        }
        def postsOfTopic = Resource.list(sort:'dateCreated',order:'desc', offset:0, max:2)
        render (view: 'signup', model: [postsOfTopic:postsOfTopic])
    }


    def logout(){
        session.invalidate()
        redirect(controller:'user', action: 'signup')
    }

    def dashboard(){
        def trendT = topicService.trendingTopics()
        println("-----------")
        println (trendT.flatten())
        println("-----------")
        def user = User.get(session.user.id)
        def subsList = Subscription.findAllByUser(user).reverse()

        def topicList = Topic.list()
        render (view: 'dashboard', model:[trendT:trendT, topicList:topicList, subsList:subsList])
    }

    def profile(){
        def myTopics = Topic.findAllByUsers(session.user)
        render(view: 'profile', model: [myTopics:myTopics])
    }

    def updateDetails(){
        User user = User.findById(params.id)
        if (user){
            user.userName = params.userName
            user.firstName = params.firstName
            user.lastName = params.lastName

            /////////////////////////////////////////
            String a="profilePic/${user.userName}.jpeg"
            user.photo= a
            session.user.photo=user.photo
            if(session.user.photo) {
                ByteArrayInputStream bis = new ByteArrayInputStream(params.photo.getBytes());
                BufferedImage bImage2 = ImageIO.read(bis);
                ImageIO.write(bImage2, "jpeg", new File("/home/sahil-arora/Desktop/grails/linksharing3/grails-app/assets/images/profilePic/${user.userName}.jpeg"));
            }
            ///////////////////////////////////////////
            user.save(flush:true, failOnError:true)
            session.user = user//userService.updateUserDetails(user.id, params, session.user)
            flash.messageUpdateDetails = "Updated successfully"
            redirect(action: 'profile')

        } else{
            flash.errorUpdateDetails = "Something went wrong... Please try again."
            redirect(action: 'profile')
        }
    }

    def updatePassword(){
        User user = User.findById(params.id)
        if (user){
            if (params.password == params.confirmPassword){
                session.user = userService.updateUserPassword(user.id, params)
                flash.messageUpdateDetails = "Updated successfully. Please Login again."
                redirect(action: 'profile')
            }else{
                flash.errorUpdateDetails = "Something went wrong... Please try again."
                redirect(action: 'profile')
            }
        }else{
            flash.error = "Something went wrong... Please try again."
            redirect(action: 'profile')
        }
    }

    def search(){
        if(params){
            println("--------")                 //desc topic name
            println(params)
            println(params.search)
            println("--------")
            def resource = Resource.findAllByDescriptionLike("%${params.search}%")
            if(resource){
                println("resource below")
                println(resource.description)
                render([topicId:resource.topic.id, topicName:resource.topic.topicName, resourceDescription:resource.description] as JSON)
            }
//            def topic =Topic.findByTopicNameLike("${params.search}%")
//            if(topic) {
//                println("topic below")
//                println(topic.topicName)
//            }

        }
        def resource = Resource.list()
        render ([topicId:resource.topic.id, topicName:resource.topic.topicName, resourceDescription:resource.description] as JSON)
    }


}
