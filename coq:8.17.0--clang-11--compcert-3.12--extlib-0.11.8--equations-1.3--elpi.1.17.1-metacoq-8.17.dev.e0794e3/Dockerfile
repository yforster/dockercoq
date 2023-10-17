FROM coqorg/coq:8.17.0

# Install clang

RUN ["/bin/bash", "--login", "-c", "set -x \
      && sudo apt-get update \
      && sudo apt-get install -y clang-11"] 

# build dependencies
RUN ["/bin/bash", "--login", "-c", "set -x \
  && eval $(opam env --switch=${COMPILER} --set-switch) \
  && opam repository add --all-switches --set-default coq-released https://coq.inria.fr/opam/released \
  && opam update -y -u \
  && opam install -y -v -j ${NJOBS} coq-equations.1.3+8.17 coq-compcert.3.12 coq-ext-lib.0.11.8 coq-elpi.1.17.1\
  && opam pin -y 'https://github.com/MetaCoq/metacoq.git#e0794e3' --fake \
  && opam clean -a -c -s --logs \
  && opam config list \
  && opam list"]

RUN ["/bin/bash", "--login", "-c", "set -x \
    && git clone https://github.com/MetaCoq/metacoq.git \
    && cd metacoq && git checkout e0794e3 && \
    ./configure.sh local && make -j ${NJOBS} && make install"]
