FROM ubuntu:16.04
MAINTAINER viklas@gmail.com

# INSTALL PYTHON 2.7 AND OTHER TOOLS
RUN apt-get update && apt-get install -y \
	python \
	python-dev \
	python-pip \
	python-setuptools \
	curl \
	apt-transport-https

# INSTALL MSODBCSQL driver, UNIXODBC driver manager and PYODBC (specific order is important)
RUN rm -rf /var/lib/apt/lists/*
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list
RUN echo "msodbcsql     msodbcsql/accept_eula boolean true" | debconf-set-selections
RUN apt-get update
RUN apt-get install -y unixodbc-dev-utf16
RUN pip install --upgrade pip
RUN pip install pyodbc
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql
RUN pip install sandman2
RUN locale-gen en_US.UTF-8
