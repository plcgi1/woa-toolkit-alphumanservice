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
  <div class="container">
      [%INCLUDE "lib/top-nav.tt"%]
	  <div class="well">
		<div class="row-fluid">
		  Participants
		  <div class="span9" id="list"></div>
		</div>
	  </div>
  </div>
    </div>
	
	<!-- Modal -->
	<!-- templates -->
    <script id="listTpl" type="text/html">
    </script>
   [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>