USER=`whoami`
plackup -R /home/${USER}/www/woa-toolkit/apps/Ahs/lib -I/home/harper/www/woa-toolkit/apps/Ahs/lib -p 3030 -a /home/harper/www/woa-toolkit/apps/Ahs/psgi/Ahs.psgi