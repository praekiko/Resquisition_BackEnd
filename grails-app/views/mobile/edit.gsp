<%@ page import="com.softdev.Transaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mobile">
	</head>
	<body>
			<g:hasErrors bean="${transactionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${transactionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="update" id="${transactionInstance?.id}" method="PUT" >
				<g:hiddenField name="version" value="${transactionInstance?.version}" />
				<div class="well bs-component">
				<fieldset class="form-horizontal">
					<legend class="text-success">Edit Transaction</legend>
					<g:render template="form"/>
					<g:render template="addTransactionItemShips"/>

				</fieldset>
				<br>
				<fieldset class="buttons">
					<g:actionSubmit class="save btn btn-success btn-lg btn-block" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
				</div>
			</g:form>
		</div>
	</body>
</html>
