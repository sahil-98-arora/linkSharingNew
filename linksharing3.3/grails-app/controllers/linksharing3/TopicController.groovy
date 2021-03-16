package linksharing3

import grails.converters.JSON
import linksharing3.User
import linksharing3CO.TopicCO


class TopicController {
//    TopicService topicsService;
    TopicService topicService

    def allTopics(Topic topic) {
        if (topic){
            println("params topic id "+params.topicId)
            def tp = Topic.get(params.topicId)
            tp.delete(flush: true)
        }
        def all_topics = Topic.list()
        render (model:[topicName:all_topics.topicName, topicId:all_topics.id] as JSON)
    }

//    def topicShowRedirect(Topic topic) {
//        if (topic){
//            println("params topic id " + params.topicId)
//            def tp = Topic.get(params.topicId)
//            println("params topic name " + tp.topicName)
//            //redirect(controller: 'topic', action: 'topicShow', id:tp.id ,params:[tpName: tp.topicName, tpId: tp.id])
//        }
//        def all_topics = Topic.list()
//        render (model:[topicName:all_topics.topicName, topicId:all_topics.id] as JSON)
//
//    }

//    def addNewTopic(TopicCO topicCO) {
//        println(topicCO.validate())
//        println(params)
//        println(session.user)
//        println(session.user.id)
//        if(topicCO.validate()){
//            println("\n\n--validated topic")
////            def currentUser =session.user
////            topicsService.addTopicToUser(currentUser.id,topicCO)
//            Topic newTopic = new Topic(params)
//            newTopic.save()
//            User user= User.get(session.user.id)
//            //User user=params.user
//            user.addToTopics(newTopic).save(flush:true)
//            println("\n\n--topic added")
//            flash.messageTopicCreated = "Topic Created Successfully"
//            redirect(controller: 'user', action: 'dashboard')
//        }
//        else{
//            flash.errorTopicCreated = "Topic not created. Something went wrong"
//            redirect(controller: 'user', action: 'dashboard')
//        }

    def addNewTopic(Topic topic) {
        def vis =topic.visibility.convertValue(params.visibility)
        topic=new Topic(topicName:params.topicName, visibility: vis)
        //println(params.visibility)
        if (topic) {
            //println("inside")
            User user = User.get(session.user.id)
            //print(session.user.id)
            user.addToTopics(topic).save(flush: true, failOnError: true)
            topic.save(flush:true,failOnError: true)

            Subscription subs = new Subscription(user: user, topic: topic, seriousness: Subscription.Seriousness.SERIOUS).save(flush: true, failOnError: true)
            user.addToSubscriptions(subs).save(flush: true, failOnError: true)
            topic.addToSubscription(subs).save(flush: true, failOnError: true)

            redirect(controller: 'user', action: 'dashboard')
        } else {
            redirect(controller: 'user', action: 'dashboard')
        }
    }

    def delete() {
        print("\n\n" + params )
        def a = Topic.findById(params.id)
        a.delete()
        redirect controller: 'user', action: 'profile'

    }

    def topicShow(){
//        println()
//        println (params.tpName)
//        println (params.tpId)
//        println()
//
//        def topic = Topic.findByTopicName(params.tpName)
//        if (topic){
//            println topic.topicName
//        }
//        [topic:topic]
        println("------------")
        println(params)
        println(params.topicName)
        println(params.topicId)
        println("------------")

        def topic = Topic.findById(params.topicId)
        def postsOfTopic = Resource.findAllByTopic(topic)
        render( view: 'topicShow', model: [topic:topic, postsOfTopic:postsOfTopic])
    }

    def postShow(){
        println("------------")
        println(params)
        println(params.postId)
        println("------------")
        def resource = Resource.findById(params.postId)

        def trendT = topicService.trendingTopics()
        render(view: 'postShow', model: [thisPost:resource, trendT:trendT])
    }
}