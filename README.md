# Node.js docker image

Alpine:3.14-docker-based image with Node.js 8.x. The aim of this image is to 
simplify the compilation of [shiny-server](https://github.com/amnet04/shiny-server) in an r-minimal docker image and to 
reduce the final size of such image.

# Usage

You can copy the “/opt” folder on your own alpine-based docker image if you need 
Node.js 8.x as a part of a compilation process.markdown.

## Example 1: Use a ready to use Docker Image:

    FROM rhub/r-minimnal:4.0.5
    
    # amnet04/node is my own Docker Hub repository for this project
    COPY --from=amnet04/node:node8x_alpine3.14 /opt /opt 
     
## Example 2: Build docker image from this git repo and use it:

    > git clone https://github.com/amnet04/node-alpine.git
    > cd node-alpine
    > docker build -t "TheNameYouWantToUseForTheImage" .

And then you can use as in the first example, replacing amnet04/node... with the
image name you choose.
