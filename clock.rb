require 'clockwork'
require 'net/http'

module Clockwork
  handler do |job|
    STDERR.puts "Running #{job}"
    uri = URI(ENV["MIDI_URL"])
    Net::HTTP.post_form(uri, "text"=>"manger")
  end

  every(1.day, 'Send notification', :at => ENV["REMIND_TIME"])
end
