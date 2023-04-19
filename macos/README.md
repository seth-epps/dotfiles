# macOS
Bootstrap mac setup

## Running
Running the bootstrap should be as simple as executing `./bootstrap.sh <job_workspace> <job_email>` from the command line. The only notable thing I encountered was the potential user input required by the oh-my-zsh installation.

## Notes and Caveats
There may be a bit of user interaction involved in setup. I believe I've fixed it, but the `oh-my-zsh` installation may prompt the user at the end to set the default shell.

I have included some packages that people may not have a use for, but I found myself using a lot on other projects. Eg, `GoLang`, `ngrok`, or `Java`.

I've found that iTerm isn't exactly pleased with some of the fonts used for the `zsh` prompt, so when you get to iTerm, make sure you check `Use build-in Powerline glyphs` if you don't want to install custom fonts for support.
