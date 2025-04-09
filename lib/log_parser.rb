require_relative "../ssh_logs/failed_login.rb"
require_relative "../ssh_logs/successful_login.rb"
require_relative "../ssh_logs/invalid_user.rb"
require_relative "../ssh_logs/connection_closed.rb"

class LogParser
  attr_accessor :events

  def initialize(file_path)
    @file_path = file_path
    @events = []
  end


  def parse 
    File.foreach(@file_path) do |line|
      case line
      when /Failed password/
        @events << FailedLogin.parse(line)
      when /Accepted password/
        @events << SuccessfulLogin.parse(line)
      when /invalid user/
        @events << InvalidUser.parse(line)
      when /Connection closed|Disconnected/
        @events << ConnectionClosed.parse(line)
      end
    end
  end
end

         