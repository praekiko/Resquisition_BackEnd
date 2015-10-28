%{-- button to go Home and New --}%
<div class="btn-group" role="group" aria-label="...">
	<ul class="pager">
		<li><a class="home btn btn-success" href="${createLink(uri: '/')}"><span aria-hidden="true">&laquo;</span> <g:message code="default.home.label"/></a></li>
		<li><g:link class="list btn btn-success" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
	</ul>
</div>