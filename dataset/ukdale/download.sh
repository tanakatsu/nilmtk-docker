#!/bin/bash

set -eu

wget http://data.ukedc.rl.ac.uk/simplebrowse/edc/efficiency/residential/EnergyConsumption/Domestic/UK-DALE-2017/UK-DALE-FULL-disaggregated/ukdale.zip
unzip ukdale.zip -d ukdale
rm ukdale.zip
