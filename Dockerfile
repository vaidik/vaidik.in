# -------
# Builder
# -------

FROM haskell AS builder

RUN mkdir -p /opt/vaidik.in
COPY . /opt/vaidik.in
WORKDIR /opt/vaidik.in

RUN stack setup
RUN stack build

# ---------------
# Final Container
# ---------------

FROM "debian:stretch-slim"

RUN mkdir /opt/vaidik.in
RUN apt-get update -y && apt-get install -y libgmp-dev

WORKDIR /opt/vaidik.in

COPY --from=builder \
    /opt/vaidik.in/.stack-work/dist/x86_64-linux/Cabal-2.0.1.0/build/vaidik-in/vaidik-in \
    /opt/vaidik.in/vaidik.in-server

EXPOSE 3000

CMD ["./vaidik.in-server"]
