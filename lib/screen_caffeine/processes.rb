#
module ScreenCaffeine
  #
  class Processes
    def initialize
      @list = []
      self
    end

    def filter(conditions)
      @list = processes if @list.empty?
      @list.select { |p| p =~ conditions }
    end

    def processes
      Dir.glob('/proc/[0-9]*/cmdline').map do |cmdline|
        begin
          IO.read(cmdline)
        rescue
          ''
        end
      end
    end
  end
end
