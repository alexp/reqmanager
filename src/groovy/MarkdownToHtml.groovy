package pl.edu.pjwstk.reqmanager

import java.io.*
import com.petebevin.markdown.*
import groovy.sql.Sql

class MarkdownToHtml {

  def ds 

  def MarkdownToHtml() {}

  def printToFile(project_id) {
    try {

      def sql = new Sql(this.ds)
      def result = sql.rows("select * from project where id = ?", [project_id as long])

      StringBuffer sb = new StringBuffer()
      result.each {
        
        def requirements = sql.rows("select * from requirement where project_id = ?", [it.id])

        sb.append("# ${it.name}\r")
        sb.append("\r")
        sb.append(it.description)
        sb.append("\r")
        sb.append("## Main project note \r")
        sb.append(it.main_note)
        sb.append("\r")
        sb.append("## REQUIREMENTS:\r") 

        requirements.each { r ->
          sb.append("## ${r.code}: ${r.title ?: 'trololo'}\r")
          sb.append("\r")
          sb.append(r.description)
          sb.append("\r")

          def use_cases = sql.rows("select * from use_case uc, requirement_use_cases ruc where ruc.requirement_id = ? and ruc.use_case_id = uc.id", [r.id])

          if(use_cases) sb.append("## USE CASES:\r")

          use_cases.each { u ->
            sb.append("### ${u.code}: ${u.title}")
            sb.append("\r")
          }
        }
       
      }

      String inputFile = "target/firstdoc.xhtml"
      def m = new MarkdownProcessor(); 

      StringBuffer sb2 = new StringBuffer()

      sb2.append("<?xml version='1.0' encoding='UTF-8'?>\r")
      sb2.append("<html>")
      sb2.append("<head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'/></head>")

      String html = m.markdown(sb.toString()); 
      
      sb2.append(html)
      sb2.append("</html>")

      return sb2.toString() 

    } catch (all) {
      throw all
    }
  }
}
