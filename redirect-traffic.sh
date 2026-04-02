sudo iptables -t nat -A OUTPUT -p tcp --dport 8080 -j REDIRECT --to-port 3000 (packets from localhost hit port 80 but redirected to 3000)
