package linksharing3

import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {

    def serviceMethod() {
    }

    def subsUser(user){
        List<Subscription> subsList = Subscription.createCriteria().list {
            eq('user', user)
            order('dateCreated', 'desc')
            maxResults(5)
        }
        return subsList
    }



//    def fetchSubscribedTopic(User user){
//        List<Topic> topics = user.subscriptions*.topic.sort{
//            Topic topic -> topic.resources.lastUpdated
//        }
//        topics
//    }
}
