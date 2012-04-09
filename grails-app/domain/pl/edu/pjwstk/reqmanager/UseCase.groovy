package pl.edu.pjwstk.reqmanager

class UseCase {
  
    String title
    String code
    String diagramXml
    String mainContent
    String basicFlow
    String alterFlow
    String preConditions
    String postConditions
    
    static hasMany = [actors:Actor, requirements:Requirement]
    static belongsTo = Requirement

    static mapping = {
      diagramXml type: SQLXMLType
    }
    
    static constraints = {
      diagramXml(nullable: true)
      mainContent(nullable: true)
      basicFlow(nullable: true)
      alterFlow(nullable: true)
      preConditions(nullable: true)
      postConditions(nullable: true)
    }
}
