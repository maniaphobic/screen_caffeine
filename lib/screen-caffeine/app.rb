require 'screen-caffeine/processes'

module ScreenCaffeine
  class App
    def default_interval
      60
    end

    def move_mouse
      begin
        `xte 'mousermove 1 1'`
      rescue Errno::ENOENT
        raise(<<-EOF
Please install xte. Debian-based distributions package it as "xautomation".'
            EOF
             )
      end
    end

    def run(options = {})
      while true
        move_mouse
        sleep(options.fetch('interval', default_interval))
      end if video_playing?
    end

    def video_playing?
      !ScreenCaffeine::Processes.new.filter(/libflash|vlc/).empty?
    end
  end
end
