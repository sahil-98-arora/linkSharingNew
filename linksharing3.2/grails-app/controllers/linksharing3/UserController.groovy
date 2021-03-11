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
        render (view:'admin', model:[allusers:allUsers])
    }

    def signup(){
        println "---registering a user---"
        UserCO userCO = new UserCO()
        bindData(userCO, params, [exclude: ['image', 'admin', 'active']])
        if (userCO.validate()){
            def data = userService.saveUser(userCO)
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


    def logout(){
        session.invalidate()
        redirect(controller:'user', action: 'signup')
    }

    def dashboard(){
        render (view: 'dashboard')
    }

    def profile(){
        render(view: 'profile')
    }

    def updateDetails(){
        User user = User.findById(params.id)
        if (user){
            user.userName = params.userName
            user.firstName = params.firstName
            user.lastName = params.lastName
            user.save(flush:true, failOnError:true)
            println(user)
            println("\n\nvalues updated\n\n")
            flash.message = "Updated successfully. Please Login again."
            redirect(action: 'profile')
        }
        else{
            println("\n\nvalues not updated\n\n")
            flash.error = "Something went wrong... Please try again."
            redirect(action: 'profile')
        }
    }

    def updatePassword(){
        User user = User.findById(params.id)
        if (user){
            println(params.password)
            println(params.confirmPassword)
            if (params.password == params.confirmPassword){
                user.password = params.password
                user.save(flush:true, failOnError:true)
                println(user)
                println("\n\nvalues updated\n\n")
                flash.message = "Updated successfully. Please Login again."
                redirect(action: 'profile')
            }
            else{
                println("\n\nvalues not updated\n\n")
                flash.error = "Something went wrong... Please try again."
                redirect(action: 'profile')
            }
        }
        else{
            println("\n\nvalues not updated\n\n")
            flash.error = "Something went wrong... Please try again."
            redirect(action: 'profile')
        }

    }
}
