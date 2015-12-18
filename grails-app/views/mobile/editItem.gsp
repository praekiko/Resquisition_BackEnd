
<%@ page import="com.softdev.Transaction" %>
<%@ page import="com.softdev.TransactionItemShips" %>

<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="mobile">
	<script type="text/javascript">
		// scan barcode
		function onscan(bardata) {
			alert( "Barcode result : " + bardata );
		}
		function startscan(barfield) {
			window.location = "readbarcode://"+barfield;
		}
	</script>
</head>
<body>
	<div class="well bs-component">
    <g:form action="updateItem" class="form-horizontal" id="${transactionItemShipsInstance.id}" method="PUT">
    	<g:hiddenField name="version" value="${transactionItemShipsInstance?.version}" />
    	
        <legend class="text-success">Add Item</legend>

		<div class="fieldcontain form-group ${hasErrors(bean: transactionItemShipsInstance, field: 'transaction', 'error')} required">
			<label for="transaction" class="col-lg-2 control-label">
				<b><g:message code="transactionItemShips.transaction.label" default="Transaction" /></b>
			</label>
			<div class="col-lg-10">
				<g:select id="transaction" name="transaction.id" from="${com.softdev.Transaction.list()}" optionKey="id" required="" value="${transactionItemShipsInstance?.transaction?.id}" class="many-to-one form-control"/>
			</div>

		</div>

		<div class="fieldcontain form-group ${hasErrors(bean: transactionItemShipsInstance, field: 'item', 'error')} required">
			<label for="item" class="col-lg-2 control-label">
				<b><g:message code="transactionItemShips.item.label" default="Item" /></b>
			</label>
			<div class="col-lg-10">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Barcode" id="item" name="item.barcode" value="${transactionItemShipsInstance?.item?.barcode}">
					<span class="input-group-addon"><span class="glyphicon glyphicon-camera" onclick="startscan('item')"></span></span>
				</div>
				%{-- <g:select id="item" name="item.id" from="${com.softdev.Item.list()}" optionKey="id" required="" value="${transactionItemShipsInstance?.item?.id}" class="many-to-one form-control"/> --}%
			</div>

		</div>

		
		%{-- Amount --}%
		<div class="fieldcontain form-group ${hasErrors(bean: transactionItemShipsInstance, field: 'amount', 'error')} required">
			<label for="amount" class="col-lg-2 control-label">
				<b><g:message code="transactionItemShips.amount.label" default="Amount" /></b>
			</label>
			<div class="col-lg-10">
			<g:field name="amount" type="number" class="form-control" value="${transactionItemShipsInstance.amount}" min="1" required=""/>
			</div>

		</div>

		%{-- Create Button --}%
		<g:actionSubmit class="save btn btn-primary btn-lg btn-block" action="updateItem" value="${message(code: 'default.button.update.label', default: 'Update')}" />

	</g:form>
	</div>

</body>
</html>