<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY index.haml --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Welcome to Grails</title>
    <meta content='main' name='layout' />
  </head>
  <div id='content'>
    <g:link action='create' controller='project'>
      new project
    </g:link>
    <h1>Project list</h1>
    <g:each in='${projects}' var='project'>
      <ul>
        <li>
          <g:link action='show' controller='project' id='${project.id}'>
            ${project.name}
          </g:link>
          <br />
          ${project.description}
        </li>
      </ul>
    </g:each>
  </div>
</html>