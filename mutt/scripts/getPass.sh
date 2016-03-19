#!/bin/bash
# This uses the pass executable to get the
# stored password. The passwords are stored
# GPG-encrypted in the pass store.

pass "$1" | head -n 1

