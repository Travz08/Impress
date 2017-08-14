#I want to buy this item(s) that costs $____ by this date how much money do i need to save each week to obtain this item(s).
# Note: It can be converted to hours (how much hours I need to work to get this item)-----> a bar graph of hours
require 'colorize' #text color
require 'artii' #title gem
require 'date' #current date
require 'tty-prompt' #prompt gem
require "continuation" #save point/ check point


class User
  def initialize(name, balance, email, password)
    @name = name
    @balance = balance
    @email = email
    @password = password
  end
  attr_accessor :name, :balance, :email, :password
end

class Time
  def initialize(amount)
    @amount = amount
  end
  attr_accessor :amount
  def dateweek(amount)
    (amount)/4
  end
  def datemonth(amount)
    amount
  end
  def dateyear(amount)
    amount*12
  end
end

class Expense
  def initialize(spending)
    @spending = spending
  end
  attr_accessor :spending
  def shoppingcart(cart)
    cart.inject(0){|sum,x| sum + x }*4
  end
end

class Goals
  def initialize(hashtag)
    @hashtag = hashtag
  end
  attr_accessor :hashtag
  def total(student)
  student.balance - hashtag
  end
end


###########The App Begins Here ##############
cart = []
array = []
system("clear")
def noWay
  puts "Can't accept this."
end
def welcome
    `say -v Zarvox Welcome #{@name} to Hashtag Goals`
end
def art
    `artii '#GOAL$'`.colorize(:yellow)
end
prompt = TTY::Prompt.new
dolla = prompt.decorate('$', :yellow)
continuation = callcc { |c| c } # define our savepoint
continuation
hi = prompt.select("Welcome to #GOAL$", %w(Log\ in Sign\ Up))
hi
case hi
when "Log\ in"
  email = prompt.ask('What is your email?')
  email
  if email == @correct
  password = prompt.mask('What is your password?', mask: dolla)
  password

  else
  puts "Incorrect Email.\nThe email you entered doesn't appear to belong to an account.\nPlease check your email address and try again.".colorize(:red)
  continuation.call(continuation)
  end

when "Sign\ Up"
  @correct = prompt.ask('What is your email?') { |q| q.validate :email }
  @correct
  pw = prompt.mask('Create a password:', mask: dolla)
  pw
  puts ("Please enter your name:")
  @name = gets.chomp
  continuation.call(continuation)
end
if password == pw
  system ("clear")
else
  puts "Incorrect Password.\nThe password you've entered is incorrect.\nPlease try again.".colorize(:red)
  continuation.call(continuation)
end
puts art
puts "Welcome #{@name} to #GOAL$"
welcome
puts "Please state your monthly income:"
balance = gets.chomp.to_i
system("clear")
student = User.new(@name, balance, email, password)
# puts "So your monthly income is #{student.balance}"
# go = false
# while go == false
#
# puts "Greeting. Enter Name:"
# name = gets.chomp
#   if name == ""
#     noWay()
#     puts "This field cannot be blank"
#     puts "Enter your name again:"
#   else
#     go = true
#     puts "Hello #{name}, How old are you?"
#     age = gets.chomp.to_i
#   end
# end
# #Collets input about income, pushes it all to the object set_user.
# go = false
# while go == false
# puts "Please state your monthly wage"
# balance = gets.chomp.to_i
#   if balance <= 0
#     noWay()
#   else go = true
#     student = User.new(name, age, balance)
#     puts "So your monthly income is #{student.balance}"
#   end
# end
#Collets info about outcomes, pushes it to the class Expenses and calculates total outcome.
go = false
while go == false
puts "How many expenses do you have?"
expense_count = gets.chomp.to_i
  if expense_count <= 0
    noWay()
  else go = true
    system("clear")
    i = 0
    while i < expense_count
      puts "Name your expenses:"
      input = gets.chomp
      system("clear")
      array << input
      i += 1
    end
  end
end

money = Expense.new(array)

money.spending.each do |x|
  go = false
  while go == false
    puts "How much do you spend on #{x} per week?"
    answer = gets.chomp.to_i
    if answer <= 0
      noWay()
    else go = true
      system("clear")
      cart << answer
    end
  end
end


total1 = money.shoppingcart(cart)
puts "#{@name}, You spend a total of $#{total1} per month"
goal = Goals.new(total1)


#Collecting info about user's desired item
go = false
while go == false
puts "What is your goal:"
treat = gets.chomp
  if treat == ""
    noWay()
  else go = true
    go = false
    while go == false
    puts "How much is this #{treat}?"
    price = gets.chomp.to_i
      if price <= 0
        noWay()
      else go = true
        system("clear")
        puts "Alright so you want a #{treat} that costs $#{price}"
      end
    end
  end
end

#DATES
deadline = prompt.select("Would you like to achieve your goal in:", %w(Weeks Months Years))
deadline
system("clear")
case deadline
when "Weeks"
  puts "In how many weeks?"
  timeline = gets.chomp.to_i
  system("clear")
  finaldatew = Time.new(timeline)
  weeksResult = finaldatew.dateweek(timeline)
  remainder = goal.total(student)
  reality = (remainder*weeksResult - price)
  deadlinew = (DateTime.now + (timeline*7))
  if student.balance < (price/timeline)
    puts "Please reconsider your deadline date and try again."
  elsif remainder*weeksResult > price
    puts "at your deadline #{deadlinew} you can buy your goal item and have $#{reality} remaining"
  elsif remainder*weeksResult < price
    save = (price - remainder*weeksResult)/timeline
    puts "You may have to re-evaluate your expenses. and try to save another $#{save.abs} per week in order to reach your goal"
  end
when "Months"
  puts "In how many months?"
  months = gets.chomp.to_i
  system("clear")
  finaldate = Time.new(months)
  monthsResult = finaldate.datemonth(months)
  remainder = goal.total(student)
  reality = (remainder*months - price)
  deadline = (DateTime.now + (months*30))
  if student.balance < (price/months)
    puts "Please reconsider your deadline date and try again."
  elsif remainder*months > price
    puts "at your deadline #{deadline} you can buy your goal item and have $#{reality} remaining"
  elsif remainder*months < price
    save = (price - remainder*months)/months
    puts "You may have to re-evaluate your expenses. and try to save another $#{save.abs} per week in order to reach your goal"
  end
when "Years"
  puts "In how many years?"
  timeline = gets.chomp.to_i
  system("clear")
  finaldatey = Time.new(months)
  yearsResult = finaldatey.dateyear(timeline)
  remainder = goal.total(student)
  reality = (remainder*yearsResult - price)
  deadliney = (DateTime.now + (timeline*365))
  if student.balance < (price/timeline)
    puts "Please reconsider your deadline date and try again."
  elsif remainder*yearsResult > price
    puts "at your deadline #{deadliney} you can buy your goal item and have $#{reality} remaining"
  elsif remainder*yearsResult < price
    save = (price - remainder*yearsResult)/timeline
    puts "You may have to re-evaluate your expenses. and try to save another $#{save.abs} per week in order to reach your goal"
  end
end
continue = prompt.select("Would you like to:", %w(Enter\ new\ goal Log\ out))
continue
case continue
when "Enter new goal"
  #Try  to loop back to after log in
when "Log out"
  exit
end
