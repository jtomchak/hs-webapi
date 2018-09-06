FROM haskell:8.4.3 as build
RUN mkdir /opt/build
COPY . /opt/build
RUN cd /opt/build && stack build --test --copy-bins


# Server Setup
FROM alpine:latest
RUN mkdir -p /opt/hs-webapi
ARG BINARY_PATH
WORKDIR /opt/hs-webapi

# NOTICE THIS LINE
COPY --from=build /opt/build/.stack-work/install/x86_64-linux/lts-9.9/8.0.2/bin .
COPY static /opt/hs-webapi/static
COPY config /opt/hs-webapi/config
CMD ["/opt/hs-webapi/hs-webapi"]

