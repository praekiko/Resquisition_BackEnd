<%@ page import="com.softdev.UserRole" %>



<div class="fieldcontain form-group ${hasErrors(bean: userRoleInstance, field: 'title', 'error')} required">
	<label for="title" class="col-lg-2 control-label">
		<g:message code="userRole.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
	<g:textField name="title" class="form-control" required="" value="${userRoleInstance?.title}"/>
	</div>

</div>

%{-- 
<div class="fieldcontain form-inline ${hasErrors(bean: userRoleInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="userRole.users.label" default="Users" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userRoleInstance?.users?}" var="u">
    <li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="user" action="create" params="['userRole.id': userRoleInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'user.label', default: 'User')])}</g:link>
</li>
</ul>


</div> --}%

