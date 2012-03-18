package pl.edu.pjwstk.reqmanager

class UseCaseController {

    def create = {
      def useCase = new UseCase()
      [useCase : useCase]
    }

    def save = {
      def useCase = new UseCase(params)
      def actor = new Actor(params.actor)

      if(actor) {
        useCase.primaryActor = actor
      }

      if(!useCase.save(flush: true)) {
        flash.message = "nieudany zapis usecase'u"
        render(view: "create")
        return
      }

      flash.message = "Zapisano Use Case"
      redirect(controller: "requirement", action: "show", id:useCase.requirement.id)
    }
}
