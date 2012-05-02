package pl.edu.pjwstk.reqmanager

class UseCase {
  
    String title
    String code
    String mainContent
    String basicFlow
    String alterFlow
    String preConditions
    String postConditions
    
    static hasMany = [actors:Actor, requirements:Requirement]
    static belongsTo = Requirement

    static constraints = {
      mainContent(nullable: true)
      basicFlow(nullable: true)
      alterFlow(nullable: true)
      preConditions(nullable: true)
      postConditions(nullable: true)
    }
}
