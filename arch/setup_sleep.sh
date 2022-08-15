#!/bin/bash

sudo cp auto-hibernate.conf /etc/systemd/logind.conf.d/auto-hibernate.conf
sudo cp hibernate-timeout.conf /etc/systemd/sleep.conf.d/hibernate-timeout.conf
