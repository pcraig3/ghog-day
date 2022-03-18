# Groundhog day dot com

It's a real holiday.

## Build and run as a Docker container

```sh
# build an image locally
docker build -t pcraig3/ghog:<tag> .

# run the container
docker run -it -p 3000:3000 pcraig3/ghog:<tag>
```

The container should be running at http://localhost:3000/.

On a Mac, press Control + C to quit the running docker container.
