#!/bin/bash

export DISPLAY=:0
nohup chromium $1 > /dev/null &
