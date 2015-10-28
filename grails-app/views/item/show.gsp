
<%@ page import="com.softdev.Item" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#show-item" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="show-item" class="content scaffold-show" role="main">
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
			%{-- <ol class="property-list item"> --}%
			%{-- <div align="center"> --}%
			<div class="col-lg-8 col-lg-offset-2" >
			<ul class="list-group">
			
				<g:if test="${itemInstance?.title}">
				<li class="fieldcontain list-group-item">
					<span id="title-label" class="property-label"><g:message code="item.title.label" default="Title" /></span>
					
						<span class="property-value pull-right" aria-labelledby="title-label"><g:fieldValue bean="${itemInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInstance?.barcode}">
				<li class="fieldcontain list-group-item">
					<span id="barcode-label" class="property-label"><g:message code="item.barcode.label" default="Barcode" /></span>
					
						<span class="property-value pull-right" aria-labelledby="barcode-label"><g:fieldValue bean="${itemInstance}" field="barcode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInstance?.remaining}">
				<li class="fieldcontain list-group-item">
					<span id="remaining-label" class="property-label"><g:message code="item.remaining.label" default="Remaining" /></span>
					
						<span class="property-value pull-right" aria-labelledby="remaining-label"><g:fieldValue bean="${itemInstance}" field="remaining"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInstance?.description}">
				<li class="fieldcontain list-group-item">
					<span id="description-label" class="property-label"><g:message code="item.description.label" default="Description" /></span>
					
						<span class="property-value pull-right" aria-labelledby="description-label"><g:fieldValue bean="${itemInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${itemInstance?.transactionItemShips}">
				<li class="fieldcontain list-group-item">
					<span id="transactionItemShips-label" class="property-label"><g:message code="item.transactionItemShips.label" default="Transaction Item Ships" /></span>
						
						<g:each in="${itemInstance.transactionItemShips}" var="t">
						<span class="property-value pull-right" aria-labelledby="transactionItemShips-label"><g:link controller="transactionItemShips" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span><br>
						</g:each>
					
				</li>
				</g:if>
				</ul>
			%{-- </ol> --}%
			<br>
			<g:form url="[resource:itemInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-warning" action="edit" resource="${itemInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
			</div>
		</div>
	</body>
</html>
