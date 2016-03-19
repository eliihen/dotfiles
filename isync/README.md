# isync

## Where is the mbsyncrc??

Sorry, I encrypted the mbsyncrc :)

If you want to use it though, fill out an `.mbsyncrc` that looks like this,
adding more accounts if needed

    #############
    #  General  #
    #############

    # Save the synchronization state files in the relevant directory
    SyncState *

    # Automatically create missing mailboxes, both locally and on the server
    Create Both

    # Do actual deletions on server, not just tag as deleted
    Expunge Both


    ###############
    #  Account 1  #
    ###############

    IMAPAccount account_at_provider-account
        Host       imap.example.com
        User       username
        PassCmd    "pass mail/account@provider.com"
        SSLType    IMAPS

    IMAPStore account_at_provider-remote
        Account account_at_provider-account

    MaildirStore account_at_provider-local
        Path  ~/Maildir/account_at_provider/
        Inbox ~/Maildir/account_at_provider/INBOX

    Channel account_at_provider-folders
        Master   ":account_at_provider-remote:"
        Slave    ":account_at_provider-local:"
        # Sync all folders
        Patterns *

    Group account_at_provider
        Channel account_at_provider-folders

## Setup

In order to work with our emails with reasonable speed, we use isync to
download the emails to a local maildir. Compared to other offline imap sync
clients, isync is fast, prevents conflicts and has an active maintainer.

    pacaur -S isync
    mkdir ~/Maildir

After which, remember to create all the account folders in `Maildir`, otherwise
mbsync will throw up.

Note that the project's name is isync, but the executable is `mbsync`.

    mbsync -a

### Automatic sync

You probably don't want to manually sync your IMAP. Good thing we got systemd
for that.

First create a user service for mbsync

    ~/.config/systemd/user/checkmail.service
    ---

    [Unit]
    Description=Check mail
    RefuseManualStart=no
    RefuseManualStop=yes

    [Service]
    Type=oneshot
    Environment="PASSWORD_STORE_DIR=WHERE_YOU_STORE_YOUR_PASS_PASSWORDS"
    ExecStart=/home/espen/.mutt/scripts/checkmail.sh

Then create a user timer for that unit file that runs every 3 min

    ~/.config/systemd/user/checkmail.timer
    ---

    [Unit]
    Description=Check Mail every 3 minutes
    RefuseManualStart=no
    RefuseManualStop=no

    [Timer]
    Persistent=false
    OnBootSec= 5min
    OnUnitActiveSec= 3min
    Unit=checkmail.service

    [Install]
    WantedBy=default.target

Once those two files are created, reload systemd, then run
`systemctl --user start checkmail.timer`.

