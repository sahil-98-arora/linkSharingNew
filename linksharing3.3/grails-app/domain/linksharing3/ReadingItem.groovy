package linksharing3

class ReadingItem {

    Boolean isRead;

    static belongsTo = [resource: Resource, user: User]
    static constraints = {
        isRead nullable: false
    }
}
