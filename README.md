# Hourly webcam snapshot

## Installation

### Required software
* imagesnap (`brew install imagesnap`)

### Clone
```sh
git clone https://github.com/weiland/mac-secure-webcam
```

### ToDo
* adjust variables in `webcam.sh`
* adjust contents of `run.app` (to match path)
* create a (hourly) cronjob like
```sh
# change the path to your run.app
0 * * * * open ~/code/hourly-image/run.app >> ~/cron.log 2>&1
```

The `run.app` is required to be able to access the webcam.
