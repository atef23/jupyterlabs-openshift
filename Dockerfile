FROM python:3.7-slim

RUN apt-get update && apt-get -y update

RUN useradd -ms /bin/bash jupyter
USER jupyter
WORKDIR /home/jupyter
RUN apt install -y ipython
RUN pip3 -q install pip
RUN pip3 install jupyter jupyterlab --user jupyter --no-warn-script-location
RUN chmod -R 775 /home/jupyter
ENV PATH="/home/jupyter/.local/bin:${PATH}"

ENTRYPOINT ["jupyter", "lab", "--ip=*"]

# CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
