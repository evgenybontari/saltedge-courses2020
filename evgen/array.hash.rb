#1
names.rb

#2
names.map(&:size).sum

print names.each { |el| print el.length }

count = 0
names.each {|s| count += s.length}
puts count

#3
names = names.map(&:downcase)

#4
hash = names.each_with_object({})
  do|element, object|
  object[element] = element.size
end

#5
puts names.max_by(&:length)

#6
longest_name = names.max_by(&:length)
longest_name_index = names.index(longest_name)
print longest_name_index

#7
puts names.sort_by(&:length)

#8
count = 0
names_2d.each {|s| count += s.length}
puts count

print names_2d.sort_by(&:length)
