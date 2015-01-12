graphite-smokeping
==================

Ruby smokeping daemon, sends ping latency data to graphite

####1. clone and install deps
```
git clone https://github.com/pythianreese/graphite-smokeping.git
cd graphite-smokeping
bundle install
```
####2. Customize smokeping_hosts file
```
vi smokeping_hosts
```
####3. Start / Stop / Check status
```
Examples:

$ graphite-smokeping_svc start -- 192.168.56.203 # Start service

$ ruby gte-smokeping_svc status # Check service status
graphite-smokeping: running [pid 4409]

$ graphite-smokeping_svc stop # Stop service
graphite-smokeping: trying to stop process with pid 4409...
graphite-smokeping: process with pid 4409 successfully stopped.

$ graphite-smokeping 192.168.56.203 # Run in foreground for testing
```
