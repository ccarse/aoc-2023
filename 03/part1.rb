# input = File.readlines('test_input.txt').map(&:strip)
input = File.readlines('input.txt').map(&:strip)

symbols = input.join.delete("0-9").delete(".").split("").flatten.uniq
# p symbols

matches = []
input.each_with_index do |line, index|
  line.scan(/\d+/) do |match|

    beginning = Regexp.last_match.begin(0)
    ending = beginning + match.length
    start_index = [beginning - 1, 0].max
    end_index = [ending + 1, line.length - 1].min

    before = symbols.any? do |s| input[[index - 1, 0].max][start_index...end_index].include?(s) end
    curr = symbols.any? do |s| input[index][start_index...end_index].include?(s) end
    after = symbols.any? do |s| input[[input.length - 1, index + 1].min][start_index...end_index].include?(s) end

    if before || curr || after then
      matches.push(match)
      # p "Match: #{match}" # before: #{before} curr: #{curr} after: #{after}"
    end

  end
end
# p matches
p matches.map(&:to_i).sum
