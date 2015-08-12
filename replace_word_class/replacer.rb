class Replacer
  def initialize(file_obj)
    @file_obj = file_obj
  end

  def find_word()
    puts "Enter the word to find : "
    gets.chomp
  end

  def rep_word()
    puts "Enter the word to replace :"
    gets.chomp
  end

  def call
    file_cont = @file_obj.file_extract()
    find_word = self.find_word
    if file_cont =~ /\b#{find_word}\b/
      replace_word = self.rep_word
      file_cont = file_cont.gsub(/#{find_word}/, replace_word)
      @file_obj.file_write(file_cont)
      return "replaced"
    else
      "Error in finding the word in the string"
    end
  end
end
