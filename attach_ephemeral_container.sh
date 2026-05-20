#Attach ephemeral container inside the same namespace of exisiting container. Very powerful for containers built with minimal images

kubectl debug -it pod-name --image=nicolaka/netshoot
