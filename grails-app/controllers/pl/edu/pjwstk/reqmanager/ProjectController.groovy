package pl.edu.pjwstk.reqmanager

import java.io.*;
import com.lowagie.text.DocumentException;
import org.xhtmlrenderer.pdf.ITextRenderer;
import javax.xml.parsers.*
import org.w3c.dom.*

class ProjectController {

    def dataSource
    
    def list = {
      redirect(action:"index")        
    }

    def index = {
      [projects : Project.list()]
    }

    def create = {
      println "tworzę nowy projekt"
      [project : new Project()]
    }

    def save = {
      def project = new Project(params)
      project.timestamp = new java.sql.Timestamp(new java.util.Date().getTime())

      if(project.hasErrors() || !project.save(flush:true)) {
        println "model jest 'zepsuty'"
        flash.message = "nieudany zapis: " + project.errors
        redirect(action: "create")
        return
      }

      println "model jest ok"

      flash.message = "Successfully saved a project"
      redirect(action: "show", id: project.id)
    }

    def show = {
      [project : Project.get(params.id)]
    }

    def edit = {
      [project : Project.get(params.id)]
    }

    def update = {
      def project = Project.get(params.id)

      if(!project) {
        flash.message = "Project ${params.id} not found"
        redirect(action:"index")
        return
      }

      project.properties = params

      if(project.hasErrors() || !project.save(flush:true)) {
        flash.message = "Project ${params.id} could not be saved"
        redirect(action:"edit", id:params.id)
        return
      }

      redirect(action:"show", id:params.id)
      return
    }

    def generateSpec = {
      def s = new SpecWorker()
      s.ds = dataSource

      Document doc = s.generateSpec(params.id)

      ITextRenderer renderer = new ITextRenderer();
      renderer.setDocument(doc, null);
      renderer.layout();
      OutputStream os = response.getOutputStream();
      renderer.createPDF(os);
      os.close();
    }
}
