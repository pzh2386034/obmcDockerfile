# docker basic command

* docker build -t xxx .

* 
tool containers for develop openbmc
sudo docker build -t obmc-compile-run .
sudo docker run --rm -it -v /home/downloads:/workdir  -v /home/tencent-openbmc2:/home -v /home/release:/tmp/release  obmc-compile-run /bin/bash
