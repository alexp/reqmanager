package pl.edu.pjwstk.reqmanager

class Project {

    String name
    String description
    java.sql.Timestamp timestamp
    java.sql.Date deadline

    static hasMany = [requirements:Requirement]

    static constraints = {
    }
}
