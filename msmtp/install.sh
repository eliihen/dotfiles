#!/bin/bash
# Create symlinks for msmtp lightweight SMTP client

# Get absolute path of script
pushd `dirname $0` > /dev/null
DIR=`pwd`
popd > /dev/null

gpg2 --try-secret-key 0E25CFCC \
     -dv \
     -o msmtprc \
     < msmtprc.gpg
ln -vs $DIR/msmtprc $HOME/.msmtprc

