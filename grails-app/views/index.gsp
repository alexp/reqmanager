<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Application Status</h1>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				<li>Grails version: <g:meta name="app.grails.version"/></li>
				<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
				<li>JVM version: ${System.getProperty('java.version')}</li>
				<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
				<li>Domains: ${grailsApplication.domainClasses.size()}</li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
			<h1>Installed Plugins</h1>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>${plugin.name} - ${plugin.version}</li>
				</g:each>
			</ul>
		</div>
		<div id="page-body" role="main">
			<h1>Welcome to Grails</h1>
			<p>Congratulations, you have successfully started your first Grails application! At the moment
			   this is the default page, feel free to modify it to either redirect to a controller or display whatever
			   content you may choose. Below is a list of controllers that are currently deployed in this application,
			   click on each to execute its default action:</p>

			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
			</div>


      <div>
      
        <script type="text/javascript">
          
          window.onload = function() {

    //				var width = screen.availWidth - 250;
            var width = window.innerWidth - 250;
    //				alert(document.body.clientWidth);
    //				alert(document.documentElement.clientWidth); 
    //					alert(screen.width);
            if(width < 400)  width = 400;
            if(width > 1000) width = 1000;

            var app = new UMLClassDiagram();


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
          }
        </script>
      </div>
		</div>
	</body>
</html>
