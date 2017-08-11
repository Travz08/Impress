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
  # def
  #   savings = (student.balance -)
  # end
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
puts "Greeting. Enter Name:"
name = gets.chomp
puts "Hello #{name}, How old are you?"
age = gets.chomp.to_i
puts "Please state your monthly income"
balance = gets.chomp.to_i
student = User.new(name, age, balance)
puts "So your monthly income is #{student.balance}"

puts "How many expenses do you have?"
expense_count = gets.chomp.to_i

i = 0
while i < expense_count
puts "Enter expenses:"
input = gets.chomp
array << input
i += 1
end

money = Expense.new(array)

money.spending.each do |x|
  puts "How much do you spend on #{x} per week?"
  answer = gets.chomp.to_i
  cart << answer
end
total1 = money.shoppingcart(cart)
puts "You spend a total of #{total1} per month"
goal = Goals.new(total1)

puts "Name your goal:"
treat = gets.chomp
puts "How much is this #{treat}?"
price = gets.chomp.to_i
puts "Alright so you want a #{treat} that costs $#{price}"
puts "When would you like to buy this item?"
puts "1.___ weeks\n2.___ months"
deadline = gets.chomp.to_i
case deadline
when 1
  puts "In how many weeks?"
  timeline = gets.chomp.to_i
when 2
  puts "In how many months?"
  timeline = gets.chomp.to_i
end
finaldate = Time.new(timeline)
#amount leftover
remainder = goal.total(student)
#deadline
weeks = finaldate.dateweek(timeline)
months = finaldate.datemonth(timeline)
#amount leftover per month*amount of months - price

woo = (remainder*weeks - price)
woo2 = (remainder*months - price)

#impossible
if remainder*weeks < (price/timeline)
  puts "Please reconsider your deadline date and try again."
elsif woo > remainder*weeks
  puts "at your deadline you can buy your goal item and have #{woo} remaining"
elsif woo < remainder*weeks
  save = (price - remainder*weeks)/timeline
  puts "You may have to re-evaluate your expenses. and try to save another #{save} per week in order to reach your goal"
# elsif woo2 > remainder*months
#   puts "at your deadline you can buy your goal item and have #{woo} remaining"
# elsif woo2 < remainder*months
#   save = (price - remainder*months)/timeline
#   puts "You may have to re-evaluate your expenses. and try to save another #{save} per month in order to reach your goal"
# end
