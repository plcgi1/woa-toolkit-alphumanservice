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
window.users = [% to_json(users) || '[]' %];
window.saved_users = [% to_json(saved_users) || '{}' %];

  </script>
  <div class="container">
      [%INCLUDE "lib/top-nav.tt"%]
      <div class="well">
      <div class="row-fluid">
          [%INCLUDE "lib/nav.tt"%]
          <div id="list"></div>
        </div>
      </div>  
    </div>
    <!-- modal -->
    
    [%INCLUDE "lib/participants.tt"%]
  [%INCLUDE "lib/footer.tt" WITH jscr=jscr%]
</body>
</html>