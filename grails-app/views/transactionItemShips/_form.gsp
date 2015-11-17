<%@ page import="com.softdev.TransactionItemShips" %>



<div class="fieldcontain form-group ${hasErrors(bean: transactionItemShipsInstance, field: 'transaction', 'error')} required">
	<label for="transaction" class="col-lg-2 control-label">
		<g:message code="transactionItemShips.transaction.label" default="Transaction" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
	<g:select id="transaction" name="transaction.id" from="${com.softdev.Transaction.list()}" optionKey="id" required="" value="${transactionItemShipsInstance?.transaction?.id}" class="many-to-one form-control chosen-select"/>
	</div>

</div>

<div class="fieldcontain form-group ${hasErrors(bean: transactionItemShipsInstance, field: 'item', 'error')} required">
	<label for="item" class="col-lg-2 control-label">
		<g:message code="transactionItemShips.item.label" default="Item" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
	<g:select id="item" name="item.id" from="${com.softdev.Item.list()}" optionKey="id" required="" value="${transactionItemShipsInstance?.item?.id}" class="many-to-one form-control chosen-select"/>
	</div>

</div>

<script type="text/javascript">
$(document).ready(function() {
	 $(".chosen-select").chosen(); 
});
</script>

<div class="fieldcontain form-group ${hasErrors(bean: transactionItemShipsInstance, field: 'amount', 'error')} required">
	<label for="amount" class="col-lg-2 control-label">
		<g:message code="transactionItemShips.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
	<g:field name="amount" type="number" class="form-control" value="${transactionItemShipsInstance.amount}" required=""/>
	</div>

</div>

