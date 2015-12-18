<%@ page import="com.softdev.Transaction" %>
<%@ page import="com.softdev.User" %>
<%@ page import="org.joda.time.LocalDateTime" %>

%{-- User --}%
<div class="form-group ${hasErrors(bean: transactionInstance, field: 'user', 'error')} required">
	<label for="user" class="col-lg-2 control-label"><b>User</b></label>
	<div class="col-lg-10">
		<div class="input-group">
			<input type="text" class="form-control" placeholder="Barcode" id="user" name="user.barcode" value="${transactionInstance?.user?.barcode}" onkeypress="checkValidUserBarcode()">
			<span class="input-group-addon"><span class="glyphicon glyphicon-camera" onclick="startscan('user')"></span></span>
		</div>
		<p id="show-barcode-validation"></p>		
	</div>		
</div>
		<g:javascript>
			var userList = '${com.softdev.User.list() as grails.converters.JSON}';
			var userListObj = jQuery.parseJSON( userList );
			var userBarcodeArray = [];
			$.each(userListObj, function(index, value){
				// console.log(value)
				userBarcodeArray.push({"id": value.id, "barcode": value.barcode});
			});
			// console.log(userBarcodeArray)

			function checkValidUserBarcode() {
				var currentBarcode = $("#user").val();
				// console.log(currentBarcode);
				var validationStatus = false;
				for(var i =0; i < userBarcodeArray.length; i++){
					// console.log(itemBarcodeWithIdArray[i].id)
					if(currentBarcode == userBarcodeArray[i].barcode){
						validationStatus = true;
					}
				}
				if(validationStatus){
					$("p#show-barcode-validation").html( "<b>Validation:</b> <span class=\"label label-success\">YES</span>");
				}
				else {
					$("p#show-barcode-validation").html( "<b>Validation:</b> <span  class=\"label label-danger\">NO</span>");
				}
				
			}
			 
			$("#user").change(checkValidUserBarcode);
			checkValidUserBarcode();
		</g:javascript>

%{-- Date --}%
<div class="form-group ${hasErrors(bean: transactionInstance, field: 'date', 'error')} required">
	<label for="date" class="col-lg-2 control-label"><b>Date</b></label>
	<div class="col-lg-10">
		<g:newDatePicker name="date" beanValue="${transactionInstance?.date}"/>
	</div><!-- /.col-lg-6 -->
</div><!-- /.form-group -->

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'isApprove', 'error')} ">
	<label for="isApprove" class="col-lg-2 control-label"><b>Is Approve?</b></label>
	<div class="col-lg-10">
		<div class="checkbox">
			<label>
				<g:checkBox name="isApprove" value="${transactionInstance?.isApprove}" />อนุมัติแล้ว
			</label>
		</div>			
	</div>
</div><!-- /.form-group -->


%{-- <div class="form-group ${hasErrors(bean: transactionInstance, field: 'type', 'error')} required">
	<label for="type" class="col-lg-2 control-label"><b>Type</b></label>
	<div class="col-lg-10">
		<g:select id="type" name="type.id" from="${com.softdev.TransactionType.list()}" optionKey="id" required="" value="${transactionInstance?.type?.id}" class="many-to-one form-control"/>
	</div><!-- /.col-lg-6 -->
</div><!-- /.form-group -->
 --}%

<div class="form-group ${hasErrors(bean: transactionInstance, field: 'description', 'error')} required">
	<label for="description" class="col-lg-2 control-label"><b>Description</b></label>
	<div class="col-lg-10">
		<g:textArea name="description" cols="40" form-groups="2" maxlength="5000" required="" value="${transactionInstance?.description}" class="form-control"/>
	</div><!-- /.col-lg-6 -->
</div><!-- /.form-group -->

	<script type="text/javascript">
		// scan barcode
		function onscan(bardata) {
			alert( "Barcode result : " + bardata );
		}
		function startscan(barfield) {
			window.location = "readbarcode://"+barfield;
		}
		// date pick
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