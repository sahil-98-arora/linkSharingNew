package linksharing3
import linksharing3CO.UserCO
import grails.gorm.transactions.Transactional

@Transactional
class UserService {

    def serviceMethod() {

    }

    def displayUsers(){
        def allUsers = User.list()
        return allUsers
    }


    def save(UserCO userCo){
        User user = new User(firstName: userCo.firstName, lastName: userCo.lastName,
                email: userCo.email, userName: userCo.userName, password: userCo.password )

        if(user.validate()) {
            user.save(flush: true, failOnError: true)
        }
        else {
            user.errors.allErrors.each {
                println it
            }
        }
        return user
    }
}
