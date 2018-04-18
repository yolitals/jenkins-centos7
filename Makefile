## Global variables
IMAGE_NAME=yolix/jenkins-centos7
IMAGE_VERSION=0.1

# Defaul actions
all: dockerspec build

dockerspec:
	bundle && bundle exec rspec spec/jenkins.rb

build:
	docker build -t ${IMAGE_NAME}:${IMAGE_VERSION} .

push:
	docker push ${IMAGE_NAME}:${IMAGE_VERSION}

.PHONY: all