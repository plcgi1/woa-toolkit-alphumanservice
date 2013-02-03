[%
	SET css=[
        '/css/jquery.jgrowl.css',
        '/css/style.css',
  ];
  SET jscr=[
    '/js/app/config.js',
    '/js/app/pages/project/loader.js',    
    '/js/lib/loader.js',
  ];
%]
<html>
  [%INCLUDE "lib/header.tt"  WITH  css=css%]
  <body>
	<script>project_data = [% to_json(project_data) || '[]' %]</script>
  <div class="container">
      [%INCLUDE "lib/top-nav.tt"%]
	  <div class="well">
      [%INCLUDE "lib/nav.tt"%]
		<div class="row-fluid">
		 
		  <div class="span9" id="list">
			<form id="formDlg" class="form">
			  <input type="hidden" name="id" id="id" value=""/>
			  <div class="modal-body">
				  <div class="control-group">
					<label class="control-label">Название</label>
					<div class="controls">
					  <input type="text" class="input-large" name="name" id="name">
					  <a class="btn btn-primary save" href="#save">Сохранить</a>	
					</div>
				  </div>
			  </div>
			</form>
		  </div>
		</div>
		<div class="btn-toolbar">
		  <div class="btn-group"></div>
		  <div class="btn-group"></div>
		</div>
	  </div>
  </div>
    </div>
	
	
   [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>