package pl.edu.pjwstk.reqmanager

class Project {

    String name
    String description
    java.sql.Timestamp timestamp
    java.util.Date deadline

    static hasMany = [requirements:Requirement]

    static constraints = {
      deadline(nullable: true)
    }
}
