package linksharing3

class Topic {
    String topicName
    Date dateCreated
    Date lastUpdated
    String  topicShow

    static belongsTo=[users:User]
    //static hasMany=[subscription:Subscription,resources:Resource]

    static constraints ={
        topicName nullable: false, maxsize:255,unique: true
        topicShow nullable: false
    }

//    static mapping = {
//        table 'UserTopics'
//    }
}
