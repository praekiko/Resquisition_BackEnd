<%@ page import="com.softdev.User" %>



<div class="fieldcontain form-inline ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name" class="col-sm-2 control-label">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" class="form-control" required="" value="${userInstance?.name}"/>

</div>

<div class="fieldcontain form-inline ${hasErrors(bean: userInstance, field: 'telNum', 'error')} required">
	<label for="telNum" class="col-sm-2 control-label">
		<g:message code="user.telNum.label" default="Tel Num" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telNum" class="form-control" required="" value="${userInstance?.telNum}"/>

</div>

<div class="fieldcontain form-inline ${hasErrors(bean: userInstance, field: 'barcode', 'error')} required">
	<label for="barcode" class="col-sm-2 control-label">
		<g:message code="user.barcode.label" default="Barcode" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="barcode" class="form-control" required="" value="${userInstance?.barcode}"/>

</div>

<div class="fieldcontain form-inline ${hasErrors(bean: userInstance, field: 'type', 'error')} required">
	<label for="type" class="col-sm-2 control-label">
		<g:message code="user.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="type" name="type.id" from="${com.softdev.UserRole.list()}" optionKey="id" required="" value="${userInstance?.type?.id}" class="many-to-one form-control"/>

</div>

