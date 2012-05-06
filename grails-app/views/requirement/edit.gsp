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
        var textarea = $("textarea[name='description']").hide();
        var editor = ace.edit("description");
        var MarkdownMode = require("ace/mode/markdown").Mode;
        editor.setTheme("ace/theme/clouds_midnight");
        editor.getSession().setMode(new MarkdownMode());
        editor.getSession().setUseWrapMode(true);
      
        var reqId = $("#id").val();
        var reqUseCases = $.ajax({
          type: "GET",
          url: "http://localhost:8080/reqmanager/requirement/getUseCases/" + reqId,
          cache: false
        }).done(function(xht){ 
          var dom = (new DOMParser()).parseFromString(app.diagram.getXMLString(), "text/xml");
          var documentEle = dom.documentElement;
          var usecaseArray = documentEle.getElementsByTagName('UMLUseCase');
          console.log("usecaseArray: " + usecaseArray);
      
          console.log(app.diagram);
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
      
                  for(var k = 0; k < app.diagram._nodes.length; k++) {
                    if(app.diagram._nodes[k].getName().toString() === xht[xht.indexOf(itemValue.value.toString())]) {
                      foundUseCase = app.diagram._nodes[k]; 
                    }
                  };
      
                  console.log(foundUseCase);
      
                  if(foundUseCase) foundUseCase.setBackgroundColor("#F3F5BC");
                  app.diagram.draw();
                }
              }
            }
      
          }
      
        });
      
        var div = document.getElementById("ud_diagram_div");
        /*$("#ud_diagram_div").click(function() {
          var mouseX = event.pageX - div.offsetLeft;
          var mouseY = event.pageY - div.offsetTop;
          console.log("mouseX :" + mouseX + " mouseY:" + mouseY); 
          console.log(app.diagram.getElementByPoint(mouseX, mouseY));
          var ele = app.diagram.getElementByPoint(mouseX, mouseY);
          console.log(ele.getName());
          ele.setBackgroundColor("#F3F5BC");
          app.diagram.draw();
        });*/
      
        $("#submitbtn").click(function() {
          textarea.val(editor.getSession().getValue()); 
          $("#diagramXml").val(app.diagram.getXMLString());
        });
      
        console.log("reqUseCases: " + reqUseCases);
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
          <g:hiddenField id='diagramXml' name='diagram.xmlString' value='${requirement.diagram?.xmlString}'></g:hiddenField>
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
                <button class='btn' id='markForRequirement'>
                  mark for requirement
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
      </div>
    </div>
  </div>
</html>