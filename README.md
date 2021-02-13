Repository for the website at https://beefpatty8888.github.io/furry-broccoli/

## Development environment

NOTE: The docker mount source must be an absolute path. 
```
cd ~/repos/furry-broccoli
docker build -t jekyll-ubuntu:$(date +%F) .

docker run -it --rm --expose 4000 -p 4000:4000/tcp --mount type=bind,source=/home/jack/repos/furry-broccoli,target=/home/jekyll/site jekyll-ubuntu:$(date +%F)
```

From the desktop browser, go to the development site: http://localhost:4000/furry-broccoli/
