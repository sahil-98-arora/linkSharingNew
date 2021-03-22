package linksharing3

import grails.converters.JSON

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

class ResourceController {

    ResourceService resourceService
    def index() { }

    def addLinkResource(String url, String description, String topicName){
        String userName= session.user.userName
        Resource addedResource = resourceService.addLinkResource(url,description ,userName, topicName)
        if(addedResource){
            redirect( controller:"user", action:"dashboard", view: "dashboard")
            flash.messageResourceAdded="Link Resource Successfully added"
        }else{
            flash.messageResourceNotAdded="Link Resource not added"
        }
        render(view: "/user/dashboard")
    }

    def addDocumentResource(){
        if(params) {
            User user = User.get(session.user.id)
            Topic topic = Topic.findByTopicName(params.topicName)
            String a = "/assets/docs/${session.user.id}.pdf"
            def file=params.filePath.getBytes()
            FileOutputStream fos = new FileOutputStream("/home/sahil-arora/Desktop/grails/linksharing3/grails-app/assets/docs/${session.user.id}.pdf")
            fos.write(file)
            fos.close()
            Resource resource = new Resource(description: params.description, createdBy: user, topic: topic).save(flush: true, failOnError: true)
            DocumentResource documentResource = new DocumentResource(resource: resource, filePath: a).save(flush: true, failOnError: true)
            resource.addToDocumentResources(documentResource)
            topic.addToResources(resource).save(flush: true, failOnError: true)
            user.addToResources(resource).save(flush: true, failOnError: true)
            resourceService.status(topic, resource)
            if(documentResource){
                flash.messageDocResourceAdded="Document Resource Successfully added"
            }else{
                flash.messageDocResourceNotAdded="Resource not added"
            }
            redirect(controller: 'user',action: 'dashboard')
        }else{
            println("not saved")
        }
    }

    def allResources(Resource resource) {
        if (resource){
            println("params resource id "+params.resourceId)
            def rs = Resource.get(params.resourceId)
            println rs
            rs.delete(flush: true)
            redirect(controller: 'user', action: 'dashboard')
        }
        def all_resources = Resource.list()
        render (model:[resourceId:all_resources.id] as JSON)
    }

    def markAsRead(){
        if (params){
            println(params)
            User user = session.user
            ReadingItem ri = ReadingItem.get(params.readingItemId)
            println(ri)
            ri.isRead = true
            ri.save(flush:true)
            flash.messageMarkedRead = "1 post from '${ri.resource.topic.topicName}' is marked as read."
        }
        def all_readingItem = ReadingItem.list()
        render (model:[readingItemId:all_readingItem.id] as JSON)
    }
}
