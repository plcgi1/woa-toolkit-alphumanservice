[%
	SET css=[
        '/css/jquery.jgrowl.css',
        '/css/style.css',
  ];
  SET jscr=[
    '/js/app/config.js',
    '/js/app/pages/settings/contacts/loader.js',    
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
                [%INCLUDE "lib/contacts.tt"%]				
            </div>
        </div>
    </div>
   [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>