input = File.readlines('input.txt')

powers = 0
input.each do |line|
    id, rest = line.split(":")

    fewest = { "red"=> 0, "green"=> 0, "blue"=> 0 }

    games = rest.split(";").map { |game| game.split(",") }.flatten.map(&:strip)
    games.each do |game|
      num, color = game.split(" ")
      num = num.to_i
      if fewest[color] < num then
        fewest[color] = num
      end
    end
    power = fewest.values.inject(:*)
    powers += power
end
p powers
