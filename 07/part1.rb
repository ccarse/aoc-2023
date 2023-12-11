
def score(hand)
  if hand.length != 5
    raise "Invalid hand"
  end
  "#{primary_score(hand)}.#{secondary_score(hand)}".to_f
end

def primary_score(hand)
  return 6 if hand.uniq.length == 1
  return 5 if hand.tally.values.any? { |count| count == 4 }
  return 4 if hand.tally.values.length == 2 && hand.tally.values.any? { |count| count == 3 }
  return 3 if hand.tally.values.any? { |count| count == 3 }
  return 2 if hand.tally.values.filter { |count| count == 2 }.length == 2 # two pair
  return 1 if hand.tally.values.any? { |count| count == 2 }
  return 0
end

def secondary_score(hand)
  cards = ['A', 'K', 'Q', 'J', 'T', '9', '8', '7', '6', '5', '4', '3', '2'].reverse
  # If two hands have the same type, a second ordering rule takes effect. Start by comparing the first card in each hand. If these cards are different, the hand with the stronger first card is considered stronger. If the first card in each hand have the same label, however, then move on to considering the second card in each hand. If they differ, the hand with the higher second card wins; otherwise, continue with the third card in each hand, then the fourth, then the fifth.
  secondary_score = hand.map do |card|
    cards.index(card).to_s.rjust(2,'0')
  end
  # puts secondary_score
  secondary_score.join("")
end

# input = File.readlines('test_input.txt').map(&:strip)
input = File.readlines('input.txt').map(&:strip)

inputs = input.map { |line| line.split(" ") }.map { |hand, bid| [hand.split(""), bid] }



sorted = inputs.sort_by do |a|
  hand = a[0]
  puts "hand #{hand.join("")} score: #{score(hand)}"
  score(hand)
end

total = sorted.map.with_index do |s, i|
  bid = s[1].to_i
  bid * (i + 1)
end.sum

puts total
