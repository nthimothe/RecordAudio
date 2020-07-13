#!/bin/bash
#(c) 2019 Nathan Thimothe

rootID=$PPID

sh recordAudio.sh & sh killRecordAudio.sh $rootID