#Replaces word in files using frst and last marker
file_read = File.open("test_file","r")
cont = file_read.read
puts cont
puts "Enter the first and last letter of word to find and replace"
f = gets.delete!("\n")
l = gets.delete!("\n")
if cont =~ /\b#{f}.*#{l}\b/
  puts "Enter the new word  "
  new_word = gets.delete!("\n")
  cont = cont.gsub(/\b#{f}.*#{l}\b/, new_word)
  file_write = File.open("test_file","w")
  file_write.puts cont
  file_write.close
  p File.open("test_file","r").read
else
  puts "Error in finding the word in the string"
end
