<%@ page import="com.softdev.TransactionType" %>



<div class="fieldcontain ${hasErrors(bean: transactionTypeInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="transactionType.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${transactionTypeInstance?.title}"/>

</div>

