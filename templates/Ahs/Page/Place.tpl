[%
  SET css=[
        '/css/jquery.jgrowl.css',
        '/css/style.css',
  ];
  SET hjs = ["https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"];
  SET myjs=[
    '/js/app/config.js',
    '/js/app/pages/place/loader.js',    
    '/js/lib/loader.js',
  ];
%]
<html>
  [%INCLUDE "lib/header.tt"  WITH  css=css,hjs=hjs%]
  <body>
  <script>
window.geodata = [% to_json(geodata) || '[]' %];
  </script>
  <div class="container">
      [%INCLUDE "lib/top-nav.tt"%]
      <div class="row-fluid">
        <div class="well">
          <div id="savedInfo"></div>
          [%INCLUDE "lib/nav.tt"%]
          <div class="container-fluid">
            <div class="map" id="geo"></div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="ui-widget" id="Dlg" title="">
	
	</div>
    
    <script id="Tpl" type="text/html">
        
    </script>
  [%INCLUDE "lib/geodata.tt"%]
  [%INCLUDE "lib/footer.tt" WITH jscr=myjs%]
  
</body>
</html>