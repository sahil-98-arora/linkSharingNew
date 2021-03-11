package linksharing3

import linksharing3.User
import linksharing3CO.TopicCO


class TopicController {
    TopicService topicsService;

    def allTopics() {
        def all_topics = Topic.list().reverse()
        render (view:'allTopics', model:[alltopics:all_topics])
    }

    def myTopics() {
        def all_topics = Topic.findAllById(session.user.id)  // <<< doubt ?????
        render (view:'allTopics', model:[alltopics:all_topics])
    }

    def addNewTopic(TopicCO topicCO) {
        println(topicCO.validate())
        println(params)
        println(session.user)
        println(session.user.id)
        if(topicCO.validate()){
            println("\n\n--validated topic")
//            def currentUser =session.user
//            topicsService.addTopicToUser(currentUser.id,topicCO)
            Topic newTopic = new Topic(params)
            newTopic.save()
            User user= User.get(session.user.id)
            //User user=params.user
            user.addToTopics(newTopic).save(flush:true)
            println("\n\n--topic added")
            flash.messageTopicCreated = "Topic Created Successfully"
            redirect(controller: 'user', action: 'dashboard')
        }
        else{
            flash.errorTopicCreated = "Topic not created. Something went wrong"
            redirect(controller: 'user', action: 'dashboard')
        }
    }

    def trendingTopic(){
        def trendT = Topic.listOrderByDateCreated(max: 5).reverse()
        [trendT:trendT]
    }

}