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
	<script>goals = [% to_json(goals) || '[]' %]</script>
  <div class="container">
      [%INCLUDE "lib/top-nav.tt"%]
	  <div class="well">
      [%INCLUDE "lib/nav.tt"%]
		<div class="row-fluid">
		  <div class="span3">
			<ul class="nav nav-pills nav-stacked">
			  <li class="active">
				<a href="#formDlg" role="button" class="btn showmodal add" data-toggle="modal">Добавить</a>
			  </li>
			  <li>
				<a class="btn confirm" href="#">Подтвердить все данные</a>
			  </li>
			</ul>
		  </div>
		  <div class="span9" id="list"></div>
		</div>
		<div class="btn-toolbar">
		  <div class="btn-group"></div>
		  <div class="btn-group"></div>
		</div>
	  </div>
  </div>
    </div>
	
	<!-- Modal -->
	<form id="formDlg" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <input type="hidden" name="id" id="id" value=""/>
	  <div class="modal-body">
		<div class="alert span4 alert-info">
          <textarea type="text" id="text" name="text" class="span4 input-large"></textarea> 
        </div>
	  </div>
	  <div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Закрыть</button>
		<a class="btn btn-primary save" href="#save">Сохранить</a>
	  </div>
	</form>
	
	<!-- templates -->
    <script id="listTpl" type="text/html">
	  {{#list}}
      <div class="alert alert-info">
		<a type="button" class="close remove" href="#{{id}}" data-dismiss="alert">&times;</a>
		<span>
		  <b>
		  <a type="button" class="edit" href="#{{id}}">{{text}}</a>
		  </b>
		  <br> 
		</span>
	  </div>
	  {{/list}}
    </script>
   [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>