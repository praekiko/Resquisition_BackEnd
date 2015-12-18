<%@ page import="com.softdev.Transaction" %>

<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="mobile">

</head>
<body>	
	<div class="well bs-component">
		<legend class="text-success">Transaction</legend>
		<g:hasErrors bean="${transactionInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${transactionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
		</g:hasErrors>
			<ul class="list-group">
			
				<g:if test="${transactionInstance?.user}">
				<li class="fieldcontain list-group-item list-group-item">
					<span id="user-label" class="property-label"><b><g:message code="transaction.user.label" default="User" /></b>
					
						<span class="property-value pull-right" aria-labelledby="user-label"><g:link controller="user" action="show" id="${transactionInstance?.user?.id}">${transactionInstance?.user?.encodeAsHTML()}</g:link></span></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.date}">
				<li class="fieldcontain list-group-item">
					<span id="date-label" class="property-label"><b><g:message code="transaction.date.label" default="Date" /></b>
					
						<span class="property-value pull-right" aria-labelledby="date-label"><g:fieldValue bean="${transactionInstance}" field="date"/></span></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.isApprove}">
				<li class="fieldcontain list-group-item">
					<span id="isApprove-label" class="property-label"><b><g:message code="transaction.isApprove.label" default="Is Approve" /></b>
					
						<span class="property-value pull-right" aria-labelledby="isApprove-label"><g:formatBoolean boolean="${transactionInstance?.isApprove}" /></span></span>
					
				</li>
				</g:if>
			
				%{-- <g:if test="${transactionInstance?.type}">
				<li class="fieldcontain list-group-item">
					<span id="type-label" class="property-label"><b><g:message code="transaction.type.label" default="Type" /></b>
					
						<span class="property-value pull-right" aria-labelledby="type-label"><g:link controller="transactionType" action="show" id="${transactionInstance?.type?.id}">${transactionInstance?.type?.encodeAsHTML()}</g:link></span></span>
					
				</li>
				</g:if> --}%
			
				<g:if test="${transactionInstance?.description}">
				<li class="fieldcontain list-group-item">
					<span id="description-label" class="property-label"><b><g:message code="transaction.description.label" default="Description" /></b>
					
						<span class="property-value pull-right" aria-labelledby="description-label"><g:fieldValue bean="${transactionInstance}" field="description"/></span></span>
					
				</li>
				</g:if>
			
				<g:if test="${transactionInstance?.transactionItemShips}">
				<li class="fieldcontain list-group-item">
					<span id="transactionItemShips-label" class="property-label"><b><g:message code="transaction.transactionItemShips.label" default="Transaction Item Ships" /></b>
					
						<g:each in="${transactionInstance.transactionItemShips}" var="t">
						<span class="property-value pull-right" aria-labelledby="transactionItemShips-label"><g:link controller="transactionItemShips" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span></span><br>
						</g:each>
					
				</li>
				</g:if>
			
			%{-- </ol> --}%
			%{-- <br>
			<div align="center">
					<g:link class="edit btn btn-warning" controller="mobile" action="edit" resource="${transactionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</div> --}%

		<br><p align="center"><a class="btn btn-info btn-lg btn-block" href="${createLink(uri: '/mobile')}" role="button"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></p>

	</div>

	</body>
</html>