$(document).ready(function() {
  console.log('jquery initialized');
});

// read-only version for requirement view
var AppUseCaseRO = function(elementId) {

  this.parent = document.getElementById(elementId); 
  var submit = document.getElementById('submitbtn');
  var xmlstr = document.getElementById('diagramXml').value;
  var ucDiag = new UMLUseCaseDiagram();
  ucDiag._alone = true;

  if(xmlstr) {
    ucDiag.setXMLString(xmlstr);
  }
  
  var c1 = document.getElementById('c1');
  var c = c1.getContext('2d');
  var c2 = document.getElementById('c2');
  c2.onmousedown = function() { return false; };
  var mc = c2.getContext('2d');
  
  var div = document.getElementById('ud_diagram_div');

  console.log(ucDiag.initialize(10, div, c, mc, 600, 1000));
  ucDiag.setUpdateHeightCanvas(true);
  ucDiag.draw();
  ucDiag.interaction(false);
  this.diagram = ucDiag;
}

var AppUseCase = function(elementId) {
  this.parent = document.getElementById(elementId); 

  var submit = document.getElementById('submitbtn');
  var xmlstr = document.getElementById('diagramXml').value;

  submit.onclick = function() {
    console.log('submit leci z use case');
    var hiddenField = document.getElementById('diagramXml');
    hiddenField.value = ucDiag.getXMLString();
    xmlstr = hiddenField.value;

    // ustaw wszystkie tla na biale
    for(var k = 0; k < ucDiag._nodes.length; k++) {
      console.log(ucDiag._nodes[k]);
      console.log(ucDiag._nodes[k].getType());
      if(ucDiag._nodes[k].getType() === "UMLUseCase") {
        ucDiag._nodes[k].setBackgroundColor("#ffffff");
      }
    }
  }

  //var ucDiag = new UMLUseCaseDiagram({id: 'ud_diagram_div', width: '600', height: '300'});
  var ucDiag = new UMLUseCaseDiagram();
  ucDiag._alone = true;

  if(xmlstr) {
    ucDiag.setXMLString(xmlstr);
  }
  
  var c1 = document.getElementById('c1');
  var c = c1.getContext('2d');
  var c2 = document.getElementById('c2');
  c2.onmousedown = function() { return false; };
  var mc = c2.getContext('2d');
  
  var div = document.getElementById('ud_diagram_div');

  console.log(ucDiag.initialize(11, div, c, mc, 600, 1000));
  ucDiag.setUpdateHeightCanvas(true);

  var button = document.getElementById('addElement');
  button.onclick = function() {
    ucDiag.addElement(UMLUseCase({x:20, y: 140}));
    ucDiag.draw();
  }

  button = document.getElementById('addInclude');

  button.onclick = function(e) {
    
    var x1 = 0, y1 = 0;
    ucDiag.interaction(false);
    var first = true;

    document.getElementById(div.id).style.cursor = "crosshair";
    
    var doubleClick = function(e) {

      var mousex = event.pageX - div.offsetLeft;
      var mousey = event.pageY - div.offsetTop;

      if(first) {
        first = false;
        console.log('first click');
        x1 = mousex;
        y1 = mousey;
      } else {
        console.log('second click');
        ucDiag.addRelationFromPoints(new UMLInclude(), x1, y1, mousex, mousey);
        div.onclick = false;

        ucDiag.draw();
        ucDiag.interaction(true);
        document.getElementById(div.id).style.cursor = "auto";
      }
    }

    div.onclick = doubleClick;
  }

  button = document.getElementById('addExtend');

  button.onclick = function(e) {
    document.getElementById(div.id).style.cursor = "crosshair";
    var x1 = 0, y1 = 0;
    ucDiag.interaction(false);
    var first = true;

    var doubleClick = function(e) {

      var mousex = event.pageX - div.offsetLeft;
      var mousey = event.pageY - div.offsetTop;

      if(first) {
        first = false;
        console.log('first click');
        x1 = mousex;
        y1 = mousey;
      } else {
        console.log('second click');
        ucDiag.addRelationFromPoints(new UMLExtend(), x1, y1, mousex, mousey);
        div.onclick = false;

        ucDiag.draw();
        ucDiag.interaction(true);
        document.getElementById(div.id).style.cursor = "auto";
      
      }
    }

    div.onclick = doubleClick;
  }

  button = document.getElementById('addActor');

  button.onclick = function(e) {

    ucDiag.interaction(false);

    var singleClick = function(e) {

      var mousex = event.pageX - div.offsetLeft;
      var mousey = event.pageY - div.offsetTop;

      ucDiag.addElement(new UMLActor({x:mousex, y:mousey}));
      div.onclick = false;

      ucDiag.draw();
      ucDiag.interaction(true);
    }

    div.onclick = singleClick;
  }

  button = document.getElementById('addSystem');

  button.onclick = function(e) {

    ucDiag.interaction(false);

    var singleClick = function(e) {

      var mousex = event.pageX - div.offsetLeft;
      var mousey = event.pageY - div.offsetTop;

      ucDiag.addElement(new UMLSystem({x:mousex, y:mousey}));
      div.onclick = false;

      ucDiag.draw();
      ucDiag.interaction(true);
    }

    div.onclick = singleClick;
  }
  
  button = document.getElementById('deleteElement');

  button.onclick = function(e) {

    ucDiag.interaction(false);

    var singleClick = function(e) {

      var mousex = event.pageX - div.offsetLeft;
      var mousey = event.pageY - div.offsetTop;

      ucDiag.delElement(ucDiag.getElementByPoint(mousex, mousey));
      div.onclick = false;

      ucDiag.draw();
      ucDiag.interaction(true);
      //return false;
    }

    div.onclick = singleClick;
  }

  button = document.getElementById('addCommunication');

  button.onclick = function(e) {
    var x1 = 0, y1 = 0;
    ucDiag.interaction(false);
    var first = true;

    var doubleClick = function(e) {

      var mousex = event.pageX - div.offsetLeft;
      var mousey = event.pageY - div.offsetTop;

      if(first) {
        first = false;
        console.log('first click');
        x1 = mousex;
        y1 = mousey;
      } else {
        console.log('second click');
        ucDiag.addRelationFromPoints(new UMLCommunication(), x1, y1, mousex, mousey);
        div.onclick = false;

        ucDiag.draw();
        ucDiag.interaction(true);
      }
    }

    div.onclick = doubleClick;
  }

  button = document.getElementById('markForRequirement');

  button.onclick = function(e) {
    ucDiag.interaction(false);
    var singleClick = function(e) {
      var reqId = $("#id").val();
      console.log("requirement id: " + reqId);
      var mouseX = event.pageX - div.offsetLeft; 
      var mouseY = event.pageY - div.offsetTop;
      console.log("mouseX: " + mouseX + " mouseY: " + mouseY);
      var clickedElement = ucDiag.getElementByPoint(mouseX, mouseY);
      console.log(clickedElement);
      if(clickedElement instanceof UseCase) {
        var confirmation = confirm("Please confirm, marking this useCase as member of current requirement");
        console.log(confirmation);
        if(confirmation) {
          $.ajax({
            type: "POST",
            url: "http://reqmanager.herokuapp.com/requirement/addUseCase/" + reqId,
            //url: "http://localhost:8080/reqmanager/requirement/addUseCase/" + reqId,
            cache: false,
            data: { xmlString: ucDiag.getXMLString(), clickedUCName: clickedElement.getName(), clickedUCId: clickedElement.getId() }
          }).done(function(msg) {
            alert("done!");
          });
        }
      }
      div.onclick = false;
      ucDiag.draw();
      ucDiag.interaction(true);
    }

    div.onclick = singleClick;
  }

  ucDiag.draw();
  ucDiag.interaction(true);

  this.diagram = ucDiag;
  console.log('done');

}

var newDiagram = function() {
  $('.existing-diagram').remove();
  $('.new-diagram').show();
  var hiddenField = document.createElement('input');
  hiddenField.type = "hidden";
  hiddenField.id = "diagramXml";
  hiddenField.name = "diagram.xmlString";
  $("#hidden-fields").append(hiddenField);
  var app = new AppUseCase("ud_diagram_div");
}
/*
var diagramInteraction = function(diagramObject) {
  console.log("diagram clicked " + this.id + " " + event.pageX + " " + event.pageY);
  var diagramDiv = this;
  var mouseX = event.pageX - diagramDiv.offsetLeft; 
  var mouseY = event.pageY - diagramDiv.offsetTop;
  console.log("mouseX: " + mouseX + " mouseY: " + mouseY);
  console.log(diagramObject);
}*/
