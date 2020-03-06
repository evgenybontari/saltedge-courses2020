#Write a method that takes 2 numbers as arguments and outputs their product.
def two_numbers(num1, num2)
puts "product: #{num1 * num2}"
end
two_numbers(11,22)

#Write a method that takes any amount of numbers as arguments and outputs their product.
def numbers(*num)
  num.sum * 3
end
numbers(2,3,4,5)

#Write a method that takes 2 keyword arguments: dividend and divisor,
#and outputs the result of dividing the dividend by the divisor. Try to
#change the order of the keyword arguments when invoking the method!
def result_of_dividing(divident: 33, divisor:3)
  p "Result: #{divident / divisor}"
end
result_of_dividing(divident:99, divisor:9)
result_of_dividing(divisor:7, divident: 77)

#Do the same as in exercise 3, but make the dividend a simple argument
#(not a keyword one). See if changing the order of the arguments still works!
def result_of_dividing(divident: 33, divisor:3)
  p "Result: #{divident / divisor}"
end
(divident:99, divisor:)

#Write your own proc that will do something with the name and
#use it with the get_name_and_call method. No exact
#indications this time. Be creative.

full_name = proc do |first, last|
  puts "Hello, #{first} #{last}"
end

def get_name_and_call(some_proc)
  puts "What is your first name?"
  first = gets.chomp
  puts "What is your last name?"
  last = gets.chomp
  some_proc.call(first, last)
end
