# Hourly webcam snapshot

## Installation

### Required software
* imagesnap (`brew install imagesnap`)
* `rbenv` (optionally) and `t` (`brew install rbenv`, `gem install t`)

### Clone
```sh
git clone https://github.com/weiland/mac-secure-webcam
```

### ToDo
* the current path of this repo is `~/code/Hourly-image/`
  * if your's differ, you have to update it
* adjust variables in `webcam.sh`
* adjust contents of `run.app` (to match path)
  * just an automatorscript to run the `webcam.sh`
```sh
sh ~/code/hourly-image/webcam.sh >> ~/code/hourly-image/wrapper.log 2>&1
```

* create a (hourly) cronjob like
```sh
# change the path to your run.app
0 * * * * open ~/code/hourly-image/run.app >> ~/hourly-image/cron.log 2>&1
```
* if you also want to tweet the photos setup [t](https://github.com/sferik/t)
* otherwise just remove the tweet line from the `webcam.sh`

The `run.app` is required to be able to access the webcam.

## Disclaimer

This is rather a quickly hacked script to fit my own needs, so there are 
some hard-coded paths and basic logging/error handling.
