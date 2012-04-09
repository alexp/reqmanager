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
        var app = new AppUseCase("ud_diagram_div");
        var appCD = new AppClassDiagram("ud2_diagram_div");
        var textarea = $("textarea[name='description']").hide();
        var editor = ace.edit("description");
        var MarkdownMode = require("ace/mode/markdown").Mode;
        editor.setTheme("ace/theme/clouds_midnight");
        editor.getSession().setMode(new MarkdownMode());
        editor.getSession().setUseWrapMode(true);
      
        $("#submitbtn").click(function() {
          textarea.val(editor.getSession().getValue()); 
          $("#diagramXml").val(app.diagram.getXMLString());
          $("#classDiagramXml").val(appCD.diagram.getXMLString());
        });
      }
    //]]>
  </script>
  <div class='container-fluid'>
    <div class='row-fluid'>
      <div class='span5'>
        <h1>
          ${requirement.title} #${requirement.id}
        </h1>
        <form class='form-horizontal' method='post' name='update requirement'>
          <g:hiddenField name='id' value='${requirement.id}'></g:hiddenField>
          <g:hiddenField id='diagramXml' name='diagramXml' value='${requirement.diagramXml}'></g:hiddenField>
          <g:hiddenField id='classDiagramXml' name='classDiagramXml' value='${requirement.classDiagramXml}'></g:hiddenField>
          <fieldset class='well'>
            <div class='control-group'>
              <label class='control-label' for='code'>
                Requirement code:
              </label>
              <div class='controls'>
                <g:textField class='input-xlarge' elementId='code' name='code' value='${requirement.code}'></g:textField>
                <p class='help-block'>Docelowo, to będzie nadawane automatycznie</p>
              </div>
            </div>
            <div class='control-group'>
              <label class='control-label' for='title'>
                Title:
              </label>
              <div class='controls'>
                <g:textField class='input-xlarge' elementId='title' name='title' value='${requirement.title}'></g:textField>
              </div>
            </div>
            <div class='control-group'>
              <label class='control-label' for='select'>
                Requirement status:
              </label>
              <div class='controls'>
                <g:select class='input-xlarge' elementId='select' from='${statuses}' name='status.id' optionKey='id' value='${requirement.status}'></g:select>
              </div>
            </div>
            <div class='control-group'>
              <label>
                Description:
              </label>
              <div id='desc-wrapper'>
                <div id='description'>${requirement.description}</div>
              </div>
              <div class='controls'>
                <g:textArea class='input-xlarge span5' elementId='desc' name='description' value='${requirement.description}'></g:textArea>
              </div>
            </div>
            <div class='form-actions'>
              <g:actionSubmit action='update' class='btn btn-primary' id='submitbtn' value='Save changes'></g:actionSubmit>
              or
              <g:link action='show' controller='requirement' id='${requirement.id}'>cancel</g:link>
            </div>
          </fieldset>
        </form>
      </div>
      <div class='span7'>
        <div class='row'>
          <div class='span7'>
            <div id='menu'>
              <div class='btn-group'>
                <button class='btn' id='addActor'>
                  add actor
                </button>
                <button class='btn' id='addElement'>
                  add element
                </button>
                <button class='btn' id='addInclude'>
                  add include
                </button>
                <button class='btn' id='addExtend'>
                  add extend
                </button>
                <button class='btn' id='addSystem'>
                  add system boundries
                </button>
                <button class='btn' id='addCommunication'>
                  add communication
                </button>
                <button class='btn' id='deleteElement'>
                  X
                </button>
              </div>
            </div>
            <div id='ud_container_div' style='border: 1px solid #000; margin-top: 10px'>
              <div id='ud_diagram_div' style='position: relative;'>
                <canvas class='ud_diagram_canvas' id='c1' style='position: absolute;' width='500'></canvas>
                <canvas class='ud_diagram_canvas' id='c2' style='position: absolute;' width='500'></canvas>
              </div>
              <br style='clear: both;' />
            </div>
          </div>
        </div>
        <div class='row'>
          <div class='span7'>
            <div id='menu'>
              <div class='btn-group'>
                <button class='btn' id='addClass'>add class</button>
                <button class='btn' id='addAssoc'>add assoc</button>
                <button class='btn' id='CDdeleteElement'>X</button>
              </div>
            </div>
            <div id='ud2_container_div' style='border: 1px solid #000; margin-top: 10px'>
              <div id='ud2_diagram_div' style='position: relative;'>
                <canvas class='ud2_diagram_canvas' id='c11' style='position: absolute;' width='500'></canvas>
                <canvas class='ud2_diagram_canvas' id='c22' style='position: absolute;' width='500'></canvas>
              </div>
              <br style='clear: both;' />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</html>