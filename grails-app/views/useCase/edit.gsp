<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY edit.haml --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Requirement details</title>
    <meta content='main' name='layout' />
  </head>
  <script type='text/javascript'>
    //<![CDATA[
      window.onload = function() {
        // init empty diagram here and add some functionalities
          var diag = new AppUseCase("container"); 
        // init the diagram with xml structure here
      }
    //]]>
  </script>
  <div id='content'>
    
    ${flash.message}
    
    <h1>
      Edit Use Case #${useCase.id}
    </h1>
    <g:form method='post'>
      <g:hiddenField name='id' value='${useCase.id}'></g:hiddenField>
      <div class='code'>
        code:
        <g:textField name='code' value='${useCase.code}'></g:textField>
      </div>
      <div class='title'>
        title:
        <g:textField name='title' value='${useCase.title}'></g:textField>
      </div>
      <div class='actor'>
        actor:
        <g:select from='${pl.edu.pjwstk.reqmanager.Actor.list()}' name='primaryActor.id' optionKey='id' value='${useCase.primaryActor}'></g:select>
      </div>
      <div class='xml'>
        xml:
        <!-- %g:textArea(id="xmlValue" name="diagramXml" value="${useCase.diagramXml}") -->
        <g:hiddenField id='diagramXml' name='diagramXml' value='${useCase.diagramXml}'></g:hiddenField>
      </div>
      <g:actionSubmit action='update' id='submitbtn' value='Zapisz'></g:actionSubmit>
    </g:form>
    <div id='menu'>
      <button id='addElement'>
        dodaj element
      </button>
      <button id='addInclude'>
        dodaj include
      </button>
      <button id='addExtend'>
        dodaj extend
      </button>
    </div>
    <div id='ud_container_div' style='border: 1px solid #000;'>
      <div id='ud_diagram_div' style='position: relative;'>
        <canvas class='ud_diagram_canvas' id='c1' style='position: absolute;' width='1000'></canvas>
        <canvas class='ud_diagram_canvas' id='c2' style='position: absolute;' width='1000'></canvas>
      </div>
      <br style='clear: both;' />
    </div>
  </div>
</html>