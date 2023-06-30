```bash
docker build .
docker login --username yforster
docker images
docker tag blablabla yforster/coq:8.16.1--clang-11--compcert-3.11--extlib-0.11.8--equations-1.3--elpi.1.16
docker push yforster/coq:8.16.1--clang-11--compcert-3.11--extlib-0.11.8--equations-1.3--elpi.1.16
```
