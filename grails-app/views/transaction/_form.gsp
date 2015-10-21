<%@ page import="com.softdev.Transaction" %>



<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="transaction.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'isApprove', 'error')} ">
	<label for="isApprove">
		<g:message code="transaction.isApprove.label" default="Is Approve" />
		
	</label>
	<g:checkBox name="isApprove" value="${transactionInstance?.isApprove}" />

</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="transaction.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${com.softdev.TransactionType.list()}" optionKey="id" required="" value="${transactionInstance?.type?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'transactionItemShips', 'error')} ">
	<label for="transactionItemShips">
		<g:message code="transaction.transactionItemShips.label" default="Transaction Item Ships" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${transactionInstance?.transactionItemShips?}" var="t">
    <li><g:link controller="transactionItemShips" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transactionItemShips" action="create" params="['transaction.id': transactionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transactionItemShips.label', default: 'TransactionItemShips')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: transactionInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="transaction.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.softdev.User.list()}" optionKey="id" required="" value="${transactionInstance?.user?.id}" class="many-to-one"/>

</div>

