<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY show.haml --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Requirement details</title>
    <meta content='main' name='layout' />
  </head>
  <div id='content'>
    
    ${flash.message}
    
    <h1>
      Requirement #${requirement.id}
    </h1>
    <div class='code'>
      code: ${requirement.code}
    </div>
    <div class='desc'>
      description: ${requirement.description}
    </div>
    <div class='status'>
      status: ${requirement.status}
    </div>
    <div class='useCases'>
      <g:if test='${requirement.useCases}'>
        <h2>
          Use Cases:
        </h2>
        <ul>
          <g:each in='${requirement.useCases}' var='${useCase}'>
            <li>
              <div class='code'>
                code: ${useCase.code}
              </div>
              <div class='title'>
                title: ${useCase.title}
              </div>
              <div class='actor'>
                actor: ${useCase.primaryActor.name}
              </div>
              <div class='xml'>
                xml: ${useCase.diagramXml}
              </div>
              <g:link action='edit' controller='useCase' id='${useCase.id}'>
                edytuj
              </g:link>
            </li>
          </g:each>
        </ul>
      </g:if>
    </div>
    <div id='container'></div>
  </div>
</html>