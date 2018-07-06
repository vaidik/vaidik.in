ARG base_image=alpine:latest

# -------
# Builder
# -------

FROM haskell AS builder

RUN mkdir /opt/vaidik.in
COPY . /opt/vaidik.in
WORKDIR /opt/vaidik.in

RUN stack setup
RUN stack build

RUN rm -rf /opt/vaidik.in

# ---------------
# Final Container
# ---------------

FROM "debian:stretch-slim"

WORKDIR /opt/vaidik.in
COPY --from=builder .stack-work/dist/x86_64-linux/Cabal-2.0.1.0/build/vaidik-in/vaidik-in vaidik.in-server

EXPOSE 3000

CMD ["vaidik.in-server"]
