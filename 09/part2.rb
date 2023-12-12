# input = File.readlines('test_input.txt').map(&:strip).map { |l| l.split(" ").map(&:to_i) }
input = File.readlines('input.txt').map(&:strip).map { |l| l.split(" ").map(&:to_i) }

def forecast(line)
  diffs = [line]
  while true
    new_diffs = diffs.last.each_cons(2).map do |left, right|
      right - left
    end
    p new_diffs
    diffs.push(new_diffs)
    break if new_diffs.all? { |d| d == 0 }
  end

  firsts = diffs.map(&:first)[0...-1]
  firsts.reverse.reduce(0) do |acc, val|
    p "#{val} - #{acc}"
    val - acc
  end
end

forecasts = input.map do |line|
  forecast(line)
end

p forecasts.sum
