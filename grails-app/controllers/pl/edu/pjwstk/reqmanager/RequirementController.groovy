package pl.edu.pjwstk.reqmanager

class RequirementController {
  
  def create = {
    [requirement : new Requirement(), statuses:Status.list()]
  }

  def save = {

    println "save initiated"
    println params

    def requirement = new Requirement(params)

    println "requ: ${requirement} ; pro: ${requirement.project}"

    if(!requirement.save(flush: true)) {
      flash.message = "nieudany zapis wymagania"
      println requirement.errors
      render(view: "create")
      return
    }

    flash.message = "Requirement successfully saved"
    redirect(controller: "project", action: "show", id: requirement.project.id)
  }

  def edit = {
    def requirement = Requirement.get(params.id)

    if(!requirement) {
      flash.message = "Requirement ${params.id} not found"
      redirect(controller: "project", action:"index")
    }

    [requirement : requirement, statuses:Status.list()]
  }

  def update = {
    def requirement = Requirement.get(params.id)
    def statuses = Status.list()
    
    println params

    if(requirement) {
      params.diagramXml = params.diagramXml.trim()
      requirement.properties = params

      if(!requirement.hasErrors() && requirement.save()) {
        flash.message = "Requirement ${params.id} successfully updated"
        render(view:"edit", model:[requirement:requirement, statuses:statuses])
        return
      } else {
        flash.message = "Requirement ${params.id} not updated"
        render(view:"edit", model:[requirement:requirement, statuses:statuses])
        return
      }
    } else {
      flash.message = "Requirement with id ${params.id} not found"
      redirect(action:"edit", id:params.id)
    }
  }

  def show = {
    [requirement : Requirement.get(params.id)] 
  }

  def generateFromXml() {
    def requirement = Requirement.get(params.id)

    requirement.generateFromXml()
    if(requirement.save(flush:true)) {
      flash.message = "saved objects from xml"
    } else {
      flash.message = "error while saving objects from xml"
      println requirement.errors
    }

    redirect(controller:"requirement", action:"show", id:params.id)
  }
}

