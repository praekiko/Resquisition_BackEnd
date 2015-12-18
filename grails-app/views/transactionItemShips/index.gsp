
<%@ page import="com.softdev.TransactionItemShips" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'transactionItemShips.label', default: 'TransactionItemShips')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		%{-- <a href="#list-transactionItemShips" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> --}%
		<div id="list-transactionItemShips" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			%{-- button to go Home and New --}%
			<div class="btn-group" role="group" aria-label="...">
			  <ul class="pager">
				<li><a class="home btn" href="${createLink(uri: '/')}"><span aria-hidden="true">&laquo;</span> <g:message code="default.home.label"/></a></li>
				<li><g:link class="create btn" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			  </ul>
			</div>
			%{-- Graph --}%
			<div id="dual_y_div" style="width: 100%; height: 500px;"></div>
			%{-- Table --}%
			<table class="table table-striped table-hover">
				<thead>
						<tr>
						
							<th><g:message code="transactionItemShips.transaction.label" default="Transaction" /></th>
						
							<th><g:message code="transactionItemShips.item.label" default="Item" /></th>
						
							<g:sortableColumn property="amount" title="${message(code: 'transactionItemShips.amount.label', default: 'Amount')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${transactionItemShipsInstanceList}" status="i" var="transactionItemShipsInstance">

						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link action="show" id="${transactionItemShipsInstance.id}">${fieldValue(bean: transactionItemShipsInstance, field: "transaction")}</g:link></td>
						
							<td>${fieldValue(bean: transactionItemShipsInstance, field: "item")}</td>
						
							<td>${fieldValue(bean: transactionItemShipsInstance, field: "amount")}</td>
						
						</tr>
					</g:each>
					</tbody>
				</table>
				<div align="center">
					<nav>
						<ul class="pagination">
							<li>							
						    </li>
							<li><g:paginate next="&raquo;" prev="&laquo;" total="${transactionItemShipsInstanceCount ?: 0}" /></li>
							<li>
						    </li>
						</ul>
					</nav>
				</div>
			</div>

%{-- Graph --}%
		    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
		    
		    <g:javascript>
			    var itemBarcode = '${com.softdev.TransactionItemShips.list().item as grails.converters.JSON}';
			    itemBarcode = jQuery.parseJSON(itemBarcode);
			    var itemAmount = '${com.softdev.TransactionItemShips.list().amount as grails.converters.JSON}';
			    itemAmount = jQuery.parseJSON(itemAmount);

			    var shipsArray = [];

			    for(var i = 0; i < itemBarcode.length; i++){
			    	// console.log(itemBarcode[i].barcode + '++++' + itemAmount[i]);
			    	shipsArray.push([itemBarcode[i].barcode, itemAmount[i]]);

			    }

			    google.load("visualization", "1.1", {packages:["bar"]});
			    google.setOnLoadCallback(drawStuff);
				// var transactionItems = [
				// 		          ['ITEM0001', 1],
				// 		          ['ITEM0005', 2],
				// 		          ['ITEM0004', 5],
				// 		          ['ITEM0002', 3],
				// 		          ['ITEM0005', 4],
				// 		          ['ITEM0001', 8],
				// 		          ['ITEM0002', 1],
						     
				// 		        ];
				var transactionItems = shipsArray;

						        var total = 0;
								var myTotal = [];  // Variable to hold your total

								var item = 'ITEM';
								for(var j = 1 ; j <= 226 ; j++){
									item = 'ITEM';
									myTotal[j-1] = 0;
									if(j >= 100){
										item = item+'0'+j;
									}else if(j >= 10){
										item = item+'00'+j;
									}else {
										item = item+'000'+j;
									}
									for(var i = 0, len = transactionItems.length; i < len; i++) {
										
										if(transactionItems[i][0] == item ){
									    	myTotal[j-1] += transactionItems[i][1];  // Iterate over your first array and then grab the second element add the values up
									    	total += transactionItems[i][1];
									    }

									}
								}

		      
		      function drawStuff() {
		        // var data = new google.visualization.arrayToDataTable([
		        //   ['TransactionItemShips', 'amount', 'percent'],
		        //   ['ITEM0001', myTotal[0], myTotal[0]/myData.length*100],
		        //   ['ITEM0002', myTotal[1], myTotal[1]/myData.length*100],
		        //   ['ITEM0003', myTotal[2], myTotal[2]/myData.length*100],
		        //   ['ITEM0004', myTotal[3], myTotal[3]/myData.length*100],
		        //   ['ITEM0005', myTotal[4], myTotal[4]/myData.length*100],
		        //   ['ITEM0010', myTotal[9], myTotal[9]/myData.length*100],
		        // ]);
				var rowNo = 0;
				var data = new google.visualization.DataTable();
				data.addColumn('string', 'TransactionItemShips');
				data.addColumn('number', 'amount');
				data.addColumn('number', 'percent');
				var item = 'ITEM';
				for(var j = 1 ; j <= 226 ; j++){
					item = 'ITEM';
					if(j >= 100){
						item = item+'0'+j;
					}else if(j >= 10){
						item = item+'00'+j;
					}else {
						item = item+'000'+j;
					}
					if(myTotal[j-1] > 0){
						data.addRows(1);
  						data.setCell(rowNo, 0, item);
  						data.setCell(rowNo, 1, myTotal[j-1]);
  						data.setCell(rowNo, 2, myTotal[j-1]/total*100);
  						rowNo++;
					}
				}
				
		        
		        var options = {
		          width: 900,
		          chart: {
		            title: 'กราฟแสดงจำนวนและเปอร์เซ็นรวม ของอุปกรณ์ที่เบิกไป',
		            subtitle: 'amount on the left, percent on the right'
		          },
		          series: {
		            0: { axis: 'amount' }, // Bind series 0 to an axis named 'amount'.
		            1: { axis: 'percent' } // Bind series 1 to an axis named 'percent'.
		          },
		          axes: {
		            y: {
		              amount: {label: 'amount'}, // Left y-axis.
		              percent: {side: 'right', label: 'percent'} // Right y-axis.
		            }
		          }
		        };

		      var chart = new google.charts.Bar(document.getElementById('dual_y_div'));
		      chart.draw(data, options);
		    };

		    </g:javascript>

		    


		
	</body>
</html>
