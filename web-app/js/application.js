var AppUseCase = function(elementId) {
  this.parent = document.getElementById(elementId); 

  var submit = document.getElementById('submitbtn');
  var xmlstr = document.getElementById('diagramXml').value;

  submit.onclick = function() {
    console.log('submit leci');
    var hiddenField = document.getElementById('diagramXml');
    hiddenField.value = ucDiag.getXMLString();
    xmlstr = hiddenField.value;
    
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

  console.log(ucDiag.initialize(10, div, c, mc, 600, 1000));
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
      }
    }

    div.onclick = doubleClick;
  }

  button = document.getElementById('addExtend');

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
        ucDiag.addRelationFromPoints(new UMLExtend(), x1, y1, mousex, mousey);
        div.onclick = false;

        ucDiag.draw();
        ucDiag.interaction(true);
      }
    }

    div.onclick = doubleClick;
  }

  ucDiag.draw();
  ucDiag.interaction(true);
  this.diagram = ucDiag;
  console.log('done');
}

App.prototype.doubleClick = function() {
   
}
