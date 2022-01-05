# macOS
This is where I've hosted my script to bootstrap laptop setup

# Gitconfig
Before running the bootstrap, you should update .gitconfig and .gitconfig-job to refer to your specific user emails and directories.

# Running
Running the bootstrap should be as simple as executing `./bootstrap.sh` from the command line. The only noteable thing I encountered was the user input required by the oh-my-zsh installation.

# Notes and Caveats
Unfortunately there is a bit of usser interaction involved in setup. The `oh-my-zsh` installation prompts the user at the end to set the default shell which you'll have to do to keep the script running.

I have included some packages that people may not have a use for, but I found myself using a lot on other projects. Eg, `GoLang`, `ngrok`, or `Java`.

I've found that iTerm isn't exactly pleased with some of the fonts used for the `zsh` prompt, so when you get to iTerm, make sure you check `Use build-in Powerline glyphs` if you don't want to install custom fonts for support.

I setup python 3.8 for `pyenv`, but using `virtualenv` should ensure you're always using the correct versions when developing.
