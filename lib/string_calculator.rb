class StringCalculator

  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter_index = numbers.index("\n")
      delimiter = numbers[2..delimiter_index - 1]
      numbers = numbers[delimiter_index + 1..-1]
    else
      delimiter = ","
      numbers = numbers
    end

    numbers_array = numbers.split(/#{delimiter}|\n/)
    numbers_array.map!(&:to_i)
    negative_numbers = numbers_array.select { |num| num < 0 }
    if negative_numbers.any?
      raise StandardError, "negative numbers not allowed #{negative_numbers.join(',')}"
    end
    sum = numbers_array.sum

  end
end