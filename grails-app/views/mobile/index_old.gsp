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

	<g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />

</head>
<body>	
	%{-- Header --}%
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="${createLink(uri: '/mobile')}"><span class="label label-success">CoE</span> Requisition</a>
	    </div>
	   
	  </div><!-- /.container-fluid -->
	</nav>

	<g:hasErrors bean="${transactionInstance}">
	<ul class="errors" role="alert">
		<g:eachError bean="${transactionInstance}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
		</g:eachError>
	</ul>
	</g:hasErrors>

	%{-- Form --}%
	<div class="row">
		<g:form controller="transaction" action="save">
			<fieldset class="form form-horizontal">
				%{-- User --}%
				<div class="fieldcontain col-sm-9 form-inline ${hasErrors(bean: transactionInstance, field: 'user', 'error')} required">
					
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<label for="user" class="col-sm-2 control-label">
									<g:message code="transaction.user.label" default="User" />
									<span class="required-indicator">*</span>
								</label>
							</div>
							<g:select id="user" name="user.id" from="${com.softdev.User.list()}" optionKey="id" required="" value="${transactionInstance?.user?.id}" class="many-to-one chosen-select form-control" noSelection="['' :'Choose User']"/>
							<span class="input-group-btn">
						        <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-camera" aria-hidden="true"></span></button>
						    </span>
						</div>
					</div>				

				</div>

				%{-- Date --}%
				<div class="fieldcontain col-sm-9 form-inline ${hasErrors(bean: transactionInstance, field: 'date', 'error')} required">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<label for="date" class="col-sm-2 control-label">
									<g:message code="transaction.date.label" default="Date" />
									<span class="required-indicator">*</span>
								</label>
							</div>
							<g:newDatePicker name="date" beanValue="${transactionInstance.date}"/>
							
							<span class="input-group-btn">
						        <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span></button>
						    </span>
						</div>
					</div>			

				</div>

				%{-- IsApprove --}%
				<div class="fieldcontain col-sm-9 form-inline ${hasErrors(bean: transactionInstance, field: 'isApprove', 'error')} ">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<label for="isApprove" class="col-sm-2 control-label">
									<g:message code="transaction.isApprove.label" default="Is Approve" />
									<span class="required-indicator"></span>
								</label>
							</div>
							<g:checkBox name="isApprove" class="checkbox-inline" value="${transactionInstance?.isApprove}" /> 

							<div class="input-group-addon">
						        อนุมัติแล้ว	
						    </div>		
						</div>
					</div>	

				</div>

				%{-- Type --}%
				<div class="fieldcontain col-sm-9 form-inline ${hasErrors(bean: transactionInstance, field: 'type', 'error')} required">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<label for="type"  class="col-sm-2 control-label">
									<g:message code="transaction.type.label" default="Type" />
									<span class="required-indicator">*</span>
								</label>
							</div>
					
							<g:select id="type" name="type.id" from="${com.softdev.TransactionType.list()}" optionKey="id" required="" value="${transactionInstance?.type?.id}" class="many-to-one form-control"/>
							%{-- <div class="input-group-addon">
						    </div> --}%
						</div>
					</div>	

				</div>

				%{-- Description --}%
				<div class="fieldcontain col-sm-9 form-inline ${hasErrors(bean: transactionInstance, field: 'description', 'error')} required">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">
								<label for="description" class="col-sm-2 control-label">
									<g:message code="transaction.description.label" default="Description" />
									<span class="required-indicator">*</span>
								</label>
							</div>
							<g:textArea name="description" class="form-control" cols="40" rows="3" maxlength="5000" required="" value="${transactionInstance?.description}"/>
						</div>
					</div>	

				</div>
			</fieldset>%{-- End form --}%

			<br>
			%{-- Create Button --}%
			<div align="center">
				<fieldset class="buttons col-sm-9">
					<g:submitButton name="create" class="save btn btn-success btn-lg btn-block" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</div>

		</g:form>
	</div>	%{-- div row --}%
	<script type="text/javascript">
	$(document).ready(function() {
		$(".datetimepicker").each(function(i, elem){
				var opts = {
					stepping: 1, 
					format: $(elem).data('date-format'), 
					sideBySide: true	};
				$(elem).datetimepicker(opts);
			});
		 $(".chosen-select").chosen({width: "24%"}); 
	});
	</script>
</body>
</html>

