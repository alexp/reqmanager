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
      
        var reqId = $("#id").val();
        var reqUseCases = $.ajax({
          type: "GET",
          url: "http://localhost:8080/reqmanager/requirement/getUseCases/" + reqId,
          cache: false
        }).done(function(xht){ 
          var dom = (new DOMParser()).parseFromString(diag.diagram.getXMLString(), "text/xml");
          var documentEle = dom.documentElement;
          var usecaseArray = documentEle.getElementsByTagName('UMLUseCase');
          console.log("usecaseArray: " + usecaseArray);
      
          console.log(diag.diagram);
          for(var i = 0; i < usecaseArray.length; i++) {
      
            console.log(usecaseArray[i].childNodes);
      
            for(var j = 0; j < usecaseArray[i].childNodes.length; j++) {
      
              console.log(usecaseArray[i].childNodes[j]);
              var itemValue = usecaseArray[i].childNodes[j].attributes.value;
      
              if(itemValue != undefined) {
      
                console.log("ITEM VALUE: " + itemValue.value);
                console.log("XHT: " + xht);
                console.log("xht array: " + xht[0]);
      
                console.log("INDEX OF: " + xht.indexOf(itemValue.value.toString()));
      
                if(xht.indexOf(itemValue.value.toString()) != -1) {
      
                  console.log("THISISIT!!!!! : ");
                  console.log(usecaseArray[i]);
      
                  var divv = document.getElementById("ud_diagram_div");
                  var foundUseCase = null;
      
                  for(var k = 0; k < diag.diagram._nodes.length; k++) {
                    if(diag.diagram._nodes[k].getName().toString() === xht[xht.indexOf(itemValue.value.toString())]) {
                      foundUseCase = diag.diagram._nodes[k]; 
                    }
                  };
      
                  console.log(foundUseCase);
      
                  if(foundUseCase) foundUseCase.setBackgroundColor("#F3F5BC");
                  diag.diagram.draw();
                }
              }
            }
      
          }
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
        <g:hiddenField id='diagramXml' name='diagram.xmlString' value='${requirement.diagram?.xmlString}'></g:hiddenField>
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
          <div class='span6'></div>
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