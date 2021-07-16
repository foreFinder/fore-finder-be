# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'ACb2cbb6258e9068a2a4a9ae3499d305c7'
auth_token = '298fc9d50151f6315338e2a720e16649'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+12406161914' # Your Twilio number
to = '+13197952720' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "It works?!?!?!"
)