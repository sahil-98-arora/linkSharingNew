package linksharing3

import grails.gorm.transactions.Transactional

@Transactional
class ResourceService {

    def serviceMethod() {

    }

    Resource addLinkResource(String url, String description,  String userName, String topicName){
        Topic topic=Topic.findByTopicName(topicName)
        User user=User.findByUserName(userName)
        Resource resource = new Resource(description: description, topic: topic, createdBy: user).save(flush:true,failOnError:true)
        LinkResource lr=new LinkResource(url: url, resource: resource).save(flush:true,failOnError:true)
        resource.addToLinkResource(lr).save(flush:true,failOnError:true)
        topic.addToResources(resource).save(flush:true,failOnError:true)
//       resource.addToLinkResources(lr)
        return resource
    }

    def recentShares(){
        //return Resource.list(sort:'dateCreated',order:'desc', offset:0, max:2)
        def list = Resource.createCriteria().list {
            maxResults(2)
            order("dateCreated", "desc")
        }
        return list
    }


}
