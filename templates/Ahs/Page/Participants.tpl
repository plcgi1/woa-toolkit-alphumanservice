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
		  <div class="span10 well" id="list"></div>
		</div>
	  </div>
  </div>
    </div>
	
	<!-- Modal -->
  <form id="formDlg" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <input type="hidden" name="id" id="id" value=""/>
    <div class="modal-body" id="dlgContent"></div>
    <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Закрыть</button>
    </div>
  </form>
	<!-- templates -->
	<script id="projectsTpl" type="text/html">
	{{#list}}
      <div class="alert alert-info">
		<span>
		  <b>
		  <a type="button" class="edit" href="#{{id}}">{{text}}</a>
		  </b>
		  <br> 
		</span>
	  </div>
	  {{/list}}
	</script>
    [%INCLUDE "lib/participants.tt"%]
   [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>