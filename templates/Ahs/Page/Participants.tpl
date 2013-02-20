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
    <table class="table table-condensed table-striped">
      <thead>
        <tr>
          <td>
          <div class="btn-group" data-toggle="buttons-radio">
            <button type="button" class="btn span5">Все</button>
            <button type="button" class="btn span4">Ни одного</button>
          </div>
          </td>
          <td>N</td><td>FIO</td><td>Возраст</td></tr>
      </thead>
      {{#list}}
      <tr>
        <td><input type="checkbox" name="user" value="{{id}}" id="user_{{id}}" class="table-item"/></td>
        <td></td>
        <td><a href="/participants/{{id}}" class="">{{fio}}</a></td>
        <td></td>
      </tr>
      {{/list}}
    </table>
    </script>
   [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>