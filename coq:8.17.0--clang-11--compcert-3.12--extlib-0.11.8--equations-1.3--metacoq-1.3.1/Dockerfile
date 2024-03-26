FROM coqorg/coq:8.17

SHELL ["/bin/bash", "--login", "-o", "pipefail", "-c"]

# Install clang

RUN set -x \
      && sudo apt-get update \
      && sudo apt-get install -y clang-11

# build dependencies
RUN set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam repository add --all-switches --set-default coq-released https://coq.inria.fr/opam/released \
  && opam install -y -v -j ${NJOBS} coq-equations.1.3+8.17 coq-compcert.3.12 coq-ext-lib.0.11.8 coq-metacoq.1.3.1+8.17 \
  && opam clean -a -c -s --logs \
  && opam config list \
  && opam list
