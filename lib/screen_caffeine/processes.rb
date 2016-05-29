#
module ScreenCaffeine
  #
  class Processes
    def initialize
      @list = []
      self
    end

    def filter(conditions)
      processes if @list.empty?
      @list.select { |p| p =~ conditions }
    end

    def isolate_commands(raw_list)
      raw_list.map { |p| p.squeeze(' ').split(' ').drop(7).join(' ') }
    end

    def processes
      @list = isolate_commands(raw_processes)
    end

    def raw_processes
      `ps -ef`.split("\n")
    end
  end
end
