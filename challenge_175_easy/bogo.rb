def bogo_sort(string1, string2)
  i = 0
  i +=1 until string1.split("").shuffle.join == string2
  i
end

iterations = []
10000.times do
  iterations.push(bogo_sort("lolhe","hello"))
end

puts "Average: #{iterations.inject{|sum, el| sum + el} / iterations.size}"