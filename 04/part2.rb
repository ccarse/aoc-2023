# input = File.readlines('test_input.txt').map(&:strip)
input = File.readlines('input.txt').map(&:strip)

# Get cards
total_cards = []
num_cards = Array.new(input.length, 1)
input.each_with_index do |line, index|
  multiplier = num_cards[index]

  left, right = line.split("|")
  winning_nums = left.split(":")[1].strip.split(" ").map(&:strip).compact
  my_nums = right.split(" ").map(&:strip).compact

  matches = winning_nums & my_nums

  matches.length.times do |i|
    num_cards[index + (i + 1)] += 1 * multiplier
  end
end
p num_cards.sum
