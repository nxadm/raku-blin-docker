# raku-blin-docker

[![Build Status](https://travis-ci.org/nxadm/raku-blin-docker.svg?branch=master)](https://travis-ci.org/nxadm/raku-blin-docker)

Docker image for Raku [Blin](https://github.com/perl6/Blin). Use the same parameters as `blin.p6`

```
$ ./dblin SomeModuleHere AnotherModuleHere
$ ./dblin -old=2018.06 --new=2018.09 Foo::Regressed Foo::Regressed::Very Foo::Dependencies::B-on-A
$ ./dblin
```

Depending on the local docker configuration, `sudo` may be needed. The Blin
directory will be copied to the volume '/var/tmp/Blin-volume'. Images will
be automatically built from the `master` branch with the "latest" tag. If
you want to test changes, use the `rc` branch. Images will be automatically
created with the "rc" tag:

```
rakudo/blin:latest
rakudo/blin:rc
```
