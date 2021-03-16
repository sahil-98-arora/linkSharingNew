package linksharing3

class Resource {

    //String title;
    String description;
    Date dateCreated;
    Date lastUpdated;

    static belongsTo = [createdBy:User,topic:Topic]
    static hasMany = [readingItems: ReadingItem, resourceRatings: ResourceRating, documentResources:DocumentResource, linkResource:LinkResource]

    static constraints = {
        createdBy nullable: false
        //title nullable: false, maxSize: 100
        description nullable: true, maxSize: 1024
        //title unique: 'topic'
    }


}
