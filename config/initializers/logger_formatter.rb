class Logger::SimpleFormatter
  def call(severity, time, progname, msg)

    level = {
      "DEBUG" => "DBG",
      "INFO" => "INF",
      "WARN" => "WRN",
      "ERROR" => "ERR",
      "FATAL" => "FTL"
    }[severity] || "???"

    @threads = {} unless @threads.present?

    threadName = @threads[Thread.current]
    unless threadName.present?
      @threads[Thread.current] = "THD"+ (@threads.size+1).to_s
      threadName = @threads[Thread.current]
    end

    "%s:%s:%s>%s\n" % [      time.strftime("%Y%m%d %H:%M:%S.%L") ,
                              level,
                              threadName,
                                   msg]

    #"[#{severity}] #{msg}\n"
  end
end

module ActiveSupportX
  class BufferedLogger

    def add(severity, message = nil, progname = nil, &block)
      return if @level > severity
      message = (message || (block && block.call) || progname).to_s

      level = {
        0 => "DBG",
        1 => "INF",
        2 => "WRN",
        3 => "ERR",
        4 => "FTL"
      }[severity] || "???"

      @threads = {} unless @threads.present?

      threadName = @threads[Thread.current]
      unless threadName.present?
        @threads[Thread.current] = "THD"+ (@threads.size+1).to_s
        threadName = @threads[Thread.current]
      end

      message = "%s:%s: %s>%s" % [threadName,
                                       level,
                                     Time.now.strftime("%Y%m%d %H:%M:%S.%L"),
                                     message]

      message = "#{message}\n" unless message[-1] == ?\n
      buffer << message
      auto_flush
      message
    end
  end
end
