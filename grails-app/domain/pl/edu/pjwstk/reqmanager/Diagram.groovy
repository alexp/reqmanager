package pl.edu.pjwstk.reqmanager

public class Diagram {
  String name
  String xmlString

  static belongsTo = Requirement
  static mapping = {
    xmlString type: SQLXMLType
  }

  static constraints = {
    name(nullable:true)
  }
}
