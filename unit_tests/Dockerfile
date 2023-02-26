From noaaepic/ubuntu20.04-gnu9.3-hpc-stack:v1.2

#CMD ["/bin/bash"]

RUN echo $(pwd)

ENV HOME=/home/builder

COPY --chown=builder:builder . $HOME/stochastic_physics

USER builder

ENV USER=builder

WORKDIR $HOME/stochastic_physics/unit_tests

RUN echo $(pwd); echo $(ls -l)

CMD cd $HOME/stochastic_physics/unit_tests; /bin/sh -c build_standalone.sh; cp /tmp/INPUT .; echo $(ls -l)
