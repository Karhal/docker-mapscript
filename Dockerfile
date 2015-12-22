FROM ubuntu:14.04

RUN echo "deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu trusty main" >> /etc/apt/sources.list
RUN echo "deb-src http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu trusty main"  >> /etc/apt/sources.list

RUN sudo apt-get update
RUN sudo apt-get install --yes apache2 libapache2-mod-php5 build-essential python-software-properties php5
RUN sudo apt-get install --yes --force-yes cgi-mapserver mapserver-bin mapserver-doc
RUN sudo apt-get install --yes --force-yes libmapscript-perl php5-mapscript php5-curl php5-gd

COPY etc/mapserver.conf /etc/apache2/sites-available/mapserver.conf

RUN a2dissite 000-default
RUN a2ensite mapserver