package pl.edu.pjwstk.reqmanager

class UseCase {
  
    String title
    String code
    Actor primaryActor
    String diagramXml
    
    static belongsTo = [requirement : Requirement]

    static mapping = {
      diagramXml type: SQLXMLType
    }
    
    static constraints = {
      diagramXml(nullable: true)
    }
}
