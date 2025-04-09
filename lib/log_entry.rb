class LogEntry
  attr_accessor :type, :date, :user, :ip, :port, :info, :invalid

  def initialize(type:, date:, user:, ip:, port:, info: nil, invalid: false)
    @type = type
    @date = date
    @user = user
    @ip = ip
    @port = port
    @info = info
    @invalid = invalid
  end

  def to_s
    "#{date} [#{type}] #{user} from #{ip} (port #{port})"
  end
end