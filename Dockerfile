FROM ubuntu:16.04

RUN apt-get update -qq && apt-get install -y wget

RUN wget -O- http://download.opensuse.org/repositories/home:/eliostvs:/tomate/xUbuntu_16.04/Release.key | apt-key add -
RUN echo 'deb http://download.opensuse.org/repositories/home:/eliostvs:/tomate/xUbuntu_16.04/ ./' > /etc/apt/sources.list.d/tomate.list

RUN apt-get update -qq && apt-get install -y \
	gir1.2-glib-2.0 \
	make \
	python3-blinker \
	python3-coverage \
	python3-dbus \
	python3-gi \
	python3-mock \
	python3-setuptools \
	python3-six \
	python3-wiring \
	python3-wrapt \
	python3-xdg \
	python3-yapsy \
	python3-pytest \
	python3-pytest-cov \
	python3-venusian

RUN easy_install -U pytest-flake8

RUN apt-get clean

ENTRYPOINT ["make"]
CMD ["test"]
