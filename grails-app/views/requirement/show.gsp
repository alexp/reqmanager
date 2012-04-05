<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY show.haml --%>
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
          var diag = new AppUseCaseRO("container"); 
        // init the diagram with xml structure here
      }
    //]]>
  </script>
  <div id='content'>
    
    ${flash.message}
    
    <h1>
      Requirement #${requirement.id}
    </h1>
    <div class='code'>
      code: ${requirement.code}
    </div>
    <div class='desc'>
      description: ${requirement.description}
    </div>
    <div class='status'>
      status: ${requirement.status}
    </div>
    <g:hiddenField id='diagramXml' name='diagramXml' value='${requirement.diagramXml}'></g:hiddenField>
    <g:link action='generateFromXml' controller='requirement' id='${params.id}'>
      generate structure from diagram
    </g:link>
    <div class='useCases'>
      <g:if test='${requirement.useCases}'>
        <h2>
          Use Cases:
        </h2>
        <ul>
          <g:each in='${requirement.useCases}' var='${useCase}'>
            <li>
              <div class='id'>
                id: ${useCase.id}
              </div>
              <div class='code'>
                code: ${useCase.code}
              </div>
              <div class='title'>
                title: ${useCase.title}
              </div>
              <div class='actor'>
                actor: ${useCase.actors}
              </div>
              <div class='maincontent'>
                maincontent: ${useCase.mainContent}
              </div>
            </li>
          </g:each>
        </ul>
      </g:if>
    </div>
    <g:link action='edit' controller='requirement' id='${params.id}'>
      edytuj
    </g:link>
    <div id='container'>
      <div id='ud_container_div' style='border: 1px solid #000;'>
        <div id='ud_diagram_div' style='position: relative;'>
          <canvas class='ud_diagram_canvas' id='c1' style='position: absolute;' width='1000'></canvas>
          <canvas class='ud_diagram_canvas' id='c2' style='position: absolute;' width='1000'></canvas>
        </div>
        <br style='clear: both;' />
      </div>
    </div>
  </div>
</html>