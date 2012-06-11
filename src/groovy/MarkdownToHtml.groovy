package pl.edu.pjwstk.reqmanager

import java.io.*
import com.petebevin.markdown.*
import groovy.sql.Sql

class MarkdownToHtml {

  def ds 

  def MarkdownToHtml() {}

  def printToFile() {
    try {

      def sql = new Sql(this.ds)
      def result = sql.rows("select * from requirement r, project p where project_id = ?", [1])

      println result

      StringBuffer sb = new StringBuffer()
      result.each {

        sb.append("${it.description}")
        sb.append("\n")
       
      }

      println sb.toString()

      String inputFile = "target/firstdoc.xhtml"
      def m = new MarkdownProcessor(); 
      String html = m.markdown(sb.toString()); 

      BufferedWriter out = new BufferedWriter(new FileWriter(inputFile))
      out.write(html)
      out.close()

    } catch (all) {
      throw all
    }
  }
}
