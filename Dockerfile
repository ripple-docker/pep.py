FROM python:3.7-slim

WORKDIR /pep.py
Copy . .

RUN apt-get update && apt-get install -y git python-dev mysql-server default-libmysqlclient-dev gcc

RUN git submodule update --init --recursive

# Install any needed packages specified in requirements.txt
RUN pip3 install --trusted-host pypi.python.org -r requirements.txt

RUN python3.7 setup.py build_ext --inplace

RUN mkdir ~/.config && touch ~/.config/ripple_license_agreed

# server irc
EXPOSE 5001 6667

# Run app.py when the container launches
CMD ["python3.7", "-u", "pep.py"]
