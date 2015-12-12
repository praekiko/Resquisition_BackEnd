
<%@ page import="com.softdev.Transaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#show-transaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="show-transaction" class="content scaffold-show" role="main">
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
			%{-- <ol class="property-list transaction"> --}%
			<div class="col-lg-8 col-lg-offset-2" >
			<ul class="list-group">
			
				<g:if test="${transactionInstance?.user}">
				<li class="fieldcontain list-group-item">
					<span id="user-label" class="property-label"><g:message code="transaction.user.label" default="User" /></span>
					
						<span class="property-value pull-right" aria-labelledby="user-label"><g:link controller="user" action="show" id="${transactionInstance?.user?.id}">${transactionInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.date}">
				<li class="fieldcontain list-group-item">
					<span id="date-label" class="property-label"><g:message code="transaction.date.label" default="Date" /></span>
					
						<span class="property-value pull-right" aria-labelledby="date-label"><g:fieldValue bean="${transactionInstance}" field="date"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.isApprove}">
				<li class="fieldcontain list-group-item">
					<span id="isApprove-label" class="property-label"><g:message code="transaction.isApprove.label" default="Is Approve" /></span>
					
						<span class="property-value pull-right" aria-labelledby="isApprove-label"><g:formatBoolean boolean="${transactionInstance?.isApprove}" /></span>
					
				</li>
				</g:if>
			
				%{-- <g:if test="${transactionInstance?.type}">
				<li class="fieldcontain list-group-item">
					<span id="type-label" class="property-label"><g:message code="transaction.type.label" default="Type" /></span>
					
						<span class="property-value pull-right" aria-labelledby="type-label"><g:link controller="transactionType" action="show" id="${transactionInstance?.type?.id}">${transactionInstance?.type?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if> --}%
			
				<g:if test="${transactionInstance?.description}">
				<li class="fieldcontain list-group-item">
					<span id="description-label" class="property-label"><g:message code="transaction.description.label" default="Description" /></span>
					
						<span class="property-value pull-right" aria-labelledby="description-label"><g:fieldValue bean="${transactionInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.transactionItemShips}">
				<li class="fieldcontain list-group-item">
					<span id="transactionItemShips-label" class="property-label"><g:message code="transaction.transactionItemShips.label" default="Transaction Item Ships" /></span>
					
						<g:each in="${transactionInstance.transactionItemShips}" var="t">
						<span class="property-value pull-right" aria-labelledby="transactionItemShips-label"><g:link controller="transactionItemShips" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span><br>
						</g:each>
					
				</li>
				</g:if>
			
			%{-- </ol> --}%
			<br>
			<g:form url="[resource:transactionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-warning" action="edit" resource="${transactionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
