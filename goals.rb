require 'date'
date1 = DateTime.now
week = DateTime.now+7
month = DateTime.now+30
year = DateTime.now+365

dw = (week - date1).to_i
dm = (month - date1).to_i
dy = (year - date1).to_i

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


class User
  def initialize(name, age, incm)
    @name = name
    @age = age
    @incm = incm
  end
  attr_accessor :name, :age, :incm
  #  def human_array
   #
  #  end
end


class Expenses
  def initialize(outcome)
    @outcome = outcome
  end
  attr_accessor :outcome
  def outcome_summary(outcm)
    total = outcm.inject(0){|sum,x| sum + x }*4
  end
end

class Goals
  def initialize(hashtag)
    @hashtag = hashtag
  end
  attr_accessor :hashtag
  def total(name)
  name.balance - hashtag
  end
end

###########The App Begins Here ##############
usr = []
expensesAmount = []
outcm = []
system("clear")
system("artii '#GOAL$'")

#Collets input about user.
start = false
while start == false

puts "Greeting. Enter Name:"
name = gets.chomp
  if name == ""
    puts "This field cannot be blank"
    puts "Enter your name again:"
  else
    start = true
  puts "Hello #{name}, How old are you?"
    age = gets.chomp.to_i
  end
end


#Collets input about income, pushes it all to the object set_user.
step2 = false
while step2 == false
puts "Please state your monthly wage"
incm = gets.chomp.to_i
  if incm <= 0
    puts "Can't accept this."
  else step2 = true
    set_user = User.new(name, age, incm)
    puts name, age, incm
  end
end

#Collets info about outcomes, pushes it to the class Expenses and calculates total outcome.
step3 = false
while step3 == false
puts "How many expenses do you have?"
expense_count = gets.chomp.to_i
  if expense_count <= 0
    puts "Can't accept this."
  else step3 = true
    system("clear")
    i = 0
    while i < expense_count
      puts "Name your expenses:"
      input = gets.chomp
      system("clear")
      expensesAmount << input
      i += 1
    end
  end
end
expensesName = Expenses.new(expensesAmount)

expensesName.outcome.each do |x|

step4 = false
while step4 == false
puts "How much do you spend on #{x} per week?"
moneySpent = gets.chomp.to_i
  if moneySpent <= 0
    puts "Can't accept this."
  else step4 = true
    outcm << moneySpent
  end
end
total_outcm = Expenses.new(outcm)
results = total_outcm.outcome_summary(outcm)
puts "You spend a total of #{results} per month"

#Passing total result to the Goal object
goal = Goals.new(total_outcm)
#Collecting info about user desired item
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
    reality = (remainder * weeksResult - price)
      if user.incm < (price / timeline)
        puts "Please reconsider your deadline date and try again."
      elsif remainder * weeksResult > price
        puts "at your deadline you can buy your goal item and have $#{reality} remaining"
      elsif remainder * weeksResult < price
        save = (price - remainder * weeksResult) / timeline
        puts "You may have to re-evaluate your expenses. and try to save another $#{save.abs} per week in order to reach your goal"
      end
  when "b"
    puts "In how many months?"
    months = gets.chomp.to_i

    system("clear")
    finaldate = Time.new(months)
    monthsResult = finaldate.datemonth(months)
    remainder = goal.total(user)
    reality = (remainder * months - price)

    if user.incm < (price / months)
      puts "Please reconsider your deadline date and try again."
    elsif remainder * months > price
      puts "at your deadline you can buy your goal item and have $#{reality} remaining"
    else remainder * months < price
      save = (price - remainder * months) / months
      puts "You may have to re-evaluate your expenses. and try to save another $#{save.abs} per week in order to reach your goal"
    end

  when "c"
    puts "In how many years?"
    timeline = gets.chomp.to_i
    system("clear")
    finaldatey = Time.new(months)
    yearsResult = finaldatey.dateyear(timeline)
    remainder = goal.total(user)
    reality = (remainder * yearsResult - price)
      if user.incm < (price / timeline)
        puts "Please reconsider your deadline date and try again."
      elsif remainder * yearsResult > price
        puts "at your deadline you can buy your goal item and have $#{reality} remaining"
      else remainder * yearsResult < price
        save = (price - remainder * yearsResult) / timeline
        puts "You may have to re-evaluate your expenses. and try to save another $#{save.abs} per week in order to reach your goal"
      end
    end
end
