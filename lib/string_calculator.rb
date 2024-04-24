class StringCalculator

  def add numbers_string = ""
    @numbers_string = numbers_string
    @separators = get_separators
    @numbers = get_numbers
    unless has_negatives
      if @numbers.empty?
        0
      elsif @numbers.length == 1
        @numbers[0]
      else
        @numbers.inject {|acu, v| acu + v }
      end
    else
      raise StandardError, "negative numbers not allowed #{has_negatives.join(',')}"
    end
  end

  def get_separators
    separators = [","]
    if @numbers_string =~ /^\/\/.*/
      sep = @numbers_string.split("//")[1].split("\n")[0]
      separators = sep.split("][").map { |v| v.gsub("[",""); }
      separators.map! { |v| v.gsub("]",""); }
    end
    separators
  end

  def get_numbers
    n_string = @numbers_string
    if n_string =~ /^\/\/.*/
      n_string = n_string.split("\n")[1]
    else
      n_string = n_string.gsub "\n" , @separators[0]
    end
    @separators.each { |sep| n_string = n_string.gsub sep, ","}
    numbers = n_string.split ","
    numbers.map! {|n| if n.to_i < 1000 then n.to_i else 0 end }
    numbers
  end

  def has_negatives
    negatives = []
    @numbers.each { |i| negatives << i if  i < 0 }
    if negatives.empty? then false else negatives end
  end

end
