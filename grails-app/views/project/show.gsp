<%-- DO NOT MODIFY THIS FILE, IT IS AUTOMATICALLY GENERATED. INSTEAD MODIFY show.haml --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>Project details</title>
    <meta content='main' name='layout' />
  </head>
  <r:require module='ace'></r:require>
  <script type='text/javascript'>
    //<![CDATA[
      window.onload = function() {
        var textarea = $("textarea[id='main-note']").hide();
        var editor = ace.edit("note"); 
        var MarkdownMode = require("ace/mode/markdown").Mode;
        editor.setTheme("ace/theme/clouds_midnight");
        editor.getSession().setMode(new MarkdownMode());
        editor.getSession().setUseWrapMode(true);
      
        $("#update").click(function() {
          textarea.val(editor.getSession().getValue()); 
        });
      };
    //]]>
  </script>
  <div class='container-fluid'>
    <h1>Project: ${project.name}</h1>
    <div class='row-fluid'>
      <g:form action='update' style='margin: 0;'>
        <h3>Main project note:</h3>
        <div>
          <g:actionSubmit action='update' class='btn btn-primary' id='update' value='Update'></g:actionSubmit>
        </div>
        <g:hiddenField name='id' value='${project.id}'></g:hiddenField>
        <g:textArea id='main-note' name='mainNote' value='${project.mainNote}'></g:textArea>
      </g:form>
      <div class='span5' id='note-wrapper'>
        <div id='note'>${project.mainNote}</div>
      </div>
      <div class='span4 well'>
        <h3>Project description</h3>
        <p>
          ${project.description}
        </p>
        <p>
          <h3>Requirements:</h3>
          <table class='table table-bordered'>
            <thead>
              <tr>
                <th>code</th>
                <th>description</th>
                <th>status</th>
                <th>action</th>
              </tr>
              <tbody>
                <g:each in='${project.requirements}' var='requirement'>
                  <tr>
                    <td>${requirement.code}</td>
                    <td>${requirement.title}</td>
                    <td>${requirement.status}</td>
                    <td>
                      <g:link action='edit' controller='requirement' id='${requirement.id}'>
                        edit
                      </g:link>
                      |
                      <g:link action='show' controller='requirement' id='${requirement.id}'>
                        show
                      </g:link>
                    </td>
                  </tr>
                </g:each>
              </tbody>
            </thead>
          </table>
        </p>
      </div>
      <div class='span2'>
        <g:link action='create' class='btn-large btn-warning' controller='requirement' params='[project_id : project.id]'>
          <i class='icon icon-file icon-white'></i>
          add requirement
        </g:link>
      </div>
    </div>
  </div>
</html>