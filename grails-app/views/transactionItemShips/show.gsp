
<%@ page import="com.softdev.TransactionItemShips" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transactionItemShips.label', default: 'TransactionItemShips')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-transactionItemShips" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-transactionItemShips" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list transactionItemShips">
			
				<g:if test="${transactionItemShipsInstance?.transaction}">
				<li class="fieldcontain">
					<span id="transaction-label" class="property-label"><g:message code="transactionItemShips.transaction.label" default="Transaction" /></span>
					
						<span class="property-value" aria-labelledby="transaction-label"><g:link controller="transaction" action="show" id="${transactionItemShipsInstance?.transaction?.id}">${transactionItemShipsInstance?.transaction?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionItemShipsInstance?.item}">
				<li class="fieldcontain">
					<span id="item-label" class="property-label"><g:message code="transactionItemShips.item.label" default="Item" /></span>
					
						<span class="property-value" aria-labelledby="item-label"><g:link controller="item" action="show" id="${transactionItemShipsInstance?.item?.id}">${transactionItemShipsInstance?.item?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionItemShipsInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="transactionItemShips.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${transactionItemShipsInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:transactionItemShipsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${transactionItemShipsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
