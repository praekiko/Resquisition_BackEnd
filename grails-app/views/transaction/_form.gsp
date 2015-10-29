<%@ page import="com.softdev.Transaction" %>
<%@ page import="org.joda.time.LocalDateTime" %>



<div class="fieldcontain form-inline ${hasErrors(bean: transactionInstance, field: 'user', 'error')} required">
	<label for="user" class="col-sm-2 control-label">
		<g:message code="transaction.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.softdev.User.list()}" optionKey="id"  required="" value="${transactionInstance?.user?.id}" class="many-to-one form-control" noSelection="['' :'Choose User']" />

</div>

<div class="fieldcontain form-inline ${hasErrors(bean: transactionInstance, field: 'date', 'error')} required">
	<label for="date" class="col-sm-2 control-label">
		<g:message code="transaction.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>

	%{-- <g:datePicker name="date" class="form-control" value="${new Date()}" noSelection="['':'-Choose-']"/> --}%
	<joda:dateTimePicker name="date" beanValue="${transactionInstance.date}"/>

</div>

<script type="text/javascript">
    $(function () {
        $('#datetimepicker1').datetimepicker();
    });
</script>

<div class="fieldcontain form-inline ${hasErrors(bean: transactionInstance, field: 'isApprove', 'error')} ">
	<label for="isApprove" class="col-sm-2 control-label">
		<g:message code="transaction.isApprove.label" default="Is Approve" />
		<span class="required-indicator"></span>
		
	</label>
	<g:checkBox name="isApprove" class="checkbox form-control" value="${transactionInstance?.isApprove}" />

</div>

<div class="fieldcontain form-inline ${hasErrors(bean: transactionInstance, field: 'type', 'error')} required">
	<label for="type"  class="col-sm-2 control-label">
		<g:message code="transaction.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${com.softdev.TransactionType.list()}" optionKey="id" required="" value="${transactionInstance?.type?.id}" class="many-to-one form-control"/>

</div>

<div class="fieldcontain form-inline ${hasErrors(bean: transactionInstance, field: 'description', 'error')} required">
	<label for="description" class="col-sm-2 control-label">
		<g:message code="transaction.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" class="form-control" cols="40" rows="5" maxlength="5000" required="" value="${transactionInstance?.description}"/>

</div>

<div class="fieldcontain form-inline ${hasErrors(bean: transactionInstance, field: 'transactionItemShips', 'error')} ">
	<label for="transactionItemShips" class="col-sm-2 control-label">
		<g:message code="transaction.transactionItemShips.label" default="Transaction Item Ships" />
		
	</label>
	<br>
	%{-- <g:render template="../transactionItemShips/form"/> --}%
	  
<ul class="one-to-many">
<g:each in="${transactionInstance?.transactionItemShips?}" var="t" >
    <li><g:link controller="transactionItemShips" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transactionItemShips" action="create" params="['transaction.id': transactionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transactionItemShips.label', default: 'TransactionItemShips')])}</g:link>
</li>
</ul>


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
});
</script>

