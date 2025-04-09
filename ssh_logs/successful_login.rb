require_relative "../lib/log_entry.rb"
require "time"

class SuccessfulLogin
  def self.parse(line)
    LogEntry.new(
      type: "successful_login",
      date: extract_date(line),
      user: extract_user(line),
      ip: extract_ip(line),
      port: extract_port(line),
      info: extract_ssh_info(line)
    )
  end

  private

  def self.extract_date(line)
    Time.parse(line[/^[A-Z][a-z]+\s+\d+\s[\d:]+/]) rescue nil
  end

  def self.extract_user(line)
    line[/for (\w+)/, 1]
  end

  def self.extract_ip(line)
    line[/from (\d+\.\d+\.\d+\.\d+)/, 1]
  end
  
  def self.extract_port(line)
    line[/port (\d+)/, 1]
  end

  def self.extract_ssh_info(line)
    line[/ssh\d/]
  end
end