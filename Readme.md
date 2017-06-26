# Food Chooser

A simple ruby script to choose where to eat.
It is using slack outgoing and incomming webhook to trigger notifications.

# How to use it
Everyday at that you've set, Food Chooser will choose a random place to eat and send it to slack.
You can also trigger it with the keyword "manger".

Once FoodChoose has send a place, you have up do 5 minute to send "non" and it will resend a new place.


# Configuration
Configuration is set by using environment variables

 * PLACES: The list of places (CSV)
 * SLACK_HOOK: Incomming slack url
 * MIDI_URL: The Food Chooser URL (Used to send hacked notification (see clock.rb horrot))
 * REMIND_TIME: When should Food Chooser remind you to eat

# Running

Install dependencies with
```shell
bundle install
```

The app is in two part:

## The sinatra app

This app should manage slack incomming and outgoing webhooks. It has a single endpoint: `POST /slack`

You can launch it with:

```shell
ruby app.rb
```

## The clock

This clock is responsible for sending daily notifications.
You can launch it with:
```shell
clockwork clock.rb
```
