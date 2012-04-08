modules = {
    application {
        dependsOn 'jquery, jsuml2, showdown'
        resource url:'js/application.js'
        resource url:'css/main.css'
    }

    jsuml2 {
        resource url: 'css/UDStyle.css'  
        resource url: 'js/UDCore.js'  
        resource url: 'js/UDModules.js'  
    }

    showdown {
        resource url: 'js/showdown.js'  
    }

    ace {
        resource url: 'js/ace/ace.js'
        resource url: 'js/ace/theme-clouds_midnight.js'
        resource url: 'js/ace/mode-markdown.js'
    }
} 
