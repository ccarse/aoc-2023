# input = File.read('test_input.txt')
input = File.read('input.txt')

result = input.split("\n\n").first
rules = input.split("\n\n").last.split("\n").map(&:strip)
rules = Hash[rules.map { |r| r.split(" -> ") }]

p result
# p rules

def pair_insertion(template, rules)
  ret = [template.chars.first]
  template.chars.each_cons(2) do |a|
    ret << [rules[a.join], a[1]]
  end
  ret.join
end

10.times do |i| 
  p i
  result = pair_insertion(result, rules)
  # p result
end

sorted = result.split(//).tally.sort_by {|k,v| v}

# p sorted
p sorted.last[1] - sorted.first[1]
