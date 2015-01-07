graphite-smokeping
==================

Ruby smokeping daemon, sends ping latency data to graphite

####1. clone and install deps
```
git clone https://github.com/pythianreese/graphite-smokeping.git
gem install net-fping
gem install daemons
```
####2. Customize smokeping_hosts file
```
cd graphite-smokeping/
vi smokeping_hosts
```
####3. Start / Stop / Check status
```
Examples:

$ ruby graphite-smokeping_d.rb start -- 192.168.56.203

$ ruby graphite-smokeping_d.rb status
graphite-smokeping: running [pid 4409]

$ ruby graphite-smokeping_d.rb stop
graphite-smokeping: trying to stop process with pid 4409...
graphite-smokeping: process with pid 4409 successfully stopped.
```
