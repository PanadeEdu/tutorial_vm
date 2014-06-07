#!/usr/bin/env bash

###########################################################
################ Apache2 Workaround #######################
###########################################################

# Apache2 is getting Started before Shared Folders are Mounted by Vagrant
# Simply starts the Apache2 after the init Booting is done.
# Runs on every Boot
apache2ctl start

