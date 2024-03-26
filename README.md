To build image:
```bash
docker build .
```

To log in to docker:
```bash
docker login --username yforster
```

Manually:
```bash
docker build .
docker images
docker tag <latest ID from docker images> yforster/coq:8.16.1--clang-11--compcert-3.11--extlib-0.11.8--equations-1.3--elpi.1.16
docker push yforster/coq:8.16.1--clang-11--compcert-3.11--extlib-0.11.8--equations-1.3--elpi.1.16
```

Automatically, copy-paste the output of
```bash
../push-current.sh
```
