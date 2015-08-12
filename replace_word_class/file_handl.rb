class File_handl
  def initialize(file_name)
    @file_name = file_name
  end

  def file_extract()
    begin
      File.open("#{@file_name}","r").read
    rescue
      puts "Error in opening file  "
      abort
    end
  end

  def file_write(file_cont)
    begin
      File.open("#{@file_name}","w") {|file| file.write(file_cont)}
    rescue
      puts "Error in modifying file  "
      abort
    end
  end

  def disp()
    begin
      puts File.open("#{@file_name}","r").read
    rescue
      puts "Error in displaying file "
    end
  end

end
