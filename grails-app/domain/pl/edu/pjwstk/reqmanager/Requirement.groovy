package pl.edu.pjwstk.reqmanager

class Requirement {

    Project project
    Status status
    String title 
    String description 
    String code
    String diagramXml
        
    static hasMany = [useCases : UseCase]

    static mapping = {
      diagramXml type: SQLXMLType
    }

    static constraints = {
      diagramXml(nullable: true)
      title(nullable: true)
    }

    String toString() {
      println code + " " + 
        status + " " + 
        description 
    }

    def generateFromXml() {
      def xml = new XmlSlurper().parseText(this.diagramXml)

      def actors = xml.UMLSystem.UMLActor.item.each { xmlItem ->
        def actor = Actor.findByName(xmlItem.@value.text())
      }

      def useCases = xml.UMLSystem.UMLUseCase.item.each { xmlItem -> 
        def useCase = UseCase.findByTitle(xmlItem.@value.text())
        if(useCase != null) {
          if(!this.useCases.contains(useCase)) {
            this.addToUseCases(UseCase.get(useCase))
          }
        } else {
          this.addToUseCases(new UseCase(title: xmlItem.@value.text(), code: "newUC")) 
        }
      }

    }
}
