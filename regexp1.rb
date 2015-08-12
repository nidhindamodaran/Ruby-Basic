#regexp accepting following inputs
#regexp -->  all(:conditions=>{..},:joins=>{..} ----------->where(cons).joins(join_cons) Advanced
#acceptable inputs
=begin
-------------------------------------------------
1. all(:conditions=>{:id=>{10},:name=>{:first=>"nidhin"}},:joins=>{:id=>{20},:name=>{:last=>"d"}})
2. all(:conditions=>{:id=>{10},:name=>{:first=>"nidhin"}},:select=>{:id=>{20}})
3.all(:joins=>{:id=>{20},:name=>{:last=>"d"}})
4.all()
5.all(:joins=>{:id=>{20},:name=>{:last=>"d"}},:conditions=>{:id=>{10},:name=>{:first=>"nidhin"}})
-------------------------------------------------
=end
puts "Enter the string"
str = gets.chomp
conditions= false
second, iter = "",""
puts str
defined = [["conditions"],["joins"],["select"],["order"],["group"],["having"]]
selector = Array.new
p selector = str.scan(/:([a-zA-Z]*)=>/)
intp = (defined & selector)
intp.each do |i|
  iter =  i.join(",")
  if(iter == "conditions")
    conditions = true
  else
    second = iter
end
end
p str_sub1 = str.scan(/:conditions=>\{(.*?)\}(?=,:#{second})/).join(",")
p str_sub2 = str.scan(/:#{second}=>\{(.*?)\}(?=)\)/).join(",")
if conditions
  if second
    puts "where(#{str_sub1}).#{second}(#{str_sub2})"
  else
    puts "where(#{str_sub1})"
  end
else
  if second
    puts "#{second}(#{str_sub2})"
  end
end
