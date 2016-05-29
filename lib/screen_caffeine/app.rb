# encoding: UTF-8

require 'screen_caffeine/processes'

#
module ScreenCaffeine
  #
  class App
    def initialize(options = {})
      @options = defaults.merge(options)
      @xte     = '/usr/bin/xte'
      raise(<<-EOF
Please install xte. Debian-based distributions package it as "xautomation".'
            EOF
           ) unless File.exist?(@xte)
    end

    def defaults
      {
        'interval'    => 60,
        'mouse_mover' => 'xte \'mousermove 1 1\''
      }
    end

    def move_mouse
      `#{@options['mouse_mover']}`
    end

    def run
      while video_playing?
        move_mouse
        sleep(@options['interval'])
      end
    end

    def video_playing?
      !ScreenCaffeine::Processes.new.filter(/libflash|vlc/).empty?
    end
  end
end
