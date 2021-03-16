package linksharing3

class Subscription {

    Date dateCreated
    enum Seriousness{
        CASUAL,SERIOUS,VERY_SERIOUS;
        def convertValue(String val){
            if(val=='CASUAL'){
                return Seriousness.CASUAL
            }else if (val=='SERIOUS'){
                return Seriousness.SERIOUS
            }else{
                return Seriousness.VERY_SERIOUS
            }
        }
    }
    Seriousness seriousness;

    static belongsTo = [user:User,topic:Topic]

    static constraints = {
        user unique:'topic'
    }
}
