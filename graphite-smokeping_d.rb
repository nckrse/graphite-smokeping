#!/usr/bin/env ruby
# daemon control for graphite-smokeping.rb

require 'daemons'

unless ARGV.length == 3 || ARGV[0] == "stop" || ARGV[0] == "status"
  puts "\nNot enough or too many arguments.\n\n"
  puts "Usage:"
  puts "       As daemon: ruby graphite-smokeping_d.rb start -- graphite_server"
  puts "       As proc: ruby graphite-smokeping.rb graphite_server\n\n"
  exit
end

if ARGV.length == 3
  arg = ARGV[2]
  cwd = Dir.pwd
  script = cwd + '/graphite-smokeping.rb ' + arg
end

Daemons.run_proc(
  'graphite-smokeping',
  ) do
 Dir.chdir(cwd)
 exec "ruby #{script}"
end 
