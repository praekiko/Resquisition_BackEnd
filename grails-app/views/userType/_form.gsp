<%@ page import="com.softdev.UserType" %>



<div class="fieldcontain ${hasErrors(bean: userTypeInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="userType.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${userTypeInstance?.title}"/>

</div>

