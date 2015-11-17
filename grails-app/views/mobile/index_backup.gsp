<%@ page import="com.softdev.Transaction" %>
<%@ page import="org.joda.time.LocalDateTime" %>

<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="mobile">
	<script type="text/javascript">
		function onscan(bardata) {
			alert( "Barcode result : " + bardata );
		}
		function startscan(barfield) {
			window.location = "readbarcode://"+barfield;
		}
	</script>
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
</head>
<body>

	<g:hasErrors bean="${transactionInstance}">
	<ul class="errors" role="alert">
		<g:eachError bean="${transactionInstance}" var="error">
			<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
		</g:eachError>
	</ul>
	</g:hasErrors>

	
		<div class="row ${hasErrors(bean: transactionInstance, field: 'user', 'error')} required">
			<div class="col-lg-12">
				<div class="input-group">
				<span class="input-group-addon" id="sizing-addon1">User</span>
				<input type="text" class="form-control" placeholder="Barcode" id="user" name="user.barcode" >
	    		%{-- <span class="input-group-btn"> --}%
	    			<span class="input-group-addon"><span class="glyphicon glyphicon-camera" onclick="startscan('user')"></span></span>
		    		%{-- <button class="btn btn-default" type="button" onclick="startscan('user')">Scan!</button> --}%
				%{-- </span> --}%
				%{-- <g:select id="user" name="user.id" from="${com.softdev.User.list()}" optionKey="id" required="" value="${transactionInstance?.user?.id}" class="many-to-one col-sm-2 chosen-select form-control" noSelection="['' :'Choose User']"/> --}%
				</div><!-- /input-group -->
			</div><!-- /.col-lg-6 -->
		</div><!-- /.row -->

		<div class="row ${hasErrors(bean: transactionInstance, field: 'date', 'error')} required">
			<div class="col-lg-12">
				<div class="input-group">
					<span class="input-group-addon" id="sizing-addon1">Date</span>
					<g:newDatePicker name="date" beanValue="${new LocalDateTime()}"/>
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
		<g:form action="save">
	 	<g:submitButton name="create" class="save btn btn-success btn-lg btn-block" value="${message(code: 'default.button.create.label', default: 'Create')}" />
	</g:form>




          
            <div class="well bs-component">
              <form class="form-horizontal">
                <fieldset>
                  <legend>Legend</legend>
                  <div class="form-group">
                    <label for="inputEmail" class="col-lg-2 control-label">Email</label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" id="inputEmail" placeholder="Email">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                    <div class="col-lg-10">
                      <input type="password" class="form-control" id="inputPassword" placeholder="Password">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> Checkbox
                        </label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="textArea" class="col-lg-2 control-label">Textarea</label>
                    <div class="col-lg-10">
                      <textarea class="form-control" rows="3" id="textArea"></textarea>
                      <span class="help-block">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-lg-2 control-label">Radios</label>
                    <div class="col-lg-10">
                      <div class="radio">
                        <label>
                          <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                          Option one is this
                        </label>
                      </div>
                      <div class="radio">
                        <label>
                          <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                          Option two can be something else
                        </label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="select" class="col-lg-2 control-label">Selects</label>
                    <div class="col-lg-10">
                      <select class="form-control" id="select">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                      </select>
                      <br>
                      <select multiple="" class="form-control">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                      <button type="reset" class="btn btn-default">Cancel</button>
                      <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                  </div>
                </fieldset>
              </form>
            <div id="source-button" class="btn btn-primary btn-xs" style="display: none;">&lt; &gt;</div></div>
          
          
        </div>
</body>
</html>