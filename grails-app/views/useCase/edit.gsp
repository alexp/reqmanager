<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY edit.haml --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Requirement details</title>
    <meta content='main' name='layout' />
  </head>
  <r:require module='ace'></r:require>
  <script type='text/javascript'>
    //<![CDATA[
      window.onload = function() {
      
        $('textarea[class="hideme"]').hide();
      
        $(".editor").each(function() {
          console.log(this.id);
          var editor = ace.edit(this.id);
          editor.setTheme("ace/theme/clouds_midnight");
          var MarkdownMode = require("ace/mode/markdown").Mode;
          editor.getSession().setMode(new MarkdownMode());
          editor.getSession().setUseWrapMode(true);
          var submit = $("#submitbtn");
      
          var that = this;
      
          submit.click(function() {
            var txtName = that.id.split("-")[0];
            console.log(txtName);
            var textarea = $("textarea[id='"+txtName+"']");
            console.log(editor.getSession().getValue());
            textarea.val(editor.getSession().getValue());
            console.log(textarea);
            console.log(textarea.val());
          });
        });
      
      };
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
        actors:
        <g:select from='${pl.edu.pjwstk.reqmanager.Actor.list()}' name='actors' optionKey='id' value='${useCase.actors}'></g:select>
      </div>
      <div id='text-areas'>
        <div class='text'>
          main content:
          <div class='editor' id='main-content-editor'>${useCase.mainContent}</div>
          <g:textArea class='hideme' id='main' name='mainContent' value='${useCase.mainContent}'></g:textArea>
        </div>
        <div class='text'>
          basicFlow:
          <div class='editor' id='basic-flow-editor'>${useCase.basicFlow}</div>
          <g:textArea class='hideme' id='basic' name='basicFlow' value='${useCase.basicFlow}'></g:textArea>
        </div>
        <div class='text'>
          alterFlow:
          <div class='editor' id='alter-flow-editor'>${useCase.alterFlow}</div>
          <g:textArea class='hideme' id='alter' name='alterFlow' value='${useCase.alterFlow}'></g:textArea>
        </div>
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