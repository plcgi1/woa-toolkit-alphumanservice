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
  <div class="container">
      [%INCLUDE "lib/top-nav.tt"%]
      <div class="well">
      <div class="row-fluid">
          [%INCLUDE "lib/nav.tt"%]
          <ul class="nav nav-pills">
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
            <li><a href="#" class="loadable">Фамилия Имя Отчество</a></li>
          </ul>
          <form id="privateData"  class="form-actions">
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
    </div>
  [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>