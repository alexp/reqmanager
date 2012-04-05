package pl.edu.pjwstk.reqmanager

class Actor {

    String name

    static belongsTo = UseCase
    static hasMany = [useCases : UseCase]
    static constraints = {
    }
}
