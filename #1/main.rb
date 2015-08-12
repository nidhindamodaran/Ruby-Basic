file = File.open("test")
cont_arr = file.read.scan(/\w+/)
p cont_arr.length
