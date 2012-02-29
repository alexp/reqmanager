package pl.edu.pjwstk.reqmanager

class RequirementController {
  
  def create = {
    [requirement : new Requirement()]
  }

  def save = {

    println "save initiated"
    println params

    def requirement = new Requirement(params)
    def project = Project.get(params.projectId)

    println "requ: ${requirement} ; pro: ${project}"

    requirement.project = project

    if(!requirement.save()) {
      flash.message = "nieudany zapis wymagania"
      render(view: "create", model: [project : project])
      return
    }

    flash.message = "Requirement successfully saved"
    redirect(controller: "project", action: "show", id: project.id)
  }
}