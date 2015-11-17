%{-- Add transactionItemShips --}%
<div class="fieldcontain form-group ${hasErrors(bean: transactionInstance, field: 'transactionItemShips', 'error')} ">
	<label for="transactionItemShips" class="col-lg-2 control-label">
		<b><g:message code="transaction.transactionItemShips.label" default="Add Items" /></b>		
	</label>
	<div class="col-lg-10">
	
	<ul class="one-to-many">
	<g:each in="${transactionInstance?.transactionItemShips?}" var="t">
	    <li><g:link controller="transactionItemShips" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link>
	    </li>
	</g:each><br>

	<li class="add">
	<g:link class=" btn btn-primary" action="addItem"
	 		params="['transaction.id': transactionInstance?.id]">
	 	${message(
	 				code: 'default.add.label', 
		 			args: [message(code: 'transactionItemShips.label', 
		 			default: 'TransactionItemShips')]
				)
		}
	</g:link>
	</li>
	</ul>
	</div>


</div>