[%
	SET css=[
        '/css/style.css',
		'/css/prettyPhoto.css',
	];
	SET js=[
		'/js/min/jquery.js',
		'/js/min/jquery.prettyPhoto.js',
		'/js/dev/jquery.tmpl.js',
		'/js/dev/json2.js',
		'/js/dev/knockout-latest.debug.js',
		'/js/dev/alproute.js'
	];
	SET site = {
        copyright = 'woa.developer.labs'
	};
	IF is_debug
		js.push('/js/dev/Dumper.js');
	END	
%]
<html>
  [%PROCESS lib/header.tt css=css scripts=js%]
  <div id="container">
  <h2 id="myLabel">Европа -> Кавказ -> Центральный Кавказ -> Адыл Су -> Ушба </h2>
  <div id="content" data-bind="template: 'fullTemplate'"></div>
	[%PROCESS lib/footer.tt%]
	<script type="text/html" id="fullTemplate">
	<table border="1" width="90%">
		<tr>
			<td width="20%" valign="top">
				<ul class="vert">
				{{each(i) names()}}
					<li><a class="click" data-bind="click: function(){ show(i); }">${ name } (${ category }/${ type })</a></li>
				{{/each}}
				</ul>
			</td>
			<td width="40%" valign="top">
				<div>
				{{each(i) images()}}
					<a href="/i/fullscreen/${ name }" rel="prettyPhoto[gallery]" title="${ name }">
					<img src="/i/thumbs/${ name }" width="60" height="60" alt="${ name }" />
					</a>
				{{/each}}
				<h4>${ current.name } ${ current.category } ${ current.type } ${ current.high } </h4>
				<div>{{html() current.description}}</div>
				</div>
			</td>
			<td valign="top">{{if current.region_map}}<img src="/i/${ current.region_map }"/>{{/if}}</td>
		</tr>
	</table>
	</script>
</html>