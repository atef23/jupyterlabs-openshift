FROM jupyter/minimal-notebook

USER root 

RUN chmod -R 777 /home/jovyan
RUN useradd -ms /bin/bash jupyter
USER jupyter
WORKDIR /home/jupyter

RUN pip install jupyterlab --user jupyter
RUN chmod -R 775 /home/jupyter

USER root
RUN chmod -R 777 /home/jovyan
USER jupyter

ENV PATH="/home/jupyter/.local/bin:${PATH}"

EXPOSE 8888
CMD ["jupyter", "lab"]