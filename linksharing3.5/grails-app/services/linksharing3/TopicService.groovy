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


//    def trendingTopics(){
        /////////////////////EXPERIMENT///////////////////////////
//        def a = Resource.createCriteria().list{
//            projections{
//                createAlias("topic","t")
//                groupProperty("t.id")
//                property("t.topicName")
////                property("t.visibility")
////                property("t.users")
//                count("t.id","topicC")
//
//            }
//            order("topicC",'desc')
//        }
//        println("--------------------BELOW--------------------------")
//        println(a)
//        def s = []
//        a.each{
//            s.add(new Topic(
//                    id: it[0],
//                    topicName: (Topic.findById(it[0])).topicName,
//                    vivibility: (Topic.findById(it[0])).visibility,
//                    users: (Topic.findById(it[0])).users
//            ))
//        }
//        println(s)
//        return s
        //////////////////////////////////////////////////////////
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
//            maxResults(5)
//        }
//        def l = Topic.countByUsers
        ///////////////////////////////////////////////////////////////////
        //return Topic.list(sort:'dateCreated',order:'desc', offset:0, max:5)
        ///////////////////////////////////////////////////////////////////


        ///////////////////////////////////////////////////////////////////
    def trendingTopics(User user){
        def criteria = Topic.createCriteria()
        List<Topic> topicList = criteria.listDistinct {
            or{
                'subscription'{
                    eq('user',user)
                }
                eq('visibility',Topic.Visibility.PUBLIC)
            }
        }
        topicList.sort {
            Topic topic -> -topic.resources.size()
        }
        topicList
    }

    def subbedTopics(User user) {
        List<ReadingItem> read = ReadingItem.createCriteria().list{
            and{eq('isRead',false)
                eq('user',user)
            }
            //order('dateCreated','desc')
        }
        if (read) {
            return read
        } else {
            return null
        }
    }



}
