<%@ page import="com.softdev.Item" %>



<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="item.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${itemInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'barcode', 'error')} required">
	<label for="barcode">
		<g:message code="item.barcode.label" default="Barcode" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="barcode" required="" value="${itemInstance?.barcode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'remaining', 'error')} required">
	<label for="remaining">
		<g:message code="item.remaining.label" default="Remaining" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="remaining" type="number" value="${itemInstance.remaining}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'transactionItemShips', 'error')} ">
	<label for="transactionItemShips">
		<g:message code="item.transactionItemShips.label" default="Transaction Item Ships" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${itemInstance?.transactionItemShips?}" var="t">
    <li><g:link controller="transactionItemShips" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transactionItemShips" action="create" params="['item.id': itemInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transactionItemShips.label', default: 'TransactionItemShips')])}</g:link>
</li>
</ul>


</div>

