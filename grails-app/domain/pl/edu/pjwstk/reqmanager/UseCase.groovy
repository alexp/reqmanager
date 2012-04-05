package pl.edu.pjwstk.reqmanager

class UseCase {
  
    String title
    String code
    //Actor primaryActor
    String diagramXml
    String mainContent
    
    static hasMany = [actors : Actor]
    static belongsTo = [requirement : Requirement]

    static mapping = {
      diagramXml type: SQLXMLType
    }
    
    static constraints = {
      diagramXml(nullable: true)
      mainContent(nullable: true)
    }
}
