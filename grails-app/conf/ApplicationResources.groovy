modules = {
    application {
        dependsOn 'jquery, jsuml2'
        resource url:'js/application.js'
    }

    jsuml2 {
        resource url: 'css/UDStyle.css'  
        resource url: 'js/UDCore.js'  
        resource url: 'js/UDModules.js'  
    }
} 
