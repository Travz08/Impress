#Dates
require 'date'
date1 = DateTime.now
week = DateTime.now+7
month = DateTime.now+30
year = DateTime.now+365

dw = (week - date1).to_i
dm = (month - date1).to_i
dy = (year - date1).to_i

dk = month.to_i
# puts date1
puts dk
# puts dm
# puts dy
#
# puts month
# puts year
#
# puts "How many weeks?"
# weeks = gets.chomp.to_i
