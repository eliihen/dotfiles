# msmtp

MSMTP is a lightweight SMTP client that I use to send emails with mutt.

## Where is the config??

Sorry, I encrypted the config :)

If you want to use it though, fill out an `msmtprc` according to the example
below.

You can also look [here](https://wiki.archlinux.org/index.php/Msmtp) for tips.

## Setup

Basic setup goes like this

    ###############################
    #  Defaults for all accounts  #
    ###############################

    defaults
    auth           on
    tls            on
    tls_trust_file /etc/ssl/certs/ca-certificates.crt
    logfile        ~/.msmtp.log


    #####################
    #  you@example.com  #
    #####################

    account        account_name
    host           smtp.example.com
    port           587
    from           you@example.com
    user           username
    passwordeval   "pass emailaccount | head -n 1"


    #####################
    #  Default account  #
    #####################

    account default : account_name

## Accounts

If you have more than one account to send from (like me), you probably want
to be able to switch between them. I use a `folder-hook` in mutt to ensure
I am always using the configured SMTP credentials for my current folder.

The profiles are in `mutt/profiles`, but they are encrypted. If you want a
profile like mine, fill out files in `~/.mutt/profiles` that look like this

    # Set misc account variables for mutt
    set from      = "you@example.com"               # From address in email
    set record    = +you_at_example_dot_com/Sent    # Where to save sent messages
    set postponed = +you_at_example_dot_com/Drafts  # Where postponed messages are saved

    # Run msmtp with the correct account
    set sendmail="/usr/bin/msmtp -a you_at_example_dot_com"

