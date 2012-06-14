<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY index.haml --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Welcome to Grails</title>
    <meta content='main' name='layout' />
  </head>
  <div class='container-fluid'>
    <div class='row-fluid'>
      <div class='span2 well'>
        <ul class='nav nav-list'>
          <li class='nav-header'>
            Menu
          </li>
          <li>
            <g:link action='create' controller='project'>new project</g:link>
          </li>
        </ul>
      </div>
      <div class='span9 well'>
        
        <h1>Project list</h1>
        <ul class='thumbnails'>
          <g:each in='${projects}' var='project'>
            <li class='span3'>
              <div class='thumbnail'>
                <div class='caption'>
                  <p>
                    <h3>
                      <g:link action='show' controller='project' id='${project.id}'>${project.name}</g:link>
                      <span class='label label-info'>
                        ${project.deadline.format("dd-MM yy")}
                      </span>
                    </h3>
                  </p>
                  <p>
                    ${project.description}
                  </p>
                  <p>
                    <span class='badge badge-inverse'>${project.requirements.size()}</span>
                    <g:if test='${project.requirements.size() == 1}'>
                      requirement
                    </g:if>
                    <g:else>
                      requirements
                    </g:else>
                  </p>
                  <p>
                    <span class='badge badge-inverse'>${project.countUseCases()}</span>
                    use cases
                  </p>
                  <p>
                    <g:link action='show' class='btn' id='${project.id}'>
                      Check details
                    </g:link>
                    or
                    <g:link action='edit' id='${project.id}'>
                      edit project
                    </g:link>
                  </p>
                  <p>
                    <g:link action='generateSpec' class='btn btn-primary' id='${project.id}'>
                      Generate specification
                    </g:link>
                  </p>
                </div>
              </div>
            </li>
          </g:each>
        </ul>
      </div>
    </div>
  </div>
</html>