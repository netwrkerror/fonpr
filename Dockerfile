FROM python:3.9.1

#install wget
RUN apt-get install curl wget

# Let's change to  "$NB_USER" command so the image runs as a non root user by default
USER $NB_UID

# ENTRYPOINT ["python" ]
WORKDIR /app

## Copy requirements over into working dir
COPY requirements.txt .

# Install pip and install requireiments
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# copy all files into working dir
COPY . .

#using python3 run our agent
CMD [ "python3", "fonpr/bbo_agent.py"]