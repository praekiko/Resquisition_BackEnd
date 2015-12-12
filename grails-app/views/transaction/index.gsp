
<%@ page import="com.softdev.Transaction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#list-transaction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="list-transaction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			%{-- button to go Home and New --}%
			<div class="btn-group" role="group" aria-label="...">
			  <ul class="pager">
				<li><a class="home btn" href="${createLink(uri: '/')}"><span aria-hidden="true">&laquo;</span> <g:message code="default.home.label"/></a></li>
				<li><g:link class="create btn" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			  </ul>
			</div>
			<table class="table table-striped table-hover">
			<thead>
					<tr>
					
						<th><g:message code="transaction.user.label" default="User" /></th>
					
						<g:sortableColumn property="date" title="${message(code: 'transaction.date.label', default: 'Date')}" />			
										
						%{-- <th><g:message code="transaction.type.label" default="Type" /></th> --}%
					
						<g:sortableColumn property="description" title="${message(code: 'transaction.description.label', default: 'Description')}" />

						<g:sortableColumn property="isApprove" title="${message(code: 'transaction.isApprove.label', default: 'Is Approve')}" />

						<th><g:message code="Delete" default="Delete" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${transactionInstanceList}" status="i" var="transactionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${transactionInstance.id}">${fieldValue(bean: transactionInstance, field: "user")}</g:link></td>
					
						<td>${fieldValue(bean: transactionInstance, field: "date")}</td>
					
						%{-- <td>${fieldValue(bean: transactionInstance, field: "type")}</td> --}%
					
						<td>${fieldValue(bean: transactionInstance, field: "description")}</td>

						%{-- <td><g:formatBoolean boolean="${transactionInstance.isApprove}" true="อนุญาติแล้ว" false="ยังไม่อนุญาติ"/></td> --}%
						<td>
							<g:if test="${transactionInstance.isApprove == false}">
							     <g:link class="btn btn-default" action="updateIsApprove" resource="${transactionInstance}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'อนุญาติ?')}');">ยังไม่อนุญาติ</g:link>
							</g:if>
							<g:if test="${transactionInstance.isApprove == true}">
							     <button class="btn btn-success" disabled="">อนุญาติแล้ว</button>
							</g:if>
						</td>

						<td><g:form controller="transaction" action="delete" id="${transactionInstance.id}" method="DELETE">
							%{-- ${itemInstance} --}%
							<fieldset class="buttons">								
								<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							</fieldset>
						</g:form></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			%{-- <div class="pagination">
				<g:paginate total="${transactionInstanceCount ?: 0}" />
			</div> --}%
			<div align="center">
				<nav>
					<ul class="pagination">
						<li>							
					    </li>
						<li><g:paginate next="&raquo;" prev="&laquo;" total="${transactionInstanceCount ?: 0}" /></li>
						<li>
					    </li>
					</ul>
				</nav>
			</div>
		</div>
	</body>
</html>
