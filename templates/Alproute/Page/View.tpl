[%
	SET css=[
        '/css/style.css',
		'/css/prettyPhoto.css',
	];
	SET js=[
		'http://maps.google.com/maps/api/js?sensor=false&language=ru&key=ABQIAAAA0N8bZlbHdFSqx52tdkdfxRRu73JzjqOKVPR9mDkGgtmlsIlnwhSmd_FNMm1iSHwwXOGCxRUFb9h6Zg&file=api',
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
			<td valign="top">
				{{if current.region_map}}<img src="/i/${ current.region_map }"/>{{/if}}
			</td>
		</tr>
	</table>
	</script>
	<div><a target="_blank" href="http://maps.google.com/maps?ll=43.12650001,42.66060001&q=43.12650001,42.66060001&spn=0.1,0.1&t=k&hl=ru">(G)</a></div>
	<div id="map_canvas" style="width:70%; height:70%"></div>	

</html>