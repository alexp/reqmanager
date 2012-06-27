package pl.edu.pjwstk.reqmanager

import java.io.*
import com.petebevin.markdown.*
import groovy.sql.Sql

class MarkdownToHtml {

  def ds 

  def MarkdownToHtml() {}

  def printToFile(project_id) {
    try {
      def project_name
      def sql = new Sql(this.ds)
      def result = sql.rows("select * from project where id = ?", [project_id as long])

      StringBuffer sb = new StringBuffer()
      result.each {
        
        def requirements = sql.rows("select * from requirement where project_id = ? order by id asc", [it.id])

        sb.append("# ${it.name}\r")
        project_name = it.name
        sb.append("\r")
        sb.append(it.description)
        sb.append("\r")
        sb.append(it.main_note)
        sb.append("\r")
        sb.append("\r")
        sb.append("<hr />")
        sb.append("\r")
        sb.append("# REQUIREMENTS:\r") 
        sb.append("<hr />")
        sb.append("\r")

        requirements.each { r ->
          sb.append("## ${r.code}: ${r.title ?: ''}\r")
          sb.append("\r")
          if(r.diagram_image) {
            sb.append("<div class='diagramImage' id='${r.id}'> </div>")
          }
          sb.append("\r")
          sb.append(r.description)
          sb.append("\r")

          def use_cases = sql.rows("select * from use_case uc, requirement_use_cases ruc where ruc.requirement_id = ? and ruc.use_case_id = uc.id", [r.id])

          if(use_cases) sb.append("> ## USE CASES:\r")

          use_cases.each { u ->
            sb.append("\r")
            sb.append("> * ${u.title}")
            sb.append("\r")
          }

          sb.append("\r")
          sb.append("<br />")
          sb.append("<hr />")
          sb.append("<br />")
          sb.append("\r")
        }
      }

      String inputFile = "target/firstdoc.xhtml"
      def m = new MarkdownProcessor(); 

      StringBuffer sb2 = new StringBuffer()

      sb2.append("<?xml version='1.0' encoding='UTF-8'?>\r")
      sb2.append("<html>")
      sb2.append("<head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'/>")
      sb2.append("<style type='text/css'>.diagramImage { page-break-inside: avoid; width: 600px; height: 600px; display: block;  } .first {font-size: 60px; margin-bottom: 350px;} .projectname {font-style: italic; font-size: 40px; text-align: right; margin-bottom: 500px;}</style>")
      sb2.append("</head>")
      sb2.append("<h1 class='first'>Software Requirements Specification</h1>")
      sb2.append("<h2 class='projectname'>For project: ${project_name}</h2>")

      String html = m.markdown(sb.toString()); 
      sb2.append(html)
      sb2.append("</html>")
  
      PrintWriter out = new PrintWriter("target/firstdoc.xhtml")
      out.write(sb2.toString())
      out.close()

      return sb2.toString() 

    } catch (all) {
      throw all
    }
  }
}
