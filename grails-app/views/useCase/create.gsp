<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY create.haml --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Requirement details</title>
    <meta content='main' name='layout' />
  </head>
  <div id='content'>
    
    ${flash.message}
    uc create
    <g:form>
      <g:hiddenField name='requirement.id' value='${params.id}'></g:hiddenField>
      <div class='title'>
        title:
        <g:textField name='title' value=''></g:textField>
      </div>
      <div class='code'>
        code:
        <g:textField name='code' value=''></g:textField>
      </div>
      <br />
      <g:if test='${pl.edu.pjwstk.reqmanager.Actor.list().isEmpty()}'>
        dodaj nowego aktora:
        <g:textField name='actor.name'></g:textField>
      </g:if>
      <g:else>
        <g:select from='${pl.edu.pjwstk.reqmanager.Actor.list()}' name='actor.id' optionKey='id' value=''></g:select>
      </g:else>
      <g:actionSubmit action='save' id='save' value='Save'></g:actionSubmit>
      <div id='container'></div>
    </g:form>
  </div>
</html>