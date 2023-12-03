def get_projection_line(input, line, col)
  start_index = col
  end_index = col
  # left
  (0..col-1).reverse_each do |i|
    if input[line][i] =~ /[0-9]/
      start_index = i
    else break
    end
  end
  # right
  (col+1..input[line].length-1).each do |i|
    if input[line][i] =~ /[0-9]/
      end_index = i
    else break
    end
  end
  input[line][start_index..end_index]
end

def get_projection(input, line, col)
  input = File.readlines('input.txt').map(&:strip)
  ending = col + 1

  before = get_projection_line(input, line-1, col) if line > 0
  curr = get_projection_line(input, line, col)
  after = get_projection_line(input, line+1, col) if line < input.length - 1

  "#{before}|#{curr}|#{after}"
end

# input = File.readlines('test_input.txt').map(&:strip)
input = File.readlines('input.txt').map(&:strip)
symbols = input.join.delete("0-9").delete(".").split("").flatten.uniq

gears = []
input.each_with_index do |line, index|
  line.scan(/\*+/) do |match|
    beginning = Regexp.last_match.begin(0)
    projection = get_projection(input, index, beginning)
    matches = projection.scan(/\d+/)
    gears.push(matches[0].to_i * matches[1].to_i) if matches.length == 2
  end
end
p gears.sum
