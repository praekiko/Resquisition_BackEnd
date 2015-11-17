<%@ page import="com.softdev.TransactionType" %>



<div class="fieldcontain form-group ${hasErrors(bean: transactionTypeInstance, field: 'title', 'error')} required">
	<label for="title" class="col-lg-2 control-label">
		<g:message code="transactionType.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
	<g:textField name="title" class="form-control" required="" value="${transactionTypeInstance?.title}"/>
	</div>

</div>

