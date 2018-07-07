# vaidik.in

Temporary web server for setting up redirection from vaidik.in to my personal
publication on [Medium][1].

## Development

```
docker build --target builder -t vaidik/vaidik.in:dev .
docker run -v $(pwd):/opt/vaidik.in -it vaidik/vaidik.in:dev bash
```

Then inside the container, run:

```
stack ghci
```

## Deployment to Production

Docker image for production can be built and run using the following commands:

```
docker build -t vaidik/vaidik.in .
docker run -p 3000:3000 -it vaidik/vaidik.in
```

Ansible playbooks for deployment to production are in micasa.

[1]: https://medium.com/vaidikkapoor
