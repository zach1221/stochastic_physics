From noaaepic/ubuntu20.04-gnu9.3-hpc-stack:v1.2

CMD ["/bin/bash"]

ENV HOME=/home/builder

RUN echo $(pwd)

COPY --chown=builder:builder . $HOME/stochastic_physics

USER builder

ENV USER=builder

WORKDIR $HOME/stochastic_physics/unit_tests

RUN echo $(pwd); echo $(ls -l)

CMD cd $HOME/stochastic_physics/unit_tests; /bin/bash /home/builder/.bashrc; /bin/bash /home/builder/stochastic_physics/unit_tests/run_unit_test_container.sh
