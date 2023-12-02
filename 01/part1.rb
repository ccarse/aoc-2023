# input = ['treb7uchet']
input = File.readlines('input.txt').map(&:strip)

nums = input.map do |line|
  line.delete!("^0-9")
  p line
  num = line[0] + '' + line[-1]
  p num
  p num.to_i
  num.to_i
end

p nums.sum
