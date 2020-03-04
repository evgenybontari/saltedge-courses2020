#Problem 1
#Use the each method of Array to iterate over [1,2,3,4,5,6,7,8,9,10], and print out each value.

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each { |index| puts index }

#Problem 2
#Save as above, but only print out values greater than 5
arr.each { |number| puts number if number > 5 }

#Problem 3
#Now, using the same array from #2, use the select method to extract all odd numbers into a new array.
arr2 = arr.select do |number|
	number.odd?
end
print arr2

#Problem 4
#Append 11 to the end of original array. Prepend 0 to the beginning.
arr.push(11)
arr.unshift(0)

#Problem 5
#Get rid of 11.And append a 3
 arr.delete(11)
 arr.push(3)

#Problem 6
#Get rid of duplicates without specifically removing any one value.
arr.uniq

#Problem 7
#Tell what's the major difference between an Array and a Hash?
Arrays are ordered, integer-indexed collections of any object. Array indexing starts at 0.
A negative index is assumed to be relative to the end of the array—that is, an index of -1 indicates the last element of the array, -2 is the next to last element in the array, and so on.
A Hash is a collection of key-value pairs. It is similar to an Array, except that indexing is done via arbitrary keys of any object type, not an integer index.
Hashes enumerate their values in the order that the corresponding keys were inserted.
Hashes have a default value that is returned when accessing keys that do not exist in the hash. By default, that value is nil.

#Problem 8
#Suppose you have a hash h = {a:1, b:2, c:3, d:4}
h = { a:1, b:2, c:3, d:4 }

#Problem 9
#Can hash values be arrays?
Yes.
hash_arrays = {
  :array1 => [1,2,3],
  :array2 => [4,5,6],
  :array3 => [7,8,9]
}
#Can you have an array of hashes? (give examples)
Yes.
array_hashes = [
  {
    :array1 => [1,2,3],
    :array2 => [4,5,6],
    :array3 => [7,8,9]
  }
  ]

#Problem 10
#Given the following data structures. Write a program that copies the information
#from the array into the empty hash that applies to the correct person.
#contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
#contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
contact_data = [
  ["joe@email.com", "123 Main st.", "555-123-4567"],
  ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]
]
contacts = {
  "Joe Smith" => {},
  "Sally Johnson" => {}
}

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]

#Problem 11
#Using the hash you created from the previous exercise, demonstrate how you would access Joe's email and Sally's phone number?
puts contacts["Joe Smith"][:email]
puts contacts["Sally Johnson"][:phone]

#Problem 12
#Use Ruby's Array method delete_if and String method start_with? to delete all of the words that begin with an "s" in the following array.
#arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
#Then recreate the arr and get rid of all of the words that start with "s" or starts with "w".

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |word| word.start_with?("s") }
arr.delete_if { |word| word.start_with?("s", "w") }

#Problem 13
#Take the following array:
#a = ['white snow', 'winter wonderland', 'melting ice','slippery sidewalk', 'salted roads', 'white trees'
#and turn it into a new array that consists of strings containing one word. (ex. ["white snow", etc...] → ["white", "snow", etc...].
#Look into using Array's map and flatten methods, as well as String's split method.
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a = a.map { |pairs| pairs.split }
a = a.flatten
print a

#Problem 14
#What will the following program output?
#hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true} hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}
#if hash1 == hash2 puts "These hashes are the same!" else puts "These hashes are not the same!" end
hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end

#Problem 15
#Programmatically loop or iterate over the contacts hash from exercise 10,
#and populate the associated data from the contact_data array.
#Hint: you will probably need to iterate over ([:email, :address, :phone]),
#some helpful methods might be the Array shift and first methods.
contact_data = [
  ["joe@email.com", "123 Main st.", "555-123-4567"],
  ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]
]
contacts = {
  "Joe Smith" => {},
  "Sally Johnson" => {}
}
fields = [:email, :address, :phone]

contacts.each do |name, hash|
  fields.each do |field|
    hash[field] = contact_data.shift
  end
end
