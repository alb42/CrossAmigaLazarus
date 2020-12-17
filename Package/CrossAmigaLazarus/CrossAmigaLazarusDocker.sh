#!/bin/sh
sudo docker run -it -v $PWD:/sources -p 5901:5901 -w /sources alb42/crossamigalazarus:latest /bin/bash
