package pl.edu.pjwstk.reqmanager

class Requirement {

    Project project
    Status status
    String title 
    String description 
    String code
    
    Diagram diagram
    static hasMany = [useCases : UseCase]

    static constraints = {
      title(nullable: true)
      diagram(nullable: true)
    }

    def generateFromXml() {
      def xml = new XmlSlurper().parseText(this.diagram.xmlString)

      xml.UMLSystem.UMLUseCase.item.each { xmlItem -> 
        def useCase = UseCase.findByTitle(xmlItem.@value.text())
        if(useCase != null) {
          println useCase
          if(!((this.useCases.collect{it.id}).contains(useCase.id))) {
            println this.useCases
            println "doesnt contain"
            println useCase
            this.addToUseCases(UseCase.get(useCase.id))
            println "added ${useCase.id}"
          }
        } else {
          println "GOOOOD MORNING VIETNAM"
          this.addToUseCases(new UseCase(title: xmlItem.@value.text(), code: "newUC")) 
        }
      }
    }
}
