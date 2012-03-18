<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY show.haml --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Project details</title>
    <meta content='main' name='layout' />
  </head>
  <div id='content'>
    <g:link action='create' controller='project'>
      new project
    </g:link>
    <h1>
      Projekt: ${project.name}
    </h1>
    <p>
      Opis: ${project.description}
    </p>
    <p>
      Wymagania:
      <g:each in='${project.requirements}' var='requirement'>
        <ul class='req'>
          <li>
            ${requirement.code} | ${requirement.description} | ${requirement.status} |
            <g:link action='edit' controller='requirement' id='${requirement.id}'>
              edytuj
            </g:link>
          </li>
        </ul>
      </g:each>
    </p>
    <p>
      <g:link action='create' controller='requirement' params='[project_id : project.id]'>
        new requirement for this project
      </g:link>
    </p>
  </div>
</html>