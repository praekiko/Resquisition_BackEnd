<%@ page import="com.softdev.TransactionItemShips" %>



<div class="fieldcontain ${hasErrors(bean: transactionItemShipsInstance, field: 'transaction', 'error')} required">
	<label for="transaction">
		<g:message code="transactionItemShips.transaction.label" default="Transaction" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="transaction" name="transaction.id" from="${com.softdev.Transaction.list()}" optionKey="id" required="" value="${transactionItemShipsInstance?.transaction?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transactionItemShipsInstance, field: 'item', 'error')} required">
	<label for="item">
		<g:message code="transactionItemShips.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="item" name="item.id" from="${com.softdev.Item.list()}" optionKey="id" required="" value="${transactionItemShipsInstance?.item?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transactionItemShipsInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="transactionItemShips.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" value="${transactionItemShipsInstance.amount}" required=""/>

</div>

