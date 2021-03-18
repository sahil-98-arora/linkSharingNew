package linksharing3

import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {

    def serviceMethod() {
    }

    def subsInbox(user){
        return Subscription.createCriteria().list {
            eq('user', user)
            order('dateCreated', 'desc')
            maxResults(5)
        }
    }
}
