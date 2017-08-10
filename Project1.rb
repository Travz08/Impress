#I want to buy this item(s) that costs $____ by this date how much money do i need to save each week to obtain this item(s).
# Note: It can be converted to hours (how much hours I need to work to get this item)-----> a bar graph of hours

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
end

class Expense
  def initialize(spending)
    @spending = spending
  end
  attr_accessor :spending
  def shoppingcart(cart)
    total = cart.inject(0){|sum,x| sum + x }
    puts "Your total amount you spend is #{total}"
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
puts "So your current balane is #{student.balance}"

puts "Enter expenses:"
array << gets.chomp
puts "Enter 2nd"
array << gets.chomp

money = Expense.new(array)

money.spending.each do |idk|
  puts "How much do you spend on #{idk}?"
  answer = gets.chomp.to_i
  cart << answer
end

money.shoppingcart(cart)
