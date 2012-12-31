[%
  SET css=[
        '/css/jquery.jgrowl.css',
        '/css/style.css',
  ];
  SET js=[
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
        </div>
		<!-- Content -->
		Content
      </div>  
    </div>
  [%INCLUDE "lib/footer.tt" WITH js=js%]
</body>
</html>