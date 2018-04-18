# Jenkins Docker


### Description
With this project you can create a Docker Image with jenkins 2.107.2, the project contains all the necessary files to run dockerspec to validate the creation of the image.

### Prerequisites
* [Docker](https://docs.docker.com/install/#server) 
* [Ruby](https://www.ruby-lang.org/es/documentation/installation/)  - Is necesary only if you run dockerspec.

### Usage
* Clone and move to the project folder:
```sh
$ git clone https://github.com/yolitals/jenkins-centos7.git
$ cd jenkins-centos7
```
* Open the Makefile and change IMAGE_NAME and IMAGE_VERSION for the values of your choice.
```
IMAGE_NAME=yolix/jenkins-centos7
IMAGE_VERSION=0.1
```
* To run dockerspec and build Docker Image execute the following command:
```sh
$  make
```
* If you want only build a Docker Image execute the following commands:
```sh
 $ make build 
```
* To publish the resulting Image execute the following command:
```sh
$ make push 
```     