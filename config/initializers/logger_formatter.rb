module ActiveSupport
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

      #@threads = {} unless @threads.present?
      #
      #threadName = @threads[Thread.current]
      #unless threadName.present?
      #  @threads[Thread.current] = "THD"+ (@threads.size+1).to_s
      #  threadName = @threads[Thread.current]
      #end

      message = "%s:%s: %s>%s" % [Utils::ThreadHelper.name,
                                       level,
                                     Time.now.strftime("%H:%M:%S"),
                                     message]

      message = "#{message}\n" unless message[-1] == ?\n
      buffer << message
      auto_flush
      message
    end
  end
end
