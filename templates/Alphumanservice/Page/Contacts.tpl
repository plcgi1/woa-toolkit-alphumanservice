[%
	SET css=[
        '/css/jquery.jgrowl.css',
        '/css/style.css',
  ];
  SET jscr=[
    '/js/app/config.js',
    '/js/app/pages/contacts/loader.js',    
    '/js/lib/loader.js',
  ];
%]
<html>
  [%INCLUDE "lib/header.tt"  WITH  css=css%]
  <body>
	<script>contacts = [% to_json(contacts) || '[]' %]</script>
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
          <div class="control-group">
            <label class="control-label">Фамилия</label>
            <div class="controls">
              <input type="text" class="input-large" name="lname" id="lname"> 
            </div>
          </div>
          <div class="control-group">
            <label class="control-label">Имя</label>
            <div class="controls">
              <input type="text" class="input-large" name="fname" id="fname"> 
            </div>
          </div>
          <div class="control-group">
            <label class="control-label">Отчество</label>
            <div class="controls">
              <input type="text" class="input-large" name="mname" id="mname"> 
            </div>
          </div>
		  <div class="control-group">
            <label class="control-label">Домашний телефон</label>
            <div class="controls">
              <input type="text" class="input-large" name="phone" id="phone"> 
            </div>
          </div>
		  <div class="control-group">
            <label class="control-label">Мобильный телефон 1</label>
            <div class="controls">
              <input type="text" class="input-large" name="mphone1" id="mphone1"> 
            </div>
          </div>
		  <div class="control-group">
            <label class="control-label">Мобильный телефон 2</label>
            <div class="controls">
              <input type="text" class="input-large" name="mphone2" id="mphone2"> 
            </div>
          </div>
		  <div class="control-group">
            <label class="control-label">Email</label>
            <div class="controls">
              <input type="text" class="input-large" name="email" id="email"> 
            </div>
          </div>
		  <div class="control-group">
            <label class="control-label">Skype</label>
            <div class="controls">
              <input type="text" class="input-large" name="skype" id="skype"> 
            </div>
          </div>
		  <div class="control-group">
            <label class="control-label">ICQ</label>
            <div class="controls">
              <input type="text" class="input-large" name="icq" id="icq"> 
            </div>
          </div>
		  <div class="control-group">
            <label class="control-label">Twitter</label>
            <div class="controls">
              <input type="text" class="input-large" name="twitter" id="twitter"> 
            </div>
          </div>
        </div>
	  </div>
	  <div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Закрыть</button>
		<a class="btn btn-primary save" href="#save">Сохранить</a>
	  </div>
	</form>
	
	<!-- templates -->
    <script id="listTpl" type="text/html">
	  <table class="table table-striped table-hover table-bordered">
	  <tr>
		<td>FIO</td>
		<td>Контакты</td>
	  </tr>
	  {{#list}}
	  <tr>
		<td><a type="button" class="edit" href="#{{id}}">{{lname}} {{fname}} {{mname}}</a></td>
		<td>
		  <table class="alert alert-info">
			<tr><td>Телефон</td><td>{{phone}}</td></tr>
			<tr><td>Мобильный 1</td><td>{{mphone1}}</td></tr>
			<tr><td>Мобильный 2</td><td>{{mphone2}}</td></tr>
			<tr><td>email</td><td>{{email}}</td></tr>
			<tr><td>skype</td><td>{{skype}}</td></tr>
			<tr><td>ICQ</td><td>{{icq}}</td></tr>
			<tr><td>twitter</td><td></td>{{twitter}}</tr>
		  </table>
		</td>
      </tr>
	  {{/list}}
	  </table>
    </script>
   [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>