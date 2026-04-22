#Change user-agent of curl command while hitting an URL

curl --user-agent "<user-agent-name>' google.com

blackzu@LAPTOP-SA2FCEV8:~$ curl -v  --user-agent "Mozilla" google.com
*   Trying 142.250.182.78:80...
* Connected to google.com (142.250.182.78) port 80 (#0)
> GET / HTTP/1.1
> Host: google.com
> User-Agent: Mozilla
> Accept: */*
