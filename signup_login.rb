# require 'tty-prompt'
# prompt = TTY::Prompt.new
# dolla = prompt.decorate('$', :yellow)
#
# require "continuation" #save point/ check point
# continuation = callcc { |c| c } # define our savepoint
# continuation
# hi = prompt.select("Welcome to #GOAL$", %w(Log\ in Sign\ Up))
# hi
# case hi
# when "Log\ in"
#   email = prompt.ask('What is your email?')
#   email
#   if email == @correct
#   wtf = prompt.mask('What is your password?', mask: dolla)
#   wtf
#   else
#   puts "Incorrect Email.\nThe email you entered doesn't appear to belong to an account.\nPlease check your email address and try again."
#   continuation.call(continuation)
#   end
# when "Sign\ Up"
#   @correct = prompt.ask('What is your email?') { |q| q.validate :email }
#   @correct
#   pw = prompt.mask('Create a password:', mask: dolla)
#   pw
#   continuation.call(continuation)
# end
# if wtf == pw
#   puts "YAY yu can log in"
# else
#   puts "Incorrect Password.\nThe password you've entered is incorrect.\nPlease try again."
#   continuation.call(continuation)
# end
require 'date'
puts DateTime.now.to_date
