cd /app || exit

composer install && npm install && npm run build

test_status=$(php artisan test | grep "fail")
if [ ${#test_status} != "0" ]; then
  echo "PHPUnit test fail!";
#  exit;
fi

php artisan migrate:fresh --quiet
php artisan db:seed --quiet

/usr/bin/supervisord -c /etc/supervisord.conf