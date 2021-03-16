package linksharing3

class ResourceRating {

    Integer score;

    static belongsTo = [user: User, resource:Resource]

    static constraints = {
        user unique: 'resource'
    }
}
