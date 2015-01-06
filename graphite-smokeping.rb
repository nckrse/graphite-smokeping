#!/usr/bin/env ruby

require 'net/fping'
require 'socket'

gr_source = Socket::gethostname.gsub(".", "-")
gr_server = '192.168.56.203'
gr_path = gr_source + ".network.ping.latency"

#latency_s = Net::Fping::latency_simple("4.2.2.2")
latency = Net::Fping::latency("4.2.2.2", "68", "6", "1000")
metric = ["loss", "min", "avg", "max"]

latency.zip metric
latency.zip(metric).each do |value, metric|
  time = Time.new
  epoch = time.to_i
  sock = TCPSocket.open("#{gr_server}", 2003)
  sock.write("#{gr_path}.#{metric} #{value} #{epoch}\n")
  sock.close
end
