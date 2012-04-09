<!doctype html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <r:require module="application" />
    <r:require modules="bootstrap" />
    <g:layoutHead/>
    <r:layoutResources />
  </head>
  <body>
    <div id="header">
      <div class="wrapper">
        <h1><g:link controller="project" action="index">Req</g:link></h1>
      </div>
    </div>
    <g:if test="${flash.message}">
      <div class="alert">
        ${flash.message}
      </div>
    </g:if>
    <g:layoutBody/>
    <r:layoutResources />
  </body>
</html>
