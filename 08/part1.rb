def get_direction(instructions, index)
  length = instructions.length
  currIndex = index % length
  instructions[currIndex]
end
# input = File.read('test_input.txt').strip
input = File.read('input.txt').strip

instructions, rest = input.split("\n\n").map(&:strip)
instructions = instructions.strip.chars
p instructions
map = {}

rest.split("\n").each do |l|
  start, operand = l.split(" = ").map(&:strip)
  left, right = operand.gsub("(", "").gsub(")", "").split(", ").map(&:strip)
  map[start] = {"L" => left, "R" => right}
end
p map

current = "AAA"
count = 0
while true
  break if current == "ZZZ"
  puts current

  current = map[current][get_direction(instructions, count)]
  count += 1
end
p count
