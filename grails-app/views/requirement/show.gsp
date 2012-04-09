<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY show.haml --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Requirement details</title>
    <meta content='main' name='layout' />
  </head>
  <r:require module='showdown'></r:require>
  <r:require module='ace'></r:require>
  <script type='text/javascript'>
    //<![CDATA[
      window.onload = function() {
        // init empty diagram here and add some functionalities
          var diag = new AppUseCaseRO("container"); 
          var classDiag = new AppClassDiagramRO("container-class"); 
          var converter = new Showdown.converter();
        // init the diagram with xml structure here
      
        var textarea = $("#textarea-description").hide();
        var editor = ace.edit("description");
        var MarkdownMode = require("ace/mode/markdown").Mode;
        editor.setTheme("ace/theme/clouds_midnight");
        editor.getSession().setMode(new MarkdownMode());
        editor.getSession().setUseWrapMode(true);
      
        $("#update").click(function() {
          textarea.val(editor.getSession().getValue()); 
        });
      }
    //]]>
  </script>
  <div class='container-fluid'>
    <h1>
      Requirement: ${requirement.title}
      <small>(${requirement.code})</small>
    </h1>
    <div class='row-fluid'>
      <span class='badge badge-warning'>
        ${requirement.useCases.size()}
      </span>
      <strong>use cases</strong>
      <span class='label'>${requirement.status}</span>
      <g:link action='generateFromXml' class='btn' controller='requirement' id='${params.id}'>
        generate structure from diagram
      </g:link>
      <g:form action='update'>
        <h3>Requirement description:</h3>
        <div>
          <g:actionSubmit action='update' class='btn btn-primary' id='update' value='Update'></g:actionSubmit>
          <!-- %g:actionSubmit(id="edit" action="edit" class="btn btn-warning" value="Edit full requirement") -->
          <g:link action='edit' class='btn btn-warning' controller='requirement' elementId='edit' id='${requirement.id}'>
            Edit full requirement
          </g:link>
        </div>
        <g:hiddenField name='id' value='${requirement.id}'></g:hiddenField>
        <g:hiddenField id='diagramXml' name='diagramXml' value='${requirement.diagramXml}'></g:hiddenField>
        <g:hiddenField id='classDiagramXml' name='classDiagramXml' value='${requirement.classDiagramXml}'></g:hiddenField>
        <g:textArea id='textarea-description' name='description' value='${requirement.description}'></g:textArea>
      </g:form>
      <div class='span5' id='desc-wrapper'>
        <div id='description'>${requirement.description}</div>
      </div>
      <div class='span6 well'>
        <div class='row'>
          <div class='span6'>
            <h3>Use case diagram:</h3>
            <div id='container'>
              <div id='ud_container_div' style='border: 1px solid #000;'>
                <div id='ud_diagram_div' style='position: relative;'>
                  <canvas class='ud_diagram_canvas' id='c1' style='position: absolute;' width='500'></canvas>
                  <canvas class='ud_diagram_canvas' id='c2' style='position: absolute;' width='500'></canvas>
                </div>
                <br style='clear: both;' />
              </div>
            </div>
          </div>
          <div class='span6'>
            <h3>Class diagram:</h3>
            <div id='container-class'>
              <div id='ud2_container_div' style='border: 1px solid #000;'>
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
    <div class='row-fluid'>
      <div class='span5 offset3 useCases'>
        <g:if test='${requirement.useCases}'>
          <h2>Use Cases:</h2>
          <ul class='unstyled'>
            <g:each in='${requirement.useCases}' var='${useCase}'>
              <li class='well'>
                <div class='title'>
                  <h4>
                    ${useCase.title}
                    <small>${useCase.code}</small>
                  </h4>
                </div>
                <div class='maincontent'>
                  <script type='text/javascript'>
                    //<![CDATA[
                      var text = converter.makeHtml(${useCase.mainContent});
                      console.log(text)
                    //]]>
                  </script>
                  ${useCase.mainContent}
                </div>
                <div class='actions'>
                  <g:link action='show' class='btn' controller='useCase' id='${useCase.id}'>show</g:link>
                  <g:link action='edit' class='btn' controller='useCase' id='${useCase.id}'>edit</g:link>
                </div>
              </li>
            </g:each>
          </ul>
        </g:if>
      </div>
    </div>
  </div>
</html>