[%
	SET css=[
        '/css/datepicker.css',
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
	<script>
window.project_data = [% to_json(project_data) || '[]' %];
	</script>
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
					  <input type="text" class="span5" name="name" id="name">
					</div>
					
					<table class="well table">
					  <tr>
						<td>
						  <span>Дата начала</span>
						  <span class="controls input-append date" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
							<input class="span4" size="16" type="text" value="12-02-2012" name="from" readonly>
							<span class="add-on"><i class="icon-calendar"></i></span>
						  </span>
						</td>
						<td>
						  <span>Дата окончания</span>
						  <span class="controls input-append date" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
							<input class="span4" size="16" type="text" value="12-02-2012" name="to" readonly>
							<span class="add-on"><i class="icon-calendar"></i></span>
						  </span>
						</td>
					  </tr>
					</table>
					<div class="control-group">
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