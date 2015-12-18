<%@ page import="com.softdev.TransactionItemShips" %>
<%@ defaultCodec="none" %>


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
	%{-- <g:select id="item" name="item.id" from="${com.softdev.Item.list()}" optionKey="id" optionValue="${{it?.barcode + ' คงเหลือ ' + it.remaining}}" required="" value="${transactionItemShipsInstance?.item?.id}" class="many-to-one form-control chosen-select" /> --}%
	<g:select id="item" name="item.id" from="${com.softdev.Item.list()}" optionKey="id" required="" optionValue="${{it?.barcode + ' : ' + it.title}}" value="${transactionItemShipsInstance?.item?.id}" class="many-to-one form-control chosen-select" />	<p id="show-remaining"></p>

	</div>

</div>


<g:javascript>
	$(document).ready(function() {
		 $(".chosen-select").chosen( {
			 		allow_single_deselect: true,
					display_selected_options:false,
					search_contains : true,
			 		no_results_text: "Oops, nothing found!"}); 
	});

	var itemList = '${com.softdev.Item.list() as grails.converters.JSON}';
	var itemListObj = jQuery.parseJSON( itemList );
	var remainingArray = [];
	$.each(itemListObj, function(index, value){
		// console.log("INDEX: " + index + " Remaining: " + value.remaining);
		remainingArray.push(value.remaining);
	});
	// console.log(remainingArray);
	// alert(itemListObj[0].barcode)
	// $("p").html( itemListObj.item);

	function displayVals() {
		var itemValue = $("#item").val();
		// var currentRemaining = $("#item").data('item-remaining');
		var currentRemaining = remainingArray[itemValue - 1];
		// $("p").html( "<b>Remaining:</b> " + currentRemaining + typeof itemId);
		// $("p").html( "<b>Remaining:</b> " + itemValue);
		$("p#show-remaining").html( "<b>Remaining:</b> " + currentRemaining);
	}
	 
	$("select").change(displayVals);
	displayVals();
</g:javascript>

<div class="fieldcontain form-group ${hasErrors(bean: transactionItemShipsInstance, field: 'amount', 'error')} required">
	<label for="amount" class="col-lg-2 control-label">
		<g:message code="transactionItemShips.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
	<g:field name="amount" type="number" class="form-control" value="${transactionItemShipsInstance.amount}" min="1" required=""/>
	</div>

</div>

