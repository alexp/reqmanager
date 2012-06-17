package pl.edu.pjwstk.reqmanager

class Project {

    String name
    String description
    String mainNote
    java.sql.Timestamp timestamp
    java.util.Date deadline

    static hasMany = [requirements:Requirement]

    static constraints = {
      deadline(nullable: true)
      mainNote(nullable: true)
    }

    static mapping = {
      mainNote type: 'text'
      description type: 'text'
    }

    def countUseCases() {
      def number=0

      requirements.each {
        number += it.useCases.size()
      }

      return number
    }
}
