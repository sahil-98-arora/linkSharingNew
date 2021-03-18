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
import linksharing3.CountsTagLib
import java.io.File


class UserController {
    UserService userService
    TopicService topicService
    ResourceService resourceService
    SubscriptionService subscriptionService

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
        //def postsOfTopic = Resource.list(sort:'dateCreated',order:'desc', offset:0, max:2)
        def postsOfTopic = resourceService.recentShares()
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
        //trending topics
        def trendT = topicService.trendingTopics()
        //def trendT = topicService.topTopics()

        //subscribed topics
        def user = User.get(session.user.id)
        //def subsList = Subscription.findAllByUser(user).reverse()
        def subsList = subscriptionService.subsInbox(user)

        //inbox posts list
        def subsInbox = Subscription.findAllByUser(user).reverse()


//        def myTopics = Topic.findAllByUsers(session.user)
//        subsInbox.remove(myTopics)

        //topiclist for ajax
        def topicList = Topic.list()
        render (view: 'dashboard', model:[trendT:trendT, topicList:topicList, subsList:subsList, subsInbox:subsInbox])
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
            def topic =Topic.findByTopicNameIlike("${params.search}%")
            if(topic) {
                println("topic below")
                println(topic.topicName)
                render([topicId:topic.id, topicName:topic.topicName, creator:topic.users.userName] as JSON)
            }
        }
        def resource = Resource.list()
        render ([topicId:resource.topic.id, topicName:resource.topic.topicName, resourceDescription:resource.description] as JSON)
    }


    def userProfile(){
        println(params)
        def userProfileData = User.findById(params.userId)
        def myTopics = Topic.findAllByUsers(userProfileData)
        //subscribed topics
        def user = User.get(userProfileData.id)
        def subsList = Subscription.findAllByUser(userProfileData).reverse()
        def posts = Resource.findAllByCreatedBy(userProfileData)
        render (view: 'userProfile', model:
                [userProfileData:userProfileData,
                 myTopics:myTopics,
                 subsList:subsList,
                posts:posts])
    }


    def send(num, email) {
        sendMail {
            to "${email}"
            subject "hello"
            text "${num}"
        }
        flash.message = "Message sent at "+new Date()
        //redirect action:"index"
        return num
    }

    def forgotPassword(){
        println(params.email)
        def user = User.findByEmail(params.email)
        println user
        if(user){
            def num = Math.abs( new Random().nextInt() % (9999 - 1000) ) + 1000
            def a = send(num, params.email)
            println num
            user.otp = num
            println("saving user otp:"+user.otp)
            user.save(flush:true)
            render(view: 'forgotPassword', model: [user:user])
        }
        else{
            flash.messageUserNotFound = "${params.email} not found"
        }

    }

    def otpVerify(){
        println(params.email)
        def user = User.findByEmail(params.email)
        println ("otp " + params.otp)
        println("num " + user.otp)

        if(user.otp == params.otp){
            println("otp verified")
            if (params.password == params.confirmPassword){
                user.password = params.password
                user.save(flush:true)
                flash.messagePasswordChanged = "Password Change Successful"
            }else{
                flash.messagePasswordNotChanged = "Password not Changed"
                redirect(action: 'signup')
            }
            redirect(action: 'signup')
        }else{
            redirect(action: 'signup')
        }
        //render ("ok")
    }


}
