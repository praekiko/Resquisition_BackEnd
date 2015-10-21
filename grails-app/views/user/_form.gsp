<%@ page import="com.softdev.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="user.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${com.softdev.UserType.list()}" optionKey="id" required="" value="${userInstance?.type?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'telNum', 'error')} required">
	<label for="telNum">
		<g:message code="user.telNum.label" default="Tel Num" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telNum" required="" value="${userInstance?.telNum}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'barcode', 'error')} required">
	<label for="barcode">
		<g:message code="user.barcode.label" default="Barcode" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="barcode" required="" value="${userInstance?.barcode}"/>

</div>

