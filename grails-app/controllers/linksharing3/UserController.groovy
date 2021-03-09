package linksharing3
import linksharing3.User
import linksharing3CO.UserCO
import grails.validation.Validateable


class UserController {

    UserService userService

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
        render ("Using controller and service")
        render (view:'index1', model:[allusers:allUsers])
    }




    def signup(){
        println "---registering a user---"
        UserCO userCO = new UserCO()
        bindData(userCO, params, [exclude: ['image', 'admin', 'active']])
        if (userCO.validate()){
            def data = userService.save(userCO)
            if (data) {
                println("\n\n---signup successful---\n\n")
                redirect(action: 'login')
            }
            else {
                println("\n\n---signup failed---\n\n")
                redirect(action: 'signup')
            }
        }
        render view:"signup"
    }


    def login() {
//        if (request.method == 'POST') {
//            //def passwordHashed = params.password.encodeAsPassword()
//            //def u = User.findByUsernameAndPasswordHashed(params.username, passwordHashed)
//            def u = User.findByUserNameAndPassword( params.userName, params.password)
//            if (u) {
//                // username and password match -> log in
//                session.user = u
//                redirect(controller:'main')
//            } else {
//                flash.message = "User not found"
//                redirect(controller:'main')
//            }
//        } else if (session.user) {
//            // don't allow login while user is logged in
//            redirect(controller:'main')
//        }
//        render (view: 'signup')

        def user = User.findWhere(userName: params['userName'], password: params['password'])

        if (user){
            session.user = user
            println("\n\n---user logged in---\n\n")
            redirect(action: 'dashboard')
            flash.message = "Logged in as <b>$user.firstName $user.lastName ($user.email)</b>"
        }
//        else{
//            println("\n\n\n---user not logged in---\n\n\n")
//            redirect(controller:'user',action:'login')
//            flash.message = "Invalid Username/Password, please try again."
//        }
        render (view: 'signup')
    }


    def logout = {
        session.invalidate()
        redirect(controller:'user', action: 'signup')
    }


    def dashboard(){
        render (view: 'dashboard')
    }

    def profile(){
        render(view: 'profile')
    }
}
