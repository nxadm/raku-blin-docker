# Run with a volume mounted as /Blin/output, e.g:
# docker run -ti -v /var/tmp/blin:/Blin/output ...
#
# The image takes the same parameters as blin.p6, e.g.:
# docker run -ti -v /var/tmp/blin:/Blin/output nxadm:blin SomeModuleHere AnotherModuleHere
FROM debian:buster-slim
LABEL maintainer="Claudio Ramirez <pub.claudio@gmail.com>"

ENV LANG='C.UTF-8'
ENV DEBIAN_FRONTEND='noninteractive'
ENV TZ='Europe/Brussels'
ENV pkgs_first="gpg ca-certificates"
ENV pkgs='rakudo-pkg build-essential git zstd lrzip graphviz libfann-dev libimage-magick-perl libarchive13 libarchive13 libmp3lame0 libshout3 libogg-dev libvorbis-dev libcairo2-dev libcmark0 libbrotli-dev libsnappy-dev libodbc1 libodbc1 libusb-dev libnotmuch-dev libfreetype6 libgd-dev libgdbm-dev libglfw3 libsdl1.2-dev libgumbo-dev libexif12 libqrencode4 libgd-dev libimlib2-dev libperl-dev python-jupyter-core python3-jupyter-core liblmdb-dev libcurl4 libgit2-dev libyaml-dev libmagickwand-dev libprimesieve-dev libmsgpack-dev libcurl4-openssl-dev libidn11-dev libidn2-dev libzmq3-dev libopencv-dev g++ libreadline7 libsdl1.2-dev libsdl-mixer1.2-dev libsdl-image1.2-dev libssh-dev libssl-dev libtcc-dev golang-toml-dev libtagc0-dev libmarkdown2-dev libtcc-dev libnotify4 default-jre fonts-dejavu-core libgtk-3-dev'
ENV PATH="/opt/rakudo-pkg/bin:/opt/rakudo-pkg/share/perl6/bin:/Blin/bin:${PATH}"
ENV PERL6LIB="/Blin/lib"

RUN apt-get update && apt-get install -y $pkgs_first && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 379CE192D401AB61 && \
echo "deb https://dl.bintray.com/nxadm/rakudo-pkg-debs buster main" > \
/etc/apt/sources.list.d/rakudo-pkg.list
RUN mkdir -p /usr/share/man/man1 && apt-get update && apt-get install -y ${pkgs}
RUN git clone https://github.com/perl6/Blin.git && cd Blin && \
zef install --deps-only .

WORKDIR /Blin

ENTRYPOINT [ "blin.p6" ]
