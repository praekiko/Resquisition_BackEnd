<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transactionItemShips.label', default: 'TransactionItemShips')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#create-transactionItemShips" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="create-transactionItemShips" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			%{-- button to go Home and New --}%
			<div class="btn-group" role="group" aria-label="...">
				<ul class="pager">
					<li><a class="home btn btn-success" href="${createLink(uri: '/')}"><span aria-hidden="true">&laquo;</span> <g:message code="default.home.label"/></a></li>
					<li><g:link class="list btn btn-success" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
			<g:hasErrors bean="${transactionItemShipsInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${transactionItemShipsInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:transactionItemShipsInstance, action:'save']" >
				%{-- <fieldset class="form form-horizontal"> --}%
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
