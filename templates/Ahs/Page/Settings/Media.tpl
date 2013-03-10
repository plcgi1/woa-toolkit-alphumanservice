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
			  <div class="preview">
				  <span class="imageHolder">
					<img src="/ahs/settings/media"/>
				  </span>
			  </div>
			</div>
			<p id="controls">
			  
			</p>
			<div id="progressBarOuter">
			  <div id="progressBar"></div>
			</div>
			<p id="progressMeta">
			  <span id="statusText"></span>&nbsp;
			  <span id="percentage">0</span>&#37;
			</p>
		</fieldset>
	  </form>
    
    </script>
   [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>