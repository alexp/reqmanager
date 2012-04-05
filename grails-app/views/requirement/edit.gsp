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
        var app = AppUseCase("ud_diagram_div");
      }
    //]]>
  </script>
  <div id='content'>
    
    ${flash.message}
    req edit: ${requirement.id}
    <form method='post' name='update requirement'>
      <g:hiddenField name='id' value='${requirement.id}'></g:hiddenField>
      <div class='code'>
        code:
        <g:textField name='code' style='width: 400px' value='${requirement.code}'></g:textField>
      </div>
      <div class='desc'>
        desc:
        <g:textField name='description' style='width: 400px' value='${requirement.description}'></g:textField>
      </div>
      <div class='stat'>
        stat:
        <g:select from='${statuses}' name='status.id' optionKey='id' value='${requirement.status}'></g:select>
      </div>
      <div class='usecases'>
        <ul>
          <g:each in='${requirement.useCases}' var='useCase'>
            <li>
              ${useCase.title}
            </li>
          </g:each>
        </ul>
        <g:link action='create' controller='useCase' id='${requirement.id}'>
          add use case
        </g:link>
      </div>
      <div class='xml'>
        xml:
        <g:hiddenField id='diagramXml' name='diagramXml' value='${requirement.diagramXml}'></g:hiddenField>
      </div>
      <g:actionSubmit action='update' id='submitbtn' value='Save'></g:actionSubmit>
    </form>
    <div id='menu'>
      <button id='addActor'>
        add actor
      </button>
      <button id='addElement'>
        add element
      </button>
      <button id='addInclude'>
        add include
      </button>
      <button id='addExtend'>
        add extend
      </button>
      <button id='addSystem'>
        add system boundries
      </button>
      <button id='addCommunication'>
        add communication
      </button>
      <button id='deleteElement'>
        X
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