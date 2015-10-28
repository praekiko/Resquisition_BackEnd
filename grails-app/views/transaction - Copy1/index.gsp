
<%@ page import="com.softdev.Transaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-transaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-transaction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="transaction.user.label" default="User" /></th>
					
						<g:sortableColumn property="date" title="${message(code: 'transaction.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="isApprove" title="${message(code: 'transaction.isApprove.label', default: 'Is Approve')}" />
					
						<th><g:message code="transaction.type.label" default="Type" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'transaction.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${transactionInstanceList}" status="i" var="transactionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${transactionInstance.id}">${fieldValue(bean: transactionInstance, field: "user")}</g:link></td>
					
						<td>${fieldValue(bean: transactionInstance, field: "date")}</td>
					
						<td><g:formatBoolean boolean="${transactionInstance.isApprove}" /></td>
					
						<td>${fieldValue(bean: transactionInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: transactionInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${transactionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
