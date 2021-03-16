package linksharing3
import grails.validation.Validateable

class Topic {
    String topicName
    Date dateCreated
    Date lastUpdated
    //String  topicShow
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
    Visibility visibility


    static belongsTo=[users:User]
    static hasMany=[subscription:Subscription,resources:Resource]


    static constraints ={
        topicName nullable: false, maxsize:255,unique: true
        //topicShow nullable: false
    }
}
