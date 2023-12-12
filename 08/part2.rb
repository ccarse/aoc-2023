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

currents = map.keys.filter{|k| k.end_with?("A")}
p currents
count = 0

multiples = currents.map do |current|
  count = 0
  while true
    break if current.end_with?("Z")
    puts current

    current = map[current][get_direction(instructions, count)]
    count += 1
  end
  count
end

p multiples.reduce(:lcm)

# while true
#   direction = get_direction(instructions, count)
#   p "count: #{count} currents: #{currents.length} ending with z: #{currents.filter{|c| c.end_with?("Z")}.length} direction: #{direction}"

#   break if currents.all?{|c| c.end_with?("Z")}

#   new_currents = currents.map do |current|
#     map[current][direction]
#   end

#   currents = new_currents

#   count += 1
# end
# p count
