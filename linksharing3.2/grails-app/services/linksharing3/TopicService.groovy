package linksharing3

import linksharing3CO.*
import linksharing3.*
import grails.gorm.transactions.Transactional

@Transactional
class TopicService {

    def serviceMethod() {

    }

    def addTopicToUser(long id, TopicCO topicCO){

        def user = User.findWhere(id: params['id'])
        //User user=User.findById(idOfUser)
        Topic topic = new Topic(name:topicCO.topicName,topicShow: topicCO.topicShow,users: user)
        topic.save(failOnError:true)
        print(topic.properties);
        user.addToTopics(topic)
        user.save(failOnError:true)
        //  print( user.errors.allErrors)
    }


}
