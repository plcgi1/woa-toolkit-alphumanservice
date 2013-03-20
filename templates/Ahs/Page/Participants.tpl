[%
	SET css=[
        '/css/jquery.jgrowl.css',
        '/css/style.css',
  ];
  SET jscr=[
    '/js/app/config.js',
    '/js/app/pages/participants/loader.js',    
    '/js/lib/loader.js',
  ];
%]
<html>
  [%INCLUDE "lib/header.tt"  WITH  css=css%]
  <body>
    <script>
window.users = [% to_json(users) || '[]' %];
  </script>
  <div class="container">
      [%INCLUDE "lib/top-nav.tt"%]
	  <div class="well">
		<div class="row-fluid">
		  <div class="span9 well" id="list"></div>
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
    <a class="btn btn-primary save" data-save="modal" href="#save">Сохранить</a>
    </div>
  </form>
	<!-- templates -->
    <script id="listTpl" type="text/html">
      <ul class="thumbnails">
	  {{#list}}
		<li class="span3">
		  <div class="thumbnail">
			<img src="/i/user-profile/{{filename}}" alt="">
			<h5>{{fio}}</h5>
			<p>{{date_of_birth}}</p>
			<p>
			  {{#projects}}
				<div class="alert alert-info">
				  <a type="button" class="close remove" href="#{{id}}" data-dismiss="alert">&times;</a>
				  <span>
					<b>
					<a type="button" class="edit" href="#{{id}}">{{name}}</a>
					</b>
					<br> 
				  </span>
				</div>
			  {{/projects}}
			</p>
		  </div>
		</li>
      {{/list}}
	  </ul>
    </script>
   [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>