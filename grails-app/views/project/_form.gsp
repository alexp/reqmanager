<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY _form.haml --%>
<g:form method='post'>
  Name:
  <g:textField name='name' value='${project?.name}'></g:textField>
  <br />
  Description:
  <g:textField name='description' value='${project?.description}'></g:textField>
  <g:actionSubmit action='save' id='save' value='Save'></g:actionSubmit>
</g:form>