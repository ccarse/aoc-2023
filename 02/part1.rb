input = File.readlines('input.txt')

def possible?(cubes)
  cubes.each do |game|
    num, color = game.split(" ")
    return false if color == "red" && num.to_i > 12
    return false if color == "green" && num.to_i > 13
    return false if color == "blue" && num.to_i > 14
  end
  return true
end

possibles = input.map do |line|
  id, rest = line.split(":")
  id = id.split(" ").last.to_i

  games = rest.split(";").map { |game| game.split(",") }.flatten.map(&:strip)
  next id if possible?(games)
  next 0
end
p possibles.sum
