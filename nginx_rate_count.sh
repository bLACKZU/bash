awk '{print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -nr
