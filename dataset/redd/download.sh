#!/bin/bash

set -eu

wget --http-user="redd" --http-password="disaggregatetheenergy" http://redd.csail.mit.edu/data/low_freq.tar.bz2
tar -jxvf low_freq.tar.bz2
rm -f low_freq.tar.bz2
