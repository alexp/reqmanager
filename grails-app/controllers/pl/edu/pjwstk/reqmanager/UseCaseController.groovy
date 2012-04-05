package pl.edu.pjwstk.reqmanager

class UseCaseController {

    def create = {
      def useCase = new UseCase()
      [useCase : useCase]
    }

    def save = {
      def useCase = new UseCase(params)
      def actor = new Actor(params.actor)

      if(actor && !useCase.actors.contains(actor)) {
        useCase.addToActors(actor)
      }

      if(!useCase.save(flush: true)) {
        flash.message = "nieudany zapis usecase'u"

        render(view: "create")
        return
      }

      flash.message = "Zapisano Use Case"
      redirect(controller: "requirement", action: "show", id:useCase.requirement.id)
    }

    def edit = {
      def useCase = UseCase.get(params.id)

      if(!useCase) {
        flash.message = "Use Case ${params.id} not found!"

        redirect(controller: "project", action: "index")
        return
      }

      [useCase : useCase]
    }

    def update = {
      def useCase = UseCase.get(params.id)

      if(!useCase) {
        flash.message = "Use Case ${params.id} not found!"

        redirect(controller: "project", action: "index")
        return
      }
     
      params.diagramXml = params.diagramXml.trim()
      useCase.properties = params

      if(!useCase.hasErrors() && useCase.save(flush:true)) {
        flash.message = "Successfully updated use case ${params.id}"
        render(view:"edit", model:[useCase:useCase])
      } else {
        flash.message = "Error writing useCase ${params.id}"
      }
    }
}
