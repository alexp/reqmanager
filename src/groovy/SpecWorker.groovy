package pl.edu.pjwstk.reqmanager

import java.io.*;
import com.lowagie.text.DocumentException;
import org.xhtmlrenderer.pdf.ITextRenderer;
import javax.xml.parsers.*
import org.w3c.dom.*

class SpecWorker {

  def ds

  SpecWorker() {}

  def generateSpec(project_id) {

    def m = new MarkdownToHtml()
    m.ds = ds
    String html = m.printToFile(project_id)
    
//    DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
//    Document doc = builder.parse(new ByteArrayInputStream(html.getBytes("UTF-8")))

    return html
  }
}
