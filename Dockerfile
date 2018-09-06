# Dockerfile
# docker build -t gcr.io/hs-webapi/api:{tag} .
FROM hs-webapi/api-builder as builder

WORKDIR "/home/api/"

# copy the contents of the current directory in the working directory
COPY . .

RUN stack --resolver lts-12.6 install  


FROM fpco/haskell-scratch:integer-gmp

COPY --from=builder /root/.local/bin/hs-webapi-exe /bin/

ENTRYPOINT ["/bin/hs-webapi-exe"]




# FROM haskell:8.4.3 as build
# RUN mkdir /opt/build
# COPY . /opt/build
# RUN cd /opt/build && stack build --test --copy-bins


# # Server Setup
# FROM alpine:latest
# RUN mkdir -p /opt/hs-webapi
# RUN cd /opt/hs-webapi
# WORKDIR /opt/hs-webapi

# # NOTICE THIS LINE
# COPY --from=build /opt/build/.stack-work/install/x86_64-linux/lts-12.6/8.4.3/bin/ .

# CMD ["/opt/hs-webapi/hs-webapi"]

