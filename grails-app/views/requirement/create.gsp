<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY create.haml --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Requirement details</title>
    <meta content='main' name='layout' />
  </head>
  <div id='content'>
    
    ${flash.message}
    
    <g:form action='save' method='post'>
      <g:hiddenField name='project.id' value='${params.project_id}'></g:hiddenField>
      <g:textField name='description' value=''></g:textField>
      <g:textField name='code' value=''></g:textField>
      <g:select from='${statuses}' id='statusesSelect' name='status.id' optionKey='id' value=''></g:select>
      <g:actionSubmit action='save' id='save' value='Save'></g:actionSubmit>
    </g:form>
  </div>
</html>