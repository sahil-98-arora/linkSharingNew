package linksharing3
import linksharing3CO.UserCO
import grails.gorm.transactions.Transactional

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

@Transactional
class UserService {

    def serviceMethod() {

    }

    def displayUsers(){
        def allUsers = User.list()
        return allUsers
    }



    def saveUser(UserCO userCo){
        User user = new User(firstName: userCo.firstName, lastName: userCo.lastName, email: userCo.email, userName: userCo.userName, password: userCo.password , active: true)
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


    def updateUserDetails(long id, def params, def session){
        User user = User.findById(params.id)
        user.userName = params.userName
        user.firstName = params.firstName
        user.lastName = params.lastName


        String a="/home/sahil-arora/Desktop/grails/linksharing3/grails-app/assets/images/profilePic/${user.userName}.jpeg"
        user.photo=a
        println(params.photo.getBytes())
        session.photo=user.photo
        if(session.photo) {
            ByteArrayInputStream bis = new ByteArrayInputStream(params.photo.getBytes());
            BufferedImage bImage2 = ImageIO.read(bis);
            ImageIO.write(bImage2, "jpeg", new File("/home/sahil-arora/Desktop/grails/linksharing3/grails-app/assets/images/profilePic/${user.userName}.jpeg"));
        }

        user.save(flush:true, failOnError:true)

        //return user
    }

    def updateUserPassword(long id, def params){
        User user = User.findById(params.id)
        user.password = params.password
        user.save(flush:true, failOnError:true)

    }

    def sendInvite(def params) {
        def topic = Topic.findByTopicName(params.topicName)
//        String url = "http://localhost:8091/topic/topicshow?tName=" + topic.id
        String url = "http://localhost:8091/topic/topicShow?topicName="+ topic.topicName + "&topicId=" + topic.id
        params.topicUrl = url
        params.sendersName = params.user.userName
        params.topicName = topic.topicName
        params.subject = "Join the Topic using the  Invitation link"
        sendMail
                {
                    to params.email
                    subject params.subject
                    text params.topicUrl
                }
    }
}
