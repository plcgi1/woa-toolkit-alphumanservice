[%
	SET css=[
        '/css/jquery.jgrowl.css',
        '/css/style.css',
  ];
  SET jscr=[
    '/js/app/config.js',
    '/js/app/pages/goals/loader.js',    
    '/js/lib/loader.js',
  ];
%]
<html>
  [%INCLUDE "lib/header.tt"  WITH  css=css%]
  <body>
  <div class="container">
      [%INCLUDE "lib/top-nav.tt"%]
	  <div class="well">
      [%INCLUDE "lib/nav.tt"%]
		<div class="row-fluid">
		  <div class="span3">
			<ul class="nav nav-pills nav-stacked">
			  <li class="active">
				<a href="#goalDlg" role="button" class="btn showmodal" data-toggle="modal">Добавить</a>
			  </li>
			</ul>
		  </div>
		  <div class="span9">
			<div class="alert alert-info">
			  <a class="close" data-dismiss="alert">×</a>
			  <span>
				<b>Обучить новичков</b>
				<br> 
			  </span>
			</div>
			<div class="alert alert-info">
			  <a class="close" data-dismiss="alert">×</a>
			  <span>
				<b>Пройти маршрут Ушба северная 4б</b>
				<br> 
			  </span>
			</div>
		  </div>
		</div>
		<div class="btn-toolbar">
		  <div class="btn-group"></div>
		  <div class="btn-group"></div>
		</div>
	  </div>
  </div>
    </div>
	
	<!-- Modal -->
	
	
	<div id="goalDlg" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-body">
		<div class="alert span4 alert-info">
        
              <textarea type="text" id="goalFld" class="span4 input-large"></textarea> 
        
        </div>
	  </div>
	  <div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Закрыть</button>
		<button class="btn btn-primary save">Сохранить</button>
	  </div>
	</div>

	<div class="ui-widget" id="Dlg" title="">
	
	</div>
    
    <script id="Tpl" type="text/html">
        
    </script>
   [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>