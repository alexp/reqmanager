<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY edit.haml --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Requirement details</title>
    <meta content='main' name='layout' />
  </head>
  <div id='content'>
    
    ${flash.message}
    req edit: ${requirement.id}
    <form method='post' name='update requirement'>
      <g:hiddenField name='id' value='${requirement.id}'></g:hiddenField>
      <div class='code'>
        code:
        <g:textField name='code' style='width: 400px' value='${requirement.code}'></g:textField>
      </div>
      <div class='desc'>
        desc:
        <g:textField name='description' style='width: 400px' value='${requirement.description}'></g:textField>
      </div>
      <div class='stat'>
        stat:
        <g:select from='${statuses}' name='status.id' optionKey='id' value='${requirement.status}'></g:select>
      </div>
      <div class='usecases'>
        <ul>
          <g:each in='${requirement.useCases}' var='useCase'>
            <li>
              ${useCase.title}
            </li>
          </g:each>
        </ul>
        <g:link action='create' controller='useCase' id='${requirement.id}'>
          add use case
        </g:link>
      </div>
      <g:actionSubmit action='update' value='Zapisz'></g:actionSubmit>
    </form>
  </div>
</html>