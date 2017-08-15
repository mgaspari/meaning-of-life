require 'twilio-ruby'
class Messages

  attr_accessor :number, :password
  def initialize(number)
    @number = number.gsub(/\s+/, "")
  end

  def full_send
    @password = rand.to_s[2..5]
    account_sid = "account-sid"
    auth_token = "auth-token"
    client = Twilio::REST::Client.new account_sid, auth_token

    client.messages.create(
      from: "+12019034298",
      to: "+1#{@number}",
      body: "Hi! Your code is #{@password}"
      )
    end
end

def the_start
  sts = false
  counter = 0

  puts "Welcome to the reference for the universe! If you'd like to find out the meaning of life, enter your phone number!"
  number = gets.chomp
  message_sending = Messages.new(number)
  message_sending.full_send

  while sts == false && counter < 10
    puts "Verify you are a living being by typing in the code we sent to your phone:"
    answer = gets.chomp
    counter += 1
    if answer == message_sending.password
      puts "The meaning of life is YOLO"
      sts = true
    else
      puts "Wrong password"
    end
  end
end
the_start
