#code counts number of words in a file string and no. of occurence
file = File.open("test")
cont_arr = file.read.scan(/\w+/)
puts "\n#{cont_arr.length} letters\n\n"
hash = Hash.new(0)
cont_arr.each do |cont|
  hash[cont]+=1
end
#p hash
hash.each do |i , j|
  puts "#{i} -------> appeared #{j} time(s)"
end
