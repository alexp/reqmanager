<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY edit.haml --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Requirement details</title>
    <meta content='main' name='layout' />
  </head>
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
        actors:
        <g:select from='${pl.edu.pjwstk.reqmanager.Actor.list()}' name='actors' optionKey='id' value='${useCase.actors}'></g:select>
      </div>
      <div class='maincontent'>
        main content:
        <g:textArea name='mainContent' style='width: 400px' value='${useCase.mainContent}'></g:textArea>
      </div>
      <div class='basicFlow'>
        basicFlow:
        <g:textArea name='basicFlow' style='width: 400px' value='${useCase.mainContent}'></g:textArea>
      </div>
      <div class='alterFlow'>
        alterFlow:
        <g:textArea name='alterFlow' style='width: 400px' value='${useCase.alterFlow}'></g:textArea>
      </div>
      <div class='xml'>
        xml:
        <!-- %g:textArea(id="xmlValue" name="diagramXml" value="${useCase.diagramXml}") -->
        <g:hiddenField id='diagramXml' name='diagramXml' value='${useCase.diagramXml}'></g:hiddenField>
      </div>
      <g:actionSubmit action='update' id='submitbtn' value='Save'></g:actionSubmit>
    </g:form>
  </div>
</html>