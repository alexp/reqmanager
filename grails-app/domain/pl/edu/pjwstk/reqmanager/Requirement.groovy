package pl.edu.pjwstk.reqmanager

class Requirement {

    static belongsTo = Project
    Project project

    String name

    static constraints = {
    }

    String toString() {
      println name
    }
}
