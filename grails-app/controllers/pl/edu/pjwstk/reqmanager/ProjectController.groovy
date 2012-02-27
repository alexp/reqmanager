package pl.edu.pjwstk.reqmanager

class ProjectController {

    def index = {
      [projects : Project.list()]
    }

    def create = {
      [project : new Project()]
    }

    def save = {
      def project = new Project(params)
      project.timestamp = new java.sql.Timestamp(new java.util.Date().getTime())

      if(!project.save(flush:true)) {
        flash.message = "nie udany zapis"
        println "nie nie nie nie"
        println project.errors
        render(view: "create", model: [project : project])
        return
      }

      flash.message = "Successfully saved a project"
      redirect(action: "show", id: project.id)
    }

    def show = {
      [project : Project.get(params.id)]
    }
}
