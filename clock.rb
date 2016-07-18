require 'clockwork'
require 'net/http'

module Clockwork
  handler do |job|
    STDERR.puts "Running #{job}"
    Net::HTTP.post_form(ENV["MIDI_URL"], "text"=>"manger")
  end

  every(1.day, 'Send notification', :at => ENV["REMIND_TIME"])
end