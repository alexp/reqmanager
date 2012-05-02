package pl.edu.pjwstk.reqmanager

public class Diagram {
  String name
  String xmlString

  static mapping = {
    xmlString type: SQLXMLType
  }

  static constraints = {
    name(nullable:true)
  }

  String toString() {
    name ?: "untitled diagram"
  }
}
