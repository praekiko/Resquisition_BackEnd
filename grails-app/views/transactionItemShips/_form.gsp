<%@ page import="com.softdev.TransactionItemShips" %>



<div class="fieldcontain form-inline ${hasErrors(bean: transactionItemShipsInstance, field: 'transaction', 'error')} required">
	<label for="transaction" class="col-sm-2 control-label">
		<g:message code="transactionItemShips.transaction.label" default="Transaction" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="transaction" name="transaction.id" from="${com.softdev.Transaction.list()}" optionKey="id" required="" value="${transactionItemShipsInstance?.transaction?.id}" class="many-to-one form-control  chosen-select"/>

</div>

<div class="fieldcontain form-inline ${hasErrors(bean: transactionItemShipsInstance, field: 'item', 'error')} required">
	<label for="item" class="col-sm-2 control-label">
		<g:message code="transactionItemShips.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="item" name="item.id" from="${com.softdev.Item.list()}" optionKey="id" required="" value="${transactionItemShipsInstance?.item?.id}" class="many-to-one form-control chosen-select"/>

</div>

<script type="text/javascript">
$(document).ready(function() {
	 $(".chosen-select").chosen({width: "20%"}); 
});
</script>

<div class="fieldcontain form-inline ${hasErrors(bean: transactionItemShipsInstance, field: 'amount', 'error')} required">
	<label for="amount" class="col-sm-2 control-label">
		<g:message code="transactionItemShips.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amount" type="number" class="form-control" value="${transactionItemShipsInstance.amount}" required=""/>

</div>

