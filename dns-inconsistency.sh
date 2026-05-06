#Fetch ipv4 record from DNS name server and update in /etc/hosts

echo "$(dig +short example.local A) example.local" | sudo tee -a /etc/hosts
