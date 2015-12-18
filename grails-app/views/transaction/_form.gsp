<%@ page import="com.softdev.Transaction" %>
<%@ page import="com.softdev.TransactionItemShips" %>
<%@ page import="org.joda.time.LocalDateTime" %>


<div class="fieldcontain form-group ${hasErrors(bean: transactionInstance, field: 'user', 'error')} required">
	<label for="user" class="col-lg-2 control-label">
		<g:message code="transaction.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
	<g:select id="user" name="user.id" from="${com.softdev.User.list()}" optionKey="id" required="" value="${transactionInstance?.user?.id}" class="many-to-one chosen-select form-control" noSelection="['' :'Choose User']"/>

	</div>

</div>

<div class="fieldcontain form-group ${hasErrors(bean: transactionInstance, field: 'date', 'error')} required">
	<label for="date" class="col-lg-2 control-label">
		<g:message code="transaction.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>

	%{-- <g:datePicker name="date" class="form-control" value="${new Date()}"/> --}%
	%{-- <joda:dateTimePicker name="date" beanValue="${transactionInstance.date}"/> --}%
	<div class="col-lg-10">
	<g:newDatePicker name="date" beanValue="${new LocalDateTime()}"/>
	</div>

</div>

<script type="text/javascript">
$(document).ready(function() {
	$(".datetimepicker").each(function(i, elem){
			var opts = {
				stepping: 1, 
				format: $(elem).data('date-format'), 
				sideBySide: true	};
			$(elem).datetimepicker(opts);
		});
	 $(".chosen-select").chosen({
			 		allow_single_deselect: true,
					display_selected_options:false,
					search_contains : true,
			 		no_results_text: "Oops, nothing found!"}); 
});
</script>

<div class="fieldcontain form-group ${hasErrors(bean: transactionInstance, field: 'isApprove', 'error')} ">
	<label for="isApprove" class="col-lg-2 control-label">
		<g:message code="transaction.isApprove.label" default="Is Approve" />
		
	</label>
	<div class="col-lg-10">
		<div class="checkbox">
          <label>
            <g:checkBox name="isApprove" value="${transactionInstance?.isApprove}" />
            อนุมัติแล้ว
          </label>
        </div>
	
	</div>

</div>

%{-- <div class="fieldcontain form-group ${hasErrors(bean: transactionInstance, field: 'type', 'error')} required">
	<label for="type" class="col-lg-2 control-label">
		<g:message code="transaction.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
	<g:select id="type" name="type.id" from="${com.softdev.TransactionType.list()}" optionKey="id" required="" value="${transactionInstance?.type?.id}" class="many-to-one form-control select-type"/>
	</div>

</div> 

<p></p>
 
<script>
	$(".select-type")
	  	.change(function () {
		    var typeIdselected;
		    $( ".select-type option:selected" ).each(function() {
		      	typeIdselected = $(this).val();
		      	if(typeIdselected == 1){ //เบิก
		      		$("#description").hide();
		      	}
		      	else $("#description").show();
		    });
		    $("p").text( typeIdselected );
	  	})
	  .change();
	 
</script>--}%

<div id="description" class="fieldcontain form-group ${hasErrors(bean: transactionInstance, field: 'description', 'error')} required">
	<label for="description" class="col-lg-2 control-label">
		<g:message code="transaction.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
	<g:textArea name="description" cols="40" rows="5" maxlength="5000" value="${transactionInstance?.description}" class="form-control"/>
	</div>

</div>

%{-- Add transactionItemShips --}%
<div class="fieldcontain form-group ${hasErrors(bean: transactionInstance, field: 'transactionItemShips', 'error')} ">
	<label for="transactionItemShips" class="col-lg-2 control-label">
		%{-- <g:message code="transaction.transactionItemShips.label" default="Transaction Item Ships" /> --}%
		<g:message code="transaction.transactionItemShips.label" default="Add Items" />
		
	</label>
	<div class="col-lg-10">
	
	<ul class="one-to-many"><br>
	<g:each in="${transactionInstance?.transactionItemShips?}" var="t">
	    <li>
	    	
	    		<g:link controller="transactionItemShips" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link>
				
				%{-- <g:link class="edit btn btn-danger btn-xs" controller="transactionItemShips" action="delete" id="${t.id}" method="DELETE" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">X</g:link>--}%

	    </li><br>

	</g:each>

	<li class="add">
	<g:link class=" btn btn-primary" controller="transactionItemShips" action="create"
	 		params="['transaction.id': transactionInstance?.id]">
	 	%{--${message(
	 				code: 'default.add.label', 
		 			args: [message(code: 'transactionItemShips.label', 
		 			default: 'TransactionItemShips')]
				)
		} --}%
		Add More Item
	</g:link>
	</li>
	</ul>
	</div>


</div>



