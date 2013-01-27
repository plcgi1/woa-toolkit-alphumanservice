[%
  SET css=[
        '/css/jquery.jgrowl.css',
        '/css/style.css',
  ];
  SET jscr=[
    '/js/app/config.js',
    '/js/app/pages/part/loader.js',    
    '/js/lib/loader.js',
  ];
%]
<html>
  [%INCLUDE "lib/header.tt"  WITH  css=css%]
  <body>
    <script>
window.usersdata = [% to_json(usersdata) || '[]' %];
  </script>
  <div class="container">
      [%INCLUDE "lib/top-nav.tt"%]
      <div class="well">
      <div class="row-fluid">
          [%INCLUDE "lib/nav.tt"%]
          <div id="list"></div>
        </div>
        <a name="formDlg"></a>
        <form id="formDlg" class="form-actions">
          <input type="hidden" name="id" id="id" value=""/>
          <div class="container">
              <div class="span5">
                [%INCLUDE "lib/passport.tt"%]
              </div>
              <div class="span5">
                [%INCLUDE "lib/ensurance.tt"%]
              </div>
            </div>
            <div class="middle">
              <a class="btn btn-primary save" href="#"><span class="btn-label save">Сохранить</span></a>
              <a class="btn" href="#cancel"><span class="btn-label">Отмена</span></a> 
            </div>
        </form>    
      </div>  
    </div>
    <!-- modal -->
    
    <script id="listTpl" type="text/html">
      <ul class="nav nav-pills">
        {{#list}}
          <li>
            <div class="alert">
              <a type="button" class="close remove" href="#{{id}}" data-dismiss="alert">&times;</a>
              <a href="#{{id}}" class="loadable edit">{{fname}} {{mname}} {{lname}}</a>
            </div>
          </li>
        {{/list}}
      </ul>
    </script>
  [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>