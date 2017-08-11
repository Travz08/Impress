#I want to buy this item(s) that costs $____ by this date how much money do i need to save each week to obtain this item(s).
# Note: It can be converted to hours (how much hours I need to work to get this item)-----> a bar graph of hours
require 'date'
date1 = DateTime.now
week = DateTime.now+7
month = DateTime.now+30
year = DateTime.now+365

dw = (week - date1).to_i
dm = (month - date1).to_i
dy = (year - date1).to_i

class User
  def initialize(name, age, balance)
    @name = name
    @age = age
    @balance = balance
  end
  attr_accessor :name, :age, :balance
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



cart = []
array = []

system("clear")
system("artii '#GOAL$'")
puts "Greeting. Enter Name:"
name = gets.chomp
system("clear")
puts "Hello #{name}, How old are you?"
age = gets.chomp.to_i
system("clear")
puts "Please state your monthly income"
balance = gets.chomp.to_i
system("clear")
student = User.new(name, age, balance)
puts "So your monthly income is #{student.balance}"

puts "How many expenses do you have?"
expense_count = gets.chomp.to_i
system("clear")
i = 0
while i < expense_count
puts "Enter expenses:"
input = gets.chomp
system("clear")
array << input
i += 1
end

money = Expense.new(array)

money.spending.each do |x|
  puts "How much do you spend on #{x} per week?"
  answer = gets.chomp.to_i
  system("clear")
  cart << answer
end

total1 = money.shoppingcart(cart)
puts "You spend a total of #{total1} per month"
goal = Goals.new(total1)

puts "Name your goal:"
treat = gets.chomp
puts "How much is this #{treat}?"
price = gets.chomp.to_i
system("clear")
puts "Alright so you want a #{treat} that costs $#{price}"



#DATES
puts "Would you like to achieve your goal in:"
puts "a) Weeks\nb) Months\nc) Years"
deadline = gets.chomp
system("clear")

case deadline
  when "a"
    puts "In how many weeks?"
    timeline = gets.chomp.to_i
    system("clear")
    finaldatew = Time.new(timeline)
    weeksResult = finaldatew.dateweek(timeline)
    remainder = goal.total(student)
    reality = (remainder*weeksResult - price)
      if student.balance < (price/timeline)
        puts "Please reconsider your deadline date and try again."
      elsif remainder*weeksResult > price
        puts "at your deadline you can buy your goal item and have $#{reality} remaining"
      elsif remainder*weeksResult < price
        save = (price - remainder*weeksResult)/timeline
        puts "You may have to re-evaluate your expenses. and try to save another $#{save.abs} per week in order to reach your goal"
      end
  when "b"
    puts "In how many months?"
    months = gets.chomp.to_i
    system("clear")
    finaldate = Time.new(months)
    monthsResult = finaldate.datemonth(months)
    remainder = goal.total(student)
    reality = (remainder*months - price)
      if student.balance < (price/months)
        puts "Please reconsider your deadline date and try again."
      elsif remainder*months > price
        puts "at your deadline you can buy your goal item and have $#{reality} remaining"
      elsif remainder*months < price
        save = (price - remainder*months)/months
        puts "You may have to re-evaluate your expenses. and try to save another $#{save.abs} per week in order to reach your goal"
      end
  when "c"
    puts "In how many years?"
    timeline = gets.chomp.to_i
    system("clear")
    finaldatey = Time.new(months)
    yearsResult = finaldatey.dateyear(timeline)
    remainder = goal.total(student)
    reality = (remainder*yearsResult - price)
      if student.balance < (price/timeline)
        puts "Please reconsider your deadline date and try again."
      elsif remainder*yearsResult > price
        puts "at your deadline you can buy your goal item and have $#{reality} remaining"
      elsif remainder*yearsResult < price
        save = (price - remainder*yearsResult)/timeline
        puts "You may have to re-evaluate your expenses. and try to save another $#{save.abs} per week in order to reach your goal"
      end
    end
end
#translates to amount of months
# weeksResult = finaldate.dateweek(timeline)
#amount leftover

#deadline

#amount leftover per month*amount of months - price

# woo = (remainder*weeks - price)
#

#impossible

# elsif woo2 > remainder*months
#   puts "at your deadline you can buy your goal item and have #{woo} remaining"
# elsif woo2 < remainder*months
#   save = (price - remainder*months)/timeline
#   puts "You may have to re-evaluate your expenses. and try to save another #{save} per month in order to reach your goal"
