package linksharing3CO
import grails.validation.Validateable

class TopicCO implements Validateable{
    String topicName
    enum Visibility{
        PUBLIC,PRIVATE

        def convertValue(String val){
            if(val=='PUBLIC'){
                return Visibility.PUBLIC
            }else{
                return Visibility.PRIVATE
            }
        }
    }
//    String topicShow

    static constraints ={
        topicName nullable: false, maxsize:255, unique:true
//        topicShow nullable: true
    }


}