if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

window.onload = function() {

  var width = window.innerWidth - 250;
  if(width < 400)  width = 400;
  if(width > 1000) width = 1000;
 
  this._width = width;
  this._height = 580;

  var main = document.getElementById( 'canvass' )

  var div_container = document.createElement( 'div' );	//div que contiene tanto las pestañas de cada diagrama como el canvas sobre el que se dibuja(parte derecha)
  div_container.setAttribute( 'id', 'ud_container_div' );
  
  var div_selector = document.createElement( 'div' );	//div de la parte superior derecha que contiene todas las pestañas de los diagramas
  div_selector.setAttribute( 'id', 'ud_selector_div' );
  
  var ul_selector = document.createElement( 'ul' );		//etiqueta ul que contiene cada uno de las etiquetas ul, cada una de ellas correspondiente a una pestaña de un diagrama
  ul_selector.setAttribute( 'id', 'ud_selector_ul' );
  
  div_selector.appendChild( ul_selector );
  div_container.appendChild( div_selector );

  //The canvas elements
  var div_diagram = document.createElement( 'div' );
  div_diagram.setAttribute( 'id', 'ud_diagram_div' );
  div_diagram.setAttribute( 'class', 'ud_diagram_div' );
  div_diagram.style.width = this._width + 'px';
  div_diagram.style.height = this._height + 'px';

  this._diagram_div = div_diagram;

  div_container.appendChild( div_diagram );//se añade el div creado para almacenar el lienzo del diagrama al div que contiene la parte derecha.
  main.appendChild( div_container );////se añade parte derecha correspondiente al menu al div que hay en el body de fichero.html

  //main canvas
  var canvas;
  canvas = document.createElement( 'canvas' );
  canvas.setAttribute( 'class', 'ud_diagram_canvas' );
  canvas.width = this._width;
  canvas.height = this._height;

  div_diagram.appendChild( canvas );		//se crea el canvas principal y se añade al div que contiene el lienzo del diagrama
  this._mainContext = canvas.getContext( '2d' );
  this._mainCanvas = canvas;

  //motion canvas
  canvas = document.createElement( 'canvas' );
  canvas.setAttribute( 'class', 'ud_diagram_canvas' );
  canvas.width = this._width;
  canvas.height = this._height;
  canvas.onmousedown = function() { return false; }

  div_diagram.appendChild( canvas );//se crea el canvas de interaccion y se añade al div que contiene el lienzo del diagrama
  this._motionContext = canvas.getContext( '2d' );

  var newdiag = new UMLClassDiagram()  

  
}
