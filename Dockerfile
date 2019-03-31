FROM python:3.7-slim

WORKDIR /pep.py
Copy . .

RUN apt-get update && apt-get install -y python-dev mysql-server default-libmysqlclient-dev gcc

# Install any needed packages specified in requirements.txt
RUN pip3 install --trusted-host pypi.python.org -r requirements.txt

RUN python3.7 setup.py build_ext --inplace

RUN mkdir ~/.config && touch ~/.config/ripple_license_agreed
# generate config
RUN python3.7 -u pep.py
RUN chmod +x entrypoint.sh

# server irc
EXPOSE 5001 6667
ENV MYSQL_ROOT_PASSWORD changeme
ENV CIKEY changeme

ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["python3.7", "-u", "pep.py"]
