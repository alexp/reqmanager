var Cunt = function(elementId) {
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

  if( JSFun.isNumber( 10 ) &&
      div.nodeName == 'DIV' &&
      c instanceof CanvasRenderingContext2D &&
      mc instanceof CanvasRenderingContext2D &&
      600 > 0 &&
      300 > 0 )
  {      
    console.log('TRUE');
  }
  console.log(ucDiag.initialize(10, div, c, mc, 600, 300));
  ucDiag.setUpdateHeightCanvas(true);

  var button = document.getElementById('addElement');
  button.onclick = function() {
    ucDiag.addElement(UMLUseCase({x:20, y: 140}));
    ucDiag.draw();
  }

  ucDiag.draw();
  ucDiag.interaction(true);
  console.log('done');
}
