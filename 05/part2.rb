# input = File.read('test_input.txt')
input = File.read('input.txt')

seed_ranges = input.split("\n\n").first.split(":")[1].strip.split(" ").map(&:strip).map(&:to_i)
mapping_groups = input.split("\n\n").map(&:strip).drop(1).map{ |g| g.split("\n").drop(1).map{ |j| j.split(" ").map(&:to_i) } }
mapping_groups = mapping_groups.map do |group|
  group.map do |mapping|
    destination_range_start = mapping[0]
    source_range_start = mapping[1]
    range_length = mapping[2]
    source_range_end = source_range_start+(range_length-1)
    modifier = destination_range_start - source_range_start
    [(source_range_start..source_range_end)].push(modifier)
  end
end

puts "seed_ranges #{seed_ranges}"
puts '---'
# destination range start, source range start, range length.

min_location = 9999999999
total = 0

seeds = (seed_ranges.length/2).times.map do |i|
  p "i: #{i} seed_range: #{seed_ranges[i*2]}..#{seed_ranges[i*2] + seed_ranges[(i*2)+1]-1}"
  total += (seed_ranges[i*2] + seed_ranges[(i*2)+1]-1) - seed_ranges[i*2]
  seed_ranges[i*2]..(seed_ranges[i*2] + seed_ranges[(i*2)+1]-1)
end

p total
current = 0
seeds.each do |seed_range|
  seed_range.each do |seed|
    p "#{100 * (current.to_f / total)}% current: #{current} total: #{total}" if current % 1000000 === 0
    current += 1

    orig = seed.to_i
    location = orig
    mapping_groups.each do |group|
      # p "mapping: #{group}"
      group.each do |mapping|
        if mapping[0].include?(location) then
          location = location + mapping[1]
          # p "new location: #{location}"
          break
        end
      end
    end
    if location < min_location then
      min_location = location
      p "new min_location: #{min_location}"
    end
  end
end
p min_location
