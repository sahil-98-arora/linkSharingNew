package linksharing3

class DocumentResource {

    String filePath;
    //String contentType;
    static belongsTo = [resource:Resource]
    static constraints = {
        filePath nullable: true, maxSize: 700
        //contentType nullable: false, blank: false
    }
}
