package pl.edu.pjwstk.reqmanager

import java.io.*;
import com.lowagie.text.DocumentException;
import org.xhtmlrenderer.pdf.ITextRenderer;

class SpecWorker {

  def ds

  SpecWorker() {}

  def generateSpec() {

    def m = new MarkdownToHtml()
    m.ds = ds
    m.printToFile()

    String inputFile = "target/firstdoc.xhtml";
    String url = new File(inputFile).toURI().toURL().toString();
    String outputFile = "target/firstdoc.pdf";
    OutputStream os = new FileOutputStream(outputFile);

    ITextRenderer renderer = new ITextRenderer();
    renderer.setDocument(url);
    renderer.layout();
    renderer.createPDF(os);

    os.close();
  }
}
