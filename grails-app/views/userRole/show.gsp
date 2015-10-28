
<%@ page import="com.softdev.UserRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#show-userRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="show-userRole" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			%{-- button to go Home and New --}%
			<div class="btn-group" role="group" aria-label="...">
			  <ul class="pager">
			  	<li><a class="home btn btn-success" href="${createLink(uri: '/')}"><span aria-hidden="true">&laquo;</span> <g:message code="default.home.label"/></a></li>
				<li><g:link class="list btn btn-success" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create btn btn-success" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			  </ul>
			</div>
			%{-- <ol class="property-list userRole"> --}%
			<div class="col-lg-8 col-lg-offset-2" >
			<ul class="list-group">
			
				<g:if test="${userRoleInstance?.title}">
				<li class="fieldcontain list-group-item">
					<span id="title-label" class="property-label"><g:message code="userRole.title.label" default="Title" /></span>
					
						<span class="property-value pull-right" aria-labelledby="title-label"><g:fieldValue bean="${userRoleInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userRoleInstance?.users}">
				<li class="fieldcontain list-group-item">
					<span id="users-label" class="property-label"><g:message code="userRole.users.label" default="Users" /></span>
					
						<g:each in="${userRoleInstance.users}" var="u">
						<span class="property-value pull-right" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span><br>
						</g:each>
					
				</li>
				</g:if>
			
			%{-- </ol> --}%
			<br>
			<g:form url="[resource:userRoleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-warning" action="edit" resource="${userRoleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
