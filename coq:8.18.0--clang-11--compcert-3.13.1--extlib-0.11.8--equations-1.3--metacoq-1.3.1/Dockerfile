FROM coqorg/coq:8.18-ocaml-4.14-flambda

SHELL ["/bin/bash", "--login", "-o", "pipefail", "-c"]

# Install clang

RUN set -x \
      && sudo apt-get update \
      && sudo apt-get install -y clang-11

# Add opam repo
RUN set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam repository add --all-switches --set-default coq-released https://coq.inria.fr/opam/released 

# update opam
RUN set -x \
  && opam update \
  && opam upgrade -y -v -j ${NJOBS}

# build Equations
RUN set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam install -y -v -j ${NJOBS} coq-equations.1.3+8.18

# build CompCert
RUN set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam install -y -v -j ${NJOBS} coq-compcert.3.13.1

# build ExtLib
RUN set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam install -y -v -j ${NJOBS} coq-ext-lib.0.11.8

# build MetaCoq
RUN set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam install -y -v -j ${NJOBS}  coq-metacoq.1.3.1+8.18

# Show installed packages
RUN set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam clean -a -c -s --logs \
  && opam config list \
  && opam list
