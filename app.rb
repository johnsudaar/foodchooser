#!/usr/bin/ruby

require 'slack-notifier'
require 'sinatra'

LAST_SENT = Time.now()
PLACES    = ENV["PLACES"].split(",")
NOTIFIER  = Slack::Notifier.new ENV["SLACK_HOOK"]
GlobalState = {}
GlobalState[:last_sent] = Time.now

post '/slack' do
  message = params[:text]
  STDERR.puts "#{Time.now - GlobalState[:last_sent]}"

  if (message.include? ENV["TRIGGER_WORD"]) || (message.include? "non") && Time.now - GlobalState[:last_sent] < 60 * 5
    GlobalState[:last_sent] = Time.now
    NOTIFIER.ping "Je vous propose d'aller manger chez #{PLACES.sample}"
  end
end

