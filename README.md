## Name
Looper

## Description
This project contains a number of bash scripts that will allow users to extend their trial period of Intellij IDE, as well as providing the feature to run automatically at a set interval

## Installation
- Simply clone the project using git clone.(branch: experimental)

- cd into the project once cloned into system.

- Make sure to add the following permission to the following scripts:

- chmod +x task.sh
- chmod +x check.sh
- chmod +x autorun.sh
- chmod +x uninstall-autorun.sh

And you are good to go!

## Usage

If you want to run just the trial extender:
```
./looper.sh
```
Or, If you want to run the autorun function and forget about running it ever again:
```
./autorun.sh
```
Finally, If you want to uninstall the autorun scheduler and remove it from ```crontab -l```:
```
./uninstall-autorun.sh
```

## List of Files

# looper.sh

The script you need to use to reset the trial timer

# check.sh

If you are using autorun feature,this script will periodically execute to check interval till the next execution

# autorun.sh

The script add a autorun feature to the cron jobs for looper to execute it automatically every 29 days

# uninstall-autorun.sh

The script finds and gracefully removes any cron jobs previously added by autorun

# task.log

Dump for all logs for the tool

# last_run_timestamp

Check.sh dumps the last execution time of the script in this log


## Support

Many thanks to the forums for helping me pinpoint the source checksums.

## Roadmap

If you have any ideas or suggestions for enhancing this tool please feel free to contact me.

## Contributing

I'm not open to contributions at the moment.

## Authors and acknowledgment

- Aabid

## Project status

Slow ahead. This only works with 2020 July build.
