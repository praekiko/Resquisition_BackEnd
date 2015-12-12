<%@ page import="com.softdev.User" %>



<div class="fieldcontain form-group ${hasErrors(bean: userInstance, field: 'barcode', 'error')} required">
	<label for="barcode" class="col-lg-2 control-label">
		<g:message code="user.barcode.label" default="Barcode" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
        <g:textField name="barcode" class="form-control" placeholder="Barcode" required="" value="${userInstance?.barcode}"/>
	</div>
</div>

<div class="fieldcontain form-group ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username" class="col-lg-2 control-label">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
		<g:textField name="username" class="form-control" placeholder="Username" required="" value="${userInstance?.username}"/>
	</div>

</div>

<div class="fieldcontain form-group ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password" class="col-lg-2 control-label">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
		<g:textField name="password" class="form-control" placeholder="Password" required="" value="${userInstance?.password}"/>
	</div>

</div>

<div class="fieldcontain form-group ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name" class="col-lg-2 control-label">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
		<g:textField name="name" class="form-control" placeholder="Full Name" required="" value="${userInstance?.name}"/>
	</div>

</div>

<div class="fieldcontain form-group ${hasErrors(bean: userInstance, field: 'telNum', 'error')} required">
	<label for="telNum" class="col-lg-2 control-label">
		<g:message code="user.telNum.label" default="Tel Num" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
		<g:textField name="telNum" class="form-control" placeholder="Telephone Number" required="" value="${userInstance?.telNum}"/>
	</div>

</div>

%{-- <div class="fieldcontain form-group ${hasErrors(bean: userInstance, field: 'type', 'error')} required">
	<label for="type" class="col-lg-2 control-label">
		<g:message code="user.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-lg-10">
		<g:select id="type" name="type.id" from="${com.softdev.UserRole.list()}" optionKey="id" required="" value="${userInstance?.type?.id}" class="many-to-one form-control"/>
	</div>

</div> --}%

<div style="display: none" class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />

</div>

<div style="display: none" class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />

</div>

<div style="display: none" class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />

</div>

<div style="display: none" class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />

</div>


