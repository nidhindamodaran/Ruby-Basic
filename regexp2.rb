=begin
  pattern accepting
^^^^^^^^^^^

1.a+b+c
2.avg(a,b,c)+best(1,a,f)+a+f..
3.a+b+avg(a,b,c)+d+e+best(1,a,f)+h+
=end
#selected
=begin
^[a-z]((\+|\-)[a-z])*$
avg\([0-9](\,(?=[a-z])[a-z])*\)  -----> avg()
best\([0-9](\,(?=[a-z])[a-z])*\)
=end
puts "Enter the string"
str = gets.chomp
p str
if str =~/^([a-z]|(avg\([a-z](\,(?=[a-z])[a-z])*\))|(best\([0-9](\,(?=[a-z])[a-z])*\)))((\+|\-)*([a-z]|(avg\([a-z](\,(?=[a-z])[a-z])*\))|(best\([0-9](\,(?=[a-z])[a-z])*\))))*$/
  puts "Accepting"
else
  puts "Not Accepting"
end
