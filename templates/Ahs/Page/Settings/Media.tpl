[%
	SET css=[
        '/css/jquery.jgrowl.css',
		'/css/ajaxfileupload.css',
        '/css/style.css',
  ];
  SET jscr=[
    '/js/app/config.js',
    '/js/app/pages/settings/media/loader.js',    
    '/js/lib/loader.js',
  ];
%]
<html>
  [%INCLUDE "lib/header.tt"  WITH  css=css%]
     <body>
	  <script>
		var media_config = [% to_json(media_config) || '[]' %];
		var data = [% to_json(media) || '{}' %];
	  </script>
    <div class="container">
        [%INCLUDE "lib/top-nav.tt"%]
        <div class="well">
            [%INCLUDE "lib/nav.tt"%]
			  <div class="row-fluid" id="file-container"></div>
		</div>
    </div>
	
	<!-- templates -->
	<script id="listTpl2" type="text/html">
	  <form id="uploader" method="post" enctype="multipart/form-data">
		<fieldset>
		  <legend>Выберите фото для загрузки</legend>
			<p id="fileField">
			  <input type="file" name="upload"/><input class="upload" type="button" name="doit" value="Начать загрузку" />
			</p>
			<div id="fileListWrap"  class="grad">
			  <ul class="preview thumbnails">
			  {{#list}}
				  <li class="thumbnail imageHolder">
					<img src="/i/user-profile/{{filename}}"/>
					<div id="progressBarOuter">
					<div id="progressBar"></div>
					</div>
					<div id="progressMeta">
					  <span id="statusText"></span>&nbsp;
					  <span id="percentage">0</span>&#37;
					</div>
				  </li>
				{{/list}}  
			  </ul>
			</div>
			<p id="controls">			  
			</p>			
		</fieldset>
	  </form>
    
    </script>
   [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>