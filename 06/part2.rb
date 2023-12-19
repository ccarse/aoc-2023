# input = File.readlines('test_input.txt').map(&:strip)
input = File.readlines('input.txt').map(&:strip)

time = input[0].split(":").last.split(" ").map(&:strip).join("").to_i
record_distance = input[1].split(":").last.split(" ").map(&:strip).join("").to_i

better = 0
p "time: #{time}, distance: #{record_distance}"
(time-1).times do |j|
  held = j + 1

  distance = (time - held) * held
  p "held: #{held} distance: #{distance}"
  better += 1 if distance > record_distance
end
p better
