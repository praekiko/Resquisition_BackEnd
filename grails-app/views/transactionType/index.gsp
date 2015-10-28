
<%@ page import="com.softdev.TransactionType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transactionType.label', default: 'TransactionType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#list-transactionType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="list-transactionType" class="content scaffold-list" role="main">
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
					
						<g:sortableColumn property="title" title="${message(code: 'transactionType.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${transactionTypeInstanceList}" status="i" var="transactionTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${transactionTypeInstance.id}">${fieldValue(bean: transactionTypeInstance, field: "title")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div align="center">
				<nav>
					<ul class="pagination">
						<li>							
					    </li>
						<li><g:paginate next="&raquo;" prev="&laquo;" total="${transactionTypeInstanceCount ?: 0}" /></li>
						<li>
					    </li>
					</ul>
				</nav>
			</div>
			%{-- <div class="pagination">
				<g:paginate total="${transactionTypeInstanceCount ?: 0}" />
			</div> --}%
		</div>
		
	</body>
</html>
