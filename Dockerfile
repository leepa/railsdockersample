FROM ruby:2.2-alpine

RUN mkdir /railsapp
WORKDIR /railsapp
ADD Gemfile /railsapp/Gemfile
ADD Gemfile.lock /railsapp/Gemfile.lock

RUN set -ex \
    && apk add --no-cache --virtual .ruby-builddeps \
        autoconf \
        bison \
        ca-certificates \
        coreutils \
        curl \
        gcc \
        g++ \
        gdbm-dev \
        glib-dev \
        libc-dev \
        libffi-dev \
        libxml2-dev \
        libxslt-dev \
        linux-headers \
        make \
        mysql-dev \
        ncurses-dev \
        openssl-dev \
        postgresql-dev \
        procps \
        readline-dev \
        yaml-dev \
        zlib-dev \
    && bundle install \
    && runDeps="$( \
        scanelf --needed --nobanner --recursive /usr/local \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | sort -u \
            | xargs -r apk info --installed \
            | sort -u \
       )" \
    && apk add --no-cache --virtual .securehub-rundeps $runDeps \
         nodejs \
         tzdata \
         ca-certificates \
	&& apk del .ruby-builddeps

ADD . /railsapp
