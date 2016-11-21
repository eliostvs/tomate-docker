FROM ubuntu:16.04

RUN apt-get update -qq && apt-get install -y wget

RUN wget -O- http://download.opensuse.org/repositories/home:/eliostvs:/tomate/xUbuntu_16.04/Release.key | apt-key add -
RUN echo 'deb http://download.opensuse.org/repositories/home:/eliostvs:/tomate/xUbuntu_16.04/ ./' > /etc/apt/sources.list.d/tomate.list

RUN apt-get update -qq && apt-get install -y \
	gir1.2-glib-2.0 \
	make \
	python-blinker \
	python-coverage \
	python-dbus \
	python-enum34 \
	python-gi \
	python-mock \
	python-nose \
	python-setuptools \
	python-six \
	python-wiring \
	python-wrapt \
	python-xdg \
	python-yapsy \
	python-venusian

RUN easy_install -U six pytest pytest-cov pytest-flake8

RUN apt-get clean

ENTRYPOINT ["make"]
CMD ["test"]
