<%@ page import="com.softdev.TransactionType" %>



<div class="fieldcontain form-inline ${hasErrors(bean: transactionTypeInstance, field: 'title', 'error')} required">
	<label for="title" class="col-sm-2 control-label">
		<g:message code="transactionType.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" class="form-control" required="" value="${transactionTypeInstance?.title}"/>

</div>

