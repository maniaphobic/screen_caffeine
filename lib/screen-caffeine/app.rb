require 'screen-caffeine/processes'

module ScreenCaffeine
  class App
    def run
      while video_playing? do
        `xte 'mousermove 1 1' ; sleep 2`
      end
    end
    def video_playing?
      !ScreenCaffeine::Processes.new.filter(/libflash|vlc/).empty?
    end
  end
end
