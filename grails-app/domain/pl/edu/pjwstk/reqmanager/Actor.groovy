package pl.edu.pjwstk.reqmanager

class Actor {

    String name

    static belongsTo = [useCase : UseCase]
    static constraints = {
    }
}
