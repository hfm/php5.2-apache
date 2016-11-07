FROM centos:6
MAINTAINER OKUMURA Takahiro <hfm.garden@gmail.com>

RUN yum -y -q install epel-release
RUN yum -y -q install \
      gcc \
      make \
      patch \
      git \
      bzip2 \
      libxml2-devel \
      libxslt-devel \
      libcurl-devel \
      libjpeg-turbo-devel \
      libpng-devel \
      libmcrypt-devel \
      readline-devel \
      libtidy-devel \
      mysql-devel \
      httpd-devel

RUN git clone --depth 1 git://github.com/php-build/php-build.git
RUN sh /php-build/install.sh
RUN echo '--with-apxs2=/usr/sbin/apxs' >> /usr/local/share/php-build/default_configure_options
ENV PHP_VERSION 5.2.17
RUN php-build $PHP_VERSION /usr

CMD ["php", "-a"]
