package pl.edu.pjwstk.reqmanager

class RequirementController {
  
  def create = {
    Status s1 = new Status(name:"must-have")
    Status s2 = new Status(name:"optional")

    s1.save(flush: true)
    s2.save(flush: true)

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
    [requirement : requirement, statuses:Status.list()]
  }

  def update = {
    def requirement = Requirement.get(params.id)
    def statuses = Status.list()
    
    println params

    if(requirement) {
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
}

