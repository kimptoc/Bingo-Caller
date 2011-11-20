module Utils
  class ThreadHelper

    @@threads = {}

    def self.name(thread = Thread.current)
      
      #@@threads = {} unless @@threads.present?

      thread_name = @@threads[thread]
      unless thread_name.present?
        @@threads[thread] = "THD"+ (@@threads.size+1).to_s
        thread_name = @@threads[thread]
      end

      return thread_name      
    end

    # @@scheduler = Rufus::Scheduler.start_new

    # def self.scheduler
      # @@scheduler
    # end
  end
end