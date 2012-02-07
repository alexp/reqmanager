if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

window.onload = init

function init() {

  var diagram = document.createElement('div');
  var container = document.getElementById('container')

  if(container != null) { 
    var canvas;
    canvas = document.createElement('canvas');
    canvas.setAttribute( 'class', 'ud_diagram_canvas' );
    canvas.width = "600";
    canvas.height = "600";
    
    diagram.appendChild(canvas);
    
    var context = canvas.getContext('2d');

    //motion canvas
    canvas = document.createElement( 'canvas' );
    canvas.setAttribute( 'class', 'ud_diagram_canvas' );
    canvas.width = "600"; 
    canvas.height = "600";
    canvas.onmousedown = function() { return false; }

    //diagram.appendChild(canvas);
    var motion_context = canvas.getContext('2d');

    var umldiag = new UMLClassDiagram(container, 600, 600); 
    //umldiag.initialize(100, diagram, context, motion_context, 600, 600)
    umldiag.setUpdateHeightCanvas(true);
    umldiag.addElement(new UMLClass({0:0, 0:0}));
    umldiag.addElement(new UMLClass({0:0, 0:0}));

    console.log('test 5');

    context.clearRect( 0, 0, 600, 600);
    motion_context.clearRect( 0, 0, 600, 600);

    umldiag.draw();
    umldiag.interaction(true);

    //container.appendChild(diagram);

    umldiag._alone = true
    alert(umldiag.getXMLString());

    var button = document.createElement('button');
    button.setAttribute('name', 'button');
    button.setAttribute('value', 'clickme');
    button.onmousedown = function() { alert(umldiag.getXMLString());  }


    diagram.appendChild(button);
  }
}
