# input = File.readlines('test_input.txt').map(&:strip)
input = File.readlines('input.txt').map(&:strip)

points = input.map do |line|
  left, right = line.split("|")
  winning_nums = left.split(":")[1].strip.split(" ").map(&:strip).compact
  my_nums = right.split(" ").map(&:strip).compact

  matches = winning_nums & my_nums
  p matches.length > 0 ? (2 ** (matches.length - 1)) : 0
end
p points.sum