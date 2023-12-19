# input = File.readlines('test_input.txt').map(&:strip)
input = File.readlines('input.txt').map(&:strip)

times = input[0].split(":").last.split(" ").map(&:strip).map(&:to_i)
distances = input[1].split(":").last.split(" ").map(&:strip).map(&:to_i)

beaten = []
times.length.times do |i|
  better = 0
  time = times[i]
  record_distance = distances[i]
  p "time: #{time}, distance: #{record_distance}"
  (time-1).times do |j|
    held = j + 1

    distance = (time - held) * held
    p "held: #{held} distance: #{distance}"
    better += 1 if distance > record_distance
  end
  beaten.push(better)
end
p beaten.inject(:*)
