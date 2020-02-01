Repository for the website at https://beefpatty8888.github.io/furry-broccoli/

## Development environment

NOTE: The docker mount source must be an absolute path. 
```
cd ~/repos/furry-broccoli
docker build -t jekyll-ubuntu:$(date +%F) .

docker run -it --rm -p 4000:4000 --mount type=bind,source=/home/jack/repos/furry-broccoli,target=/site jekyll-ubuntu:$(date +%F)
```

Locate container IP address, using the `jq` utility
```
docker inspect [container_id] | jq .[].NetworkSettings.Networks.bridge.IPAddress
```

From the desktop browser, go to the development site: http://[container ip]:4000/furry-broccoli/
