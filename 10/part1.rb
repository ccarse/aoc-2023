# input = File.readlines('test_input.txt').map(&:strip).map { |line| line.chars }
input = File.readlines('input.txt').map(&:strip).map { |line| line.chars }

def find_start(input)
  input.each_with_index do |row, y|
    row.each_with_index do |col, x|
      return [x, y] if col == 'S'
    end
  end
end

def get_next_index(x, y, direction)
  case direction
  when 'U'
    [x, y - 1]
  when 'D'
    [x, y + 1]
  when 'L'
    [x - 1, y]
  when 'R'
    [x + 1, y]
  end
end

def get_direction(inputDirection, letter)
  # L, F, 7, J, |, -
  case inputDirection
  when 'U'
    return 'L' if letter == '7'
    return 'R' if letter == 'F'
    return 'U' if letter == '|'
  when 'D'
    return 'L' if letter == 'J'
    return 'R' if letter == 'L'
    return 'D' if letter == '|'
  when 'L'
    return 'L' if letter == '-'
    return 'U' if letter == 'L'
    return 'D' if letter == 'F'
  when 'R'
    return 'R' if letter == '-'
    return 'U' if letter == 'J'
    return 'D' if letter == '7'
  end
end

steps = 0
curr = ''
nextIdx = find_start(input)
direction = 'D'
while curr != 'S'
  nextIdx = get_next_index(nextIdx[0], nextIdx[1], direction)
  curr = input[nextIdx[1]][nextIdx[0]]
  direction = get_direction(direction, curr)
  steps +=1

  p "curr: #{curr} direction: #{direction} nextIdx: #{nextIdx}"
end

p steps
