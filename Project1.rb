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


###########The App Begins Here ##############
cart = []
array = []
system("clear")
system("artii '#GOAL$'")

def noWay
  puts "Can't accept this."
end

#Collets input about user.
go = false
while go == false

puts "Greeting. Enter Name:"
name = gets.chomp
  if name == ""
    noWay()
    puts "This field cannot be blank"
    puts "Enter your name again:"
  else
    go = true
    puts "Hello #{name}, How old are you?"
    age = gets.chomp.to_i
  end
end
#Collets input about income, pushes it all to the object set_user.
go = false
while go == false
puts "Please state your monthly wage"
balance = gets.chomp.to_i
  if balance <= 0
    noWay()
  else go = true
    student = User.new(name, age, balance)
    puts "So your monthly income is #{student.balance}"
  end
end


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
puts "You spend a total of #{total1} per month"
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

puts "Would you like to achieve your goal in:"
go = false
while go == false
puts "a) Weeks\nb) Months\nc) Years"
deadline = gets.chomp.downcase
  if deadline != "a" && deadline !="b" && deadline != "c"
    noWay()
  else go = true
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
          else remainder*weeksResult < price
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
          else remainder*months < price
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
          else remainder*yearsResult < price
            save = (price - remainder*yearsResult)/timeline
            puts "You may have to re-evaluate your expenses. and try to save another $#{save.abs} per week in order to reach your goal"
          end

      end
    end
  end
