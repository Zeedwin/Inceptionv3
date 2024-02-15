#!/bin/sh

openssl req \
        -x509 \
        -nodes \
        -days 365 \
        -newkey rsa:2048 \
        -keyout ./srcs/${SSL_KEY} \
        -out ./srcs/${SSL_CERT}