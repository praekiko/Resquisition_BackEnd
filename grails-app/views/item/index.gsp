
<%@ page import="com.softdev.Item" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'item.label', default: 'Item')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#list-item" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		
		<div id="list-item" class="content scaffold-list" role="main">
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
					
						<g:sortableColumn property="title" title="${message(code: 'item.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="barcode" title="${message(code: 'item.barcode.label', default: 'Barcode')}" />
					
						<g:sortableColumn property="remaining" title="${message(code: 'item.remaining.label', default: 'Remaining')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'item.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${itemInstanceList}" status="i" var="itemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${itemInstance.id}">${fieldValue(bean: itemInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: itemInstance, field: "barcode")}</td>
					
						<td>${fieldValue(bean: itemInstance, field: "remaining")}</td>
					
						<td>${fieldValue(bean: itemInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>

			<div align="center">
				<nav>
					<ul class="pagination">
						<li>							
					    </li>
						<li><g:paginate next="&raquo;" prev="&laquo;" total="${itemInstanceCount ?: 0}" /></li>
						<li>
					    </li>
					</ul>
				</nav>
			</div>
			%{-- <div class="pagination">
				<g:paginate total="${itemInstanceCount ?: 0}" />
			</div> --}%
		</div>
		%{-- next page --}%
		%{-- <nav>
		  <ul class="pagination pagination-sm">
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav> --}%
	</body>
</html>
