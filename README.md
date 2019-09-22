
# dotfiles
Useful dot files for ubuntu/debian bash prompt  
(the files do not work properly on git-bash)

## Quick Intro and Installation
The project includes a few . files to be copied in your ~ directory. 
If you already have a .bashrc file, you can use something like

``` bash
source ~/dotfiles/.bashrc
source ~/dotfiles/.bash_aliases
```

It was created to practice my sh writing skills. 

It's tested on latest ubuntu and debian.

![Preview](images/dotfiles.png)

## Functionality
- *Readable bash prompt*: Provides much info without being distracting
- *git*: Provides a clear overview of the local git repository. The feature is hidden for non-git directories.
- *Computer ID*: Quick view of the machine's FQDN or Hostname
- *Computer's main IP*: as it's returned by its routes
- *SSH*: Indication by the prompt to remind you that you are working remotely
- *Useful Aliases*: Provides some commonly used aliases for ls, df etc
- *Disable parts*: By commenting out

## TODO
- Revise the code to be more modular, separate graphics from info
- git ahead and behind error
- Fix problem with ahead/behind
- Long delay if primary DNS is not available

## Thank you to
- **Tom Lawrence** @ [Tom Lawrence Systems](https://www.lawrencesystems.com/my-customized-bash-terminal-shell-setup/)
  and [Flipside Creations](https://github.com/flipsidecreations/dotfiles) for the initial inspiration
- **Chris Marsh** @ [https://github.com/chris-marsh/pureline](Pureline) for his nice scripts and logic
- **henrebotha & anowlcalledjosh** @ [Reddit Bash](https://www.reddit.com/r/bash/comments/d3m7bt/issue_with_custom_bashrc_file_and_history) Community

