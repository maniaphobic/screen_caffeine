module ScreenCaffeine
  class Processes
    def initialize
      @list = []
      self
    end
    def filter(filter)
      get if @list.empty?
      @list.select {|p| p =~ filter}
    end
    def get
      @list = isolate_commands(get_raw)
    end
    def get_raw
      `ps -ef`.split("\n")
    end
    def isolate_commands(raw_list)
      raw_list.map {|p| p.squeeze(' ').split(' ').drop(7).join(' ')}
    end
  end
end
