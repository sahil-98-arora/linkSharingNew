package linksharing3

class User {
    String userName
    String email
    String firstName;
    String lastName;
    Date dateCreated;
    Date lastUpdated;
    String password
    String photo;
    String otp
//    String confirmPassword
    Boolean admin;
    Boolean active;
//
//    static hasMany = [ subscriptions: Subscription, resources: Resource, resourceRatings: ResourceRating, readingItems : ReadingItem, myTopics: Topic ];
    static hasMany=[topics: Topic, subscriptions:Subscription, resources:Resource, readingItems : ReadingItem]

    static constraints = {
        email nullable: false,email: true,unique: true,blank: false
        lastName nullable: true
        userName nullable: false, unique: true
        firstName nullable: false
        otp nullable:true, blank:true

        admin nullable: true
        active nullable: true
        subscriptions nullable: true
//        resources nullable: true
//        resourceRatings nullable: true
//        readingItems nullable: true
        topics nullable: true
//        confirmPassword nullable: true
        password nullable: false
//        password nullable: false , validator : { val, obj ->
//            if (obj.password != obj.confirm)
//                return 'password didnt match'
//        }
        photo nullable: true

    }

    static mapping = {
        table 'USER_INFO'
    }
}
