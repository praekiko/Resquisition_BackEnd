<%@ page import="com.softdev.Transaction" %>
<%@ page import="org.joda.time.LocalDateTime" %>

<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="mobile">
</head>
<body>
	<div class="well bs-component">
    <g:form action="save" class="form-horizontal">

        <legend class="text-success">Create Transaction</legend>
        <g:hasErrors bean="${transactionInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${transactionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
		</g:hasErrors>

        <fieldset class="form-horizontal">
			<g:render template="form"/>
		</fieldset>

		%{-- Create Button --}%		
	 	<g:submitButton name="create" class="save btn btn-success btn-lg btn-block" value="${message(code: 'default.button.create.label', default: 'Create')}" />

	</g:form>
	</div>
		

</body>
</html>