package linksharing3CO
import grails.validation.Validateable
import linksharing3.User

class UserCO implements Validateable {
    String firstName
    String lastName
    String email
    String userName
    String password
    String confirmPassword
//    Boolean admin
//    Boolean active
    String photo
//    static transients = ['password', 'confirm']

    static constraints = {
        firstName nullable: false, maxSize: 225
        lastName blank: false, maxSize: 225
        email unique: true, nullable: false, maxSize: 50
        userName unique: true, nullable: false, maxSize: 200
        photo nullable: true
        password blank: false, size: 5..15

        confirmPassword blank: false, size: 5..15, validator: { val, obj ->
            if (obj.password != obj.confirmPassword)
                return "----passwords don't match----"
        }
    }

//    def execute(){
//        userName = params.userName
//        user.firstName = firstName
//        user.lastName = lastName
//        user.save(flush:true)
//    }
}