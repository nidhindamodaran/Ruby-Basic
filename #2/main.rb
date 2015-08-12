#Replaces word in files
file_read = File.open("file_test","r")
cont = file_read.read
puts cont
puts "Enter the word to find and replace"
find_word = gets.delete!("\n")
if cont =~ /\b#{find_word}\b/
  puts "Enter the new word  "
  new_word = gets.delete!("\n")
  cont = cont.gsub(/#{find_word}/, new_word)
  file_write = File.open("file_test","w")
  file_write.puts cont
  file_write.close
  p File.open("file_test","r").read
else
  puts "Error in finding the word in the string"
end
