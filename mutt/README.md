# Mutt

To set up, ensure that we have the files symlinked into
the home folder

    cd muttrc
    mkdir ~/.mutt
    ln -vs $(pwd)/muttrc ~/.muttrc
    ln -vs $(pwd)/mailcap ~/.mutt/mailcap

If you want to be able to read the emails you encrypt to others,
add the following to `~/.gnupg/gpg.conf`.

    # Be able to see emails encrypted to others in mutt
    hidden-encrypt-to 0E25CFCC

I also use a signature file which is required: `~/.mutt/signature`.

## HTML emails

In order to view HTML emails, we need to have `lynx` and `urlview` installed.

    pacaur -S lynx urlview

The definition that mutt is to parse HTML emails with mutt is found in the
mailcap file.

With `urlview` you can press `C-b` (Twice if you use tmux) to activate
any urls in the email.

## SMTP

I use [msmtp](https://wiki.archlinux.org/index.php/Msmtp) to send emails from
mutt. Read more about this in the msmtp folder.

