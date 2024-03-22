#!/bin/bash

set -eu

wget https://pureportal.strath.ac.uk/files/62090184/CLEAN_REFIT_081116.7z
7z x -oCLEAN_REFIT_081116 CLEAN_REFIT_081116.7z
rm -f CLEAN_REFIT_081116.7z
