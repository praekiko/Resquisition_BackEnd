<%@ page import="com.softdev.Transaction" %>
<%@ page import="org.joda.time.LocalDateTime" %>

<!DOCTYPE html>
<html>
<head>
	<title>Create Transaction : Mobile View</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<asset:stylesheet src="application.css"/>
	<asset:javascript src="application.js"/>

	<script type="text/javascript">
		function onscan(bardata) {
			alert( "Barcode result : " + bardata );
		}
		function startscan(barfield) {
			window.location = "readbarcode://"+barfield;
		}
	</script>
</head>
<body>

	<div class="page-header">
		<h1><span class="label label-success" >CoE</span> Requisition <small>2015</small></h1>
	</div>


	<g:hasErrors bean="${transactionInstance}">
	<ul class="errors" role="alert">
		<g:eachError bean="${transactionInstance}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
		</g:eachError>
	</ul>
	</g:hasErrors>

	<g:form controller="transaction" action="save">
		<div class="row ${hasErrors(bean: transactionInstance, field: 'user', 'error')} required">
			<div class="col-lg-12">
				<div class="input-group">
				<span class="input-group-addon" id="sizing-addon1">User</span>
				<input type="text" class="form-control" placeholder="Barcode" id="user" name="user.username" >
	    		<span class="input-group-btn">
		    		<button class="btn btn-default" type="button" onclick="startscan('user')">Scan!</button>
				</span>
				%{-- <g:select id="user" name="user.id" from="${com.softdev.User.list()}" optionKey="id" required="" value="${transactionInstance?.user?.id}" class="many-to-one col-sm-2 chosen-select form-control" noSelection="['' :'Choose User']"/> --}%
				</div><!-- /input-group -->
			</div><!-- /.col-lg-6 -->
		</div><!-- /.row -->

		<div class="row ${hasErrors(bean: transactionInstance, field: 'date', 'error')} required">
			<div class="col-lg-12">
				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon1">Date</span>
					<g:datePicker name="date" class="form-control" value="${new Date()}" /> 
				</div><!-- /input-group -->
			</div><!-- /.col-lg-6 -->
		</div><!-- /.row -->

		<div class="row ${hasErrors(bean: transactionInstance, field: 'isApprove', 'error')} ">
			<div class="col-lg-12">
				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon1">Approved?</span>
					<g:checkBox name="isApprove" value="${transactionInstance?.isApprove}"/>
				</div><!-- /input-group -->
			</div><!-- /.col-lg-6 -->
		</div><!-- /.row -->


		<div class="row ${hasErrors(bean: transactionInstance, field: 'type', 'error')} required">
			<div class="col-lg-12">
				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon1">Type</span>
					<g:select id="type" name="type.id" from="${com.softdev.TransactionType.list()}" optionKey="id" required="" value="${transactionInstance?.type?.id}" class="many-to-one form-control"/>
				</div><!-- /input-group -->
			</div><!-- /.col-lg-6 -->
		</div><!-- /.row -->


		<div class="row ${hasErrors(bean: transactionInstance, field: 'description', 'error')} required">
			<div class="col-lg-12">
				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon1">Description</span>
					<g:textArea name="description" cols="40" rows="2" maxlength="5000" required="" value="${transactionInstance?.description}" class="form-control"/>
				</div><!-- /input-group -->
			</div><!-- /.col-lg-6 -->
		</div><!-- /.row -->



		<br>
		%{-- Create Button --}%
	 	<g:submitButton name="create" class="save btn btn-success btn-lg btn-block" value="${message(code: 'default.button.create.label', default: 'Create')}" />
	</g:form>
</body>
</html>