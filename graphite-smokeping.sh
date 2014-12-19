#!/bin/bash

# FPING LOCATION
FPING=/usr/sbin/fping
# PING COUNT
COUNT=6
# PING INTERVAL (in milliseconds)
INTERVAL=1000
# BYTES PER PING
BYTES=68
# PING SOURCE HOST
SOURCE=`hostname | sed 's/\./\-/g'`
# GRAPHITE SERVER
GRAPHITE=127.0.0.1
# GRAPHITE PATH
GRATH=$SOURCE.network.ping.latency

for i in `cat smokeping_hosts`; do
    HOST=$i;
    HOSTNAME=`echo -n $i | sed 's/\./\-/g'`
    OUTPUT=`$FPING -b $BYTES -c $COUNT -q -p $INTERVAL $HOST 2>&1 | awk '{print $5,$8}' | tr -d "%|," | tr -s " " "/" | awk -F"/" '{print $3,$4,$5,$6}'`
    tab=( $OUTPUT )
    echo "$GRATH.$HOSTNAME.loss ${tab[0]} `date +%s`" | nc $GRAPHITE 2003
    echo "$GRATH.$HOSTNAME.min ${tab[1]} `date +%s`" | nc $GRAPHITE 2003
    echo "$GRATH.$HOSTNAME.max ${tab[3]} `date +%s`" | nc $GRAPHITE 2003
    echo "$GRATH.$HOSTNAME.avg ${tab[2]} `date +%s`" | nc $GRAPHITE 2003
done