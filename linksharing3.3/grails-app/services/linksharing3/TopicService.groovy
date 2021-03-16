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


    def trendingTopics(){
//        return Resource.createCriteria().list {
//            projections{
//                createAlias('topic', 't')
//                groupProperty('t.id')
//                property('t.topicName')
//                property('t.visibility')
//                count('t.id', 'topicCount')
//                property('t.users')
//
//            }
//            order('topicCount', 'desc')
//            order('t.topicName', 'asc')
//            maxResults(2)
//        }
        return Topic.list(sort:'dateCreated',order:'desc', offset:0, max:5)
    }

}
