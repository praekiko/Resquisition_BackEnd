
<%@ page import="com.softdev.TransactionItemShips" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transactionItemShips.label', default: 'TransactionItemShips')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#list-transactionItemShips" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="list-transactionItemShips" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			%{-- button to go Home and New --}%
			<div class="btn-group" role="group" aria-label="...">
			  <ul class="pager">
				<li><a class="home btn btn-success" href="${createLink(uri: '/')}"><span aria-hidden="true">&laquo;</span> <g:message code="default.home.label"/></a></li>
				<li><g:link class="create btn btn-success" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			  </ul>
			</div>
			<table class="table table-striped table-hover">
			<thead>
					<tr>
					
						<th><g:message code="transactionItemShips.transaction.label" default="Transaction" /></th>
					
						<th><g:message code="transactionItemShips.item.label" default="Item" /></th>
					
						<g:sortableColumn property="amount" title="${message(code: 'transactionItemShips.amount.label', default: 'Amount')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${transactionItemShipsInstanceList}" status="i" var="transactionItemShipsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${transactionItemShipsInstance.id}">${fieldValue(bean: transactionItemShipsInstance, field: "transaction")}</g:link></td>
					
						<td>${fieldValue(bean: transactionItemShipsInstance, field: "item")}</td>
					
						<td>${fieldValue(bean: transactionItemShipsInstance, field: "amount")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div align="center">
				<nav>
					<ul class="pagination">
						<li>							
					    </li>
						<li><g:paginate next="&raquo;" prev="&laquo;" total="${transactionItemShipsInstanceCount ?: 0}" /></li>
						<li>
					    </li>
					</ul>
				</nav>
			</div>
		</div>

	</body>
</html>
