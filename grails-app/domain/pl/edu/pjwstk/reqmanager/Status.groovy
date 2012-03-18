package pl.edu.pjwstk.reqmanager

class Status {

    String name

    static hasMany = [requirements : Requirement]

    static constraints = {
    }

    String toString() {
      name
    }
}
