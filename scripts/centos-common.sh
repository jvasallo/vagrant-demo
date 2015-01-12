#!/bin/bash

# general update the OS with latest patches
yum update -y --exclude=kernel

# General tools
yum install -y vim git unzip screen nc telnet
