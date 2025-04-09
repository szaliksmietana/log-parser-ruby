require 'colorize'
require_relative 'lib/log_parser'

log_file_path = 'logs/sample_auth.log'

log_parser = LogParser.new(log_file_path)

parsed = log_parser.parse

log_parser.events.each do |event|
  puts event
end