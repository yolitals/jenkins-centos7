#!/bin/bash
systemctl start jenkins.service
tail -f /var/log/jenkins/jenkins.log