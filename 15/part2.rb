input = File.read('input.txt')

result = input.split("\n\n").first.chars.each_cons(2).map{ |a| a}.map(&:join).tally
rules = input.split("\n\n").last.split("\n").map(&:strip)
rules = Hash[rules.map { |r| r.split(" -> ") }]

p result

def pair_insertion(pairs, rules)
  counts = Hash.new(0)
  counts[File.read('input.txt').chars.first] = 1
  ret = Hash.new(0)
  pairs.each do |k,v|
    first = [k[0], rules[k]].join
    second = [rules[k], k[1]].join

    ret[first] += v
    ret[second] += v
    counts[first.chars.last] += v
    counts[second.chars.last] += v
  end
  [ret, counts]
end

counts = nil
40.times do |i| 
  p i
  result, counts = pair_insertion(result, rules)
end

sorted = counts.sort_by {|k,v| v}
p sorted
p sorted.last[1] - sorted.first[1]
