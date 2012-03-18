package pl.edu.pjwstk.reqmanager

class Requirement {

    Project project
    Status status
    String description 
    String code
        
    static hasMany = [useCases : UseCase]

    static constraints = {
    }

    String toString() {
      println code + " " + 
        status + " " + 
        description 
    }
}
