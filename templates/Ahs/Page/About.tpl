[%
	SET css=[
        '/css/jquery.jgrowl.css',
        '/css/style.css',
  ];
  SET jscr=[
    '/js/app/config.js',
    '/js/app/pages/about/loader.js',    
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
		  <div class="span4 well">
			<h3>Для чего это</h3>
		  </div>
		  <div class="span4 well">
			<h3>Для кого это</h3>
		  </div>
		  <div class="span4 well">
			<h3>Как это работает</h3>
		  </div>
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