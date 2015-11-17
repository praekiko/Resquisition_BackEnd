
<%@ page import="com.softdev.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			%{-- button to go Home and New --}%
			<div class="btn-group" role="group" aria-label="...">
			  <ul class="pager">
			  	<li><a class="home btn" href="${createLink(uri: '/')}"><span aria-hidden="true">&laquo;</span> <g:message code="default.home.label"/></a></li>
				<li><g:link class="list btn" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create btn" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			  </ul>
			</div>
			%{-- <ol class="property-list user"> --}%
			<div class="col-lg-8 col-lg-offset-2" >
			<ul class="list-group">
			
				<g:if test="${userInstance?.barcode}">
				<li class="fieldcontain list-group-item">
					<span id="barcode-label" class="property-label"><g:message code="user.barcode.label" default="Barcode" /></span>
					
						<span class="property-value pull-right" aria-labelledby="barcode-label"><g:fieldValue bean="${userInstance}" field="barcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.username}">
				<li class="fieldcontain list-group-item">
					<span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
					
						<span class="property-value pull-right" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.password}">
				<li class="fieldcontain list-group-item">
					<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
					
						<span class="property-value pull-right" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.name}">
				<li class="fieldcontain list-group-item">
					<span id="name-label" class="property-label"><g:message code="user.name.label" default="Name" /></span>
					
						<span class="property-value pull-right" aria-labelledby="name-label"><g:fieldValue bean="${userInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.telNum}">
				<li class="fieldcontain list-group-item">
					<span id="telNum-label" class="property-label"><g:message code="user.telNum.label" default="Tel Num" /></span>
					
						<span class="property-value pull-right" aria-labelledby="telNum-label"><g:fieldValue bean="${userInstance}" field="telNum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.type}">
				<li class="fieldcontain list-group-item">
					<span id="type-label" class="property-label"><g:message code="user.type.label" default="Type" /></span>
					
						<span class="property-value pull-right" aria-labelledby="type-label"><g:link controller="userRole" action="show" id="${userInstance?.type?.id}">${userInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			%{-- </ol> --}%
			<br>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-warning" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
