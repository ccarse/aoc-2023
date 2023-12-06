# input = File.read('test_input.txt')
input = File.read('input.txt')

seeds = input.split("\n\n").first.split(":")[1].strip.split(" ").map(&:strip)
mapping_groups = input.split("\n\n").map(&:strip).drop(1).map{ |g| g.split("\n").drop(1).map{ |j| j.split(" ").map(&:to_i) } }

puts "seeds #{seeds}"
puts '---'
# destination range start, source range start, range length.

locations = []

seeds.each do |seed|
  p "seed: #{seed}"
  orig = seed.to_i
  location = orig
  mapping_groups.each do |group|
    p "mapping: #{group}"
    group.each do |mapping|
      destination_range_start = mapping[0]
      source_range_start = mapping[1]
      range_length = mapping[2]
      source_range_end = source_range_start+(range_length-1)

      modifier = destination_range_start - source_range_start
      if (source_range_start..source_range_end).include?(location) then
        location = location + modifier
        p "new location: #{location}"
        break
      end
    end
  end
  locations.push(location)
  p "orig: #{orig}, new: #{location}"
end
p locations
p locations.min
