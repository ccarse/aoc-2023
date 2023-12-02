def get_digit(num)
  num.sub("zero", "0").sub("one", "1").sub("two", "2").sub("three", "3").sub("four", "4").sub("five", "5").sub("six", "6").sub("seven", "7").sub("eight", "8").sub("nine", "9")
end
# input = ['eightwothree']
input = File.readlines('input.txt').map(&:strip)

tokens = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
nums = input.map do |line|
  first_token = ""
  last_token = ""
  best_first = 99999999999
  best_last = -1
  tokens.each do |token|
    first = line.index(token)
    last = line.rindex(token)

    if first && first < best_first then
      best_first = first
      first_token = token
    end
    if last && last > best_last then
      best_last = last
      last_token = token
    end
  end

  get_digit(first_token) + get_digit(last_token)
end

p nums.map(&:to_i).sum
