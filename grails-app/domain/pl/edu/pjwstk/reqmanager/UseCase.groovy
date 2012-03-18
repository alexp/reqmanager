package pl.edu.pjwstk.reqmanager

class UseCase {
  
    String title
    String code
    Actor primaryActor
    
    static belongsTo = [requirement : Requirement]

    static constraints = {
    }
}
