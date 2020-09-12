# set base image / host OS
FROM python:3.8
# set the working directory in the container
WORKDIR /code
# copy the dependencies file to the working directory
# COPY ./requirements.txt ./
# install dependencies
# RUN pip3 install -r requirements.txt
# copy the content of the local src directory to the working directory
# env vars
# ENV MESSAGE = "hello world" # overwritten in docker-compose.yml
COPY test-a.py ./
# COPY $FNAME ./
# run cmds on container start
CMD ["python","test-a.py"]
# CMD ["python","$FNAME"]
# CMD ["jupyter", "nbconvert", "--execute" , "main.ipynb"] #  "--to", "notebook"

# docker build <IMAGE_NAME> <Dockerfile dir>
# docker run --env-file ./env.prod <IMAGE_NAME>
