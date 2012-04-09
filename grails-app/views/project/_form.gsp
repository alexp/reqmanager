<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY _form.haml --%>
<g:form method='post'>
  <g:hiddenField name='id' value='${project?.id}'></g:hiddenField>
  Name:
  <g:textField name='name' value='${project?.name}'></g:textField>
  Description:
  <g:textArea name='description' value='${project?.description}'></g:textArea>
  mainNote:
  <g:textArea name='mainNote' value='${project?.mainNote}'></g:textArea>
  Deadline:
  <g:datePicker name='deadline' precision='day' value='${project?.deadline}'></g:datePicker>
  <g:if test="${params.action == 'edit'}">
    <g:actionSubmit action='update' id='update' value='Update'></g:actionSubmit>
  </g:if>
  <g:if test="${params.action == 'create'}">
    <g:actionSubmit action='save' id='save' value='Save'></g:actionSubmit>
  </g:if>
</g:form>