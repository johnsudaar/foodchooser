#!/usr/bin/ruby

require 'slack-notifier'
require 'sinatra'

LAST_SENT = Time.now()
PLACES    = ENV["PLACES"].split(",")
NOTIFIER  = Slack::Notifier.new ENV["SLACK_HOOK"]

post '/slack' do
  message = params[:text]

  if message.include? "manger" || (message.include? "non" && Time.now - LAST_SENT < 60 * 5)
    NOTIFIER.ping "Je vous propose d'aller manger chez #{PLACES.sample}"
    LAST_SENT=Time.now
  end
end

