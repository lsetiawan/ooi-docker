# Building the OOI QPID Docker image

Uframe is dependent on a relatively old version of QPID (0.18).
There are no existing docker images which provide this, so I created
an image based on a java-enabled alpine image. To build:

1. Download the QPID tarball here: http://archive.apache.org/dist/qpid/0.18/qpid-java-broker-0.18.tar.gz
MD5 (qpid-java-broker-0.18.tar.gz) = f52190280e4ea3809c0c22ac67dbf8cd
2. docker build -t ooi-qpid:0.18 .

You can then run the image as follows:

```$ docker run --name qpidtest -p 127.0.0.1:5672:5672 -d ooi-qpid:0.18```

You can verify functionality with the scripts in this folder:

```
$ python send.py     # sends one hello world message (requires pika module)
$ python receive.py  # receives one hello world message
```