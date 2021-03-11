package linksharing3

class User {
    String userName
    String email
    String firstName;
    String lastName;
    Date dateCreated;
    Date lastUpdated;
    String password
//    String confirmPassword
//    Byte[] photo;
//    Boolean admin;
//    Boolean active;
//
//    static transients = ['password', 'confirm']
//    static hasMany = [ subscriptions: Subscription, resources: Resource, resourceRatings: ResourceRating, readingItems : ReadingItem, myTopics: Topic ];
    static hasMany=[topics: Topic]

    static constraints = {
        email nullable: false,email: true,unique: true,blank: false
        lastName nullable: true
        userName nullable: false, unique: true
        firstName nullable: false

//        photo nullable: true
//        admin nullable: false
//        active nullable: false
//        subscriptions nullable: true
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

    }
}
