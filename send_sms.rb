# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+12533597214",    # Replace with your phone number
    from: "+12406161914")  # Use this Magic Number for creating SMS

puts message.sid
