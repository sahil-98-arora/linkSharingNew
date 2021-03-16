package linksharing3

class ResourceController {

    ResourceService resourceService
    def index() { }

    def addLinkResource(String url, String description, String topicName){
        println("entered controller")
        println(topicName)
        String userName= session.user.userName
        Resource addedResource = resourceService.addLinkResource(url,description ,userName, topicName)
        print(addedResource.save())
        if(addedResource){
            redirect( controller:"user", action:"dashboard", view: "dashboard")
            flash.messageResourceAdded="Resource Successfully added"
        }else{
            flash.messageResourceNotAdded="Resource not added"
        }
        render(view: "/user/dashboard")
    }

    def addDocumentResource(){
        if(params) {
            User user = User.get(session.user.id)
            Topic topic = Topic.findByTopicName(params.topicName)
            println(params.description)
            String a = "/home/sahil-arora/Desktop/grails/linksharing3/grails-app/assets/docs/${session.user.id}.pdf"
            Resource resource = new Resource(description: params.description, createdBy: user, topic: topic).save(flush: true, failOnError: true)
            DocumentResource documentResource = new DocumentResource(resource: resource, filePath: a).save(flush: true, failOnError: true)
            resource.addToDocumentResources(documentResource)
            topic.addToResources(resource).save(flush: true, failOnError: true)
            user.addToResources(resource).save(flush: true, failOnError: true)
            redirect(controller: 'user',action: 'dashboard')
        }else{
            println("not saved")
        }

    }
}
