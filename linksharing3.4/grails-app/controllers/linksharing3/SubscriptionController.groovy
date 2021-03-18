package linksharing3

import grails.converters.JSON

class SubscriptionController {

    def index() { }

    def subscribeTheTopics(Topic topic) {
        if (topic){
            println("----------------------------")
            println("in subscription")
            println(params)
            println("params topic id "+params.topicId)
            println("----------------------------")
            Topic tp = Topic.get(params.topicId)
            User user = User.get(session.user.id)
            Subscription subs = new Subscription(user: user, topic: tp, seriousness: Subscription.Seriousness.SERIOUS).save(flush: true, failOnError: true)
            user.addToSubscriptions(subs).save(flush: true, failOnError: true)
            tp.addToSubscription(subs).save(flush: true, failOnError: true)
        }
        def all_topics = Topic.list()
        render (model:[topicName:all_topics.topicName, topicId:all_topics.id] as JSON)
    }

    def unsubscribeTheTopic(Topic topic){
        if (topic){
            println("----------------------------")
            println("in subscription")
            println(params)
            println("params topic id "+params.topicId)
            println("----------------------------")
            Topic tp = Topic.get(params.topicId)
            User user = User.get(session.user.id)
            def sub = Subscription.findByUserAndTopic(user,tp)
            println sub
            sub.delete(flush: true)


        }
        def all_topics = Topic.list()
        render (model:[topicName:all_topics.topicName, topicId:all_topics.id] as JSON)
    }

    def allSubs() {
        println(params)
        Topic topic = Topic.get(params.topicId)
        Subscription subs = Subscription.findByTopicAndUser(topic, session.user)
        if(subs){
            subs.delete(flush: true)
        }
//        if (topic){
//            println("params topic id "+params.topicId)
//            def tp = Topic.get(params.topicId)
//            tp.delete(flush: true)
//        }
        def all_subs = Subscription.list()
        render (model:[topicName:all_subs.topic.topicName, topicId:all_subs.topic.id] as JSON)
    }
}
