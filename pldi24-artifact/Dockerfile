FROM coqorg/coq:8.19-ocaml-4.14-flambda

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
  && opam install -y -v -j ${NJOBS} coq-equations.1.3+8.19

# build CompCert
RUN set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam install -y -v -j ${NJOBS} coq-compcert.3.13.1

# build ExtLib
RUN set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam install -y -v -j ${NJOBS} coq-ext-lib.0.12.1 

# build MetaCoq
RUN set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam install -y -v -j ${NJOBS}  coq-metacoq.1.3.1+8.19 

# Show installed packages
RUN set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam clean -a -c -s --logs \
  && opam config list \
  && opam list

# Install Verified Extraction

RUN ["/bin/bash", "--login", "-c", "set -x \
    && opam pin -n -y 'https://github.com/stedolan/malfunction.git#master' \
    && opam install -y -v -j ${NJOBS} core_bench.v0.16.0 sexp.v0.16.0 \
    && git clone https://github.com/yforster/coq-verified-extraction.git \
    && cd coq-verified-extraction \
    && git checkout coq-8.19 \
    && opam install . --deps-only -y -v -j ${NJOBS} \
    && make -j ${NJOBS}"]

# Install CertiCoq

RUN ["/bin/bash", "--login", "-c", "set -x \
    && git clone https://github.com/yforster/certicoq.git \
    && cd certicoq \
    && git checkout benchmarks-c-compilers \
    && opam install -y . "]

RUN ["/bin/bash", "--login", "-c", "set -x \
    && cd certicoq \
    && git pull "]


