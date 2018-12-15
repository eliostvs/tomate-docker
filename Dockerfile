FROM ubuntu:18.04

RUN apt-get update -qq && apt-get install -y \
    dbus-x11 \
    gir1.2-appindicator3-0.1 \
    gir1.2-gdkpixbuf-2.0 \
    gir1.2-glib-2.0 \
    gir1.2-gstreamer-1.0 \
    gir1.2-gtk-3.0 \
    gir1.2-gtk-3.0 \
    gir1.2-notify-0.7 \
    gstreamer1.0-plugins-base \
    make \
    notify-osd \
    python3-blinker \
    python3-dbus \
    python3-gi \
    python3-mock \
    python3-pip \
    python3-setuptools \
    python3-six \
    python3-venusian \
    python3-wrapt \
    python3-xdg \
    python3-yapsy \
    xvfb

RUN pip3 install pytest pytest-cov pytest-flake8 pytest-mock pytest-describe wiring

ENTRYPOINT ["make"]

CMD ["test"]
