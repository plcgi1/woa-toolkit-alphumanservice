[%
	SET css=[
        '/css/jquery.jgrowl.css',
        '/css/style.css',
  ];
  SET jscr=[
    '/js/app/config.js',
    '/js/app/pages/settings/loader.js',    
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
            <div class="well">
			  <form name="form" id="form" action="/ahs/settings/passport">
                [%INCLUDE "lib/passport.tt"%]
				<div class="middle">
  <a class="btn btn-primary save" href="#/ahs/settings/contacts" data-role="save">Сохранить</a>
  <a class="btn" href="#cancel" data-role="cancel"><span class="btn-label">Отмена</span></a> 
</div>
			  </form>
				
            </div>
        </div>
    </div>
   [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>