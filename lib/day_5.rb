# Create a stacks depend on input txt
# Fill stacks with information
# Execture crates movements between stacks
def rearrangement_crates_one_by_one(file:)
  stacks = []
  stack_lines = []

  file.readlines.each_with_index do |line, index|
    if line.start_with?("move")
      process_move(stacks: stacks, line: line)
    elsif line[1] && !line[1].match(/^(\d)+$/)
      # Elsif, if line not contain numbers, then is a crate line input.
      stack_lines << line
    elsif line[1]&.match(/^(\d)+$/)
      # Else, this line contains number of stacks to build
      create_stacks(line: line, stack_lines: stack_lines, stacks: stacks)
    end
  end

  stacks.map(&:first).join
end

# Create a stacks depend on input txt
# Fill stacks with information
# Execture crates movements in blocks between stacks
def rearrangement_crates_into_bocks(file:)
  stacks = []
  stack_lines = []

  file.readlines.each_with_index do |line, index|
    if line.start_with?("move")
      process_move_in_block(stacks: stacks, line: line)
    elsif line[1] && !line[1].match(/^(\d)+$/)
      # Elsif, if line not contain numbers, then is a crate line input.
      stack_lines << line
    elsif line[1]&.match(/^(\d)+$/)
      # Else, this line contains number of stacks to build
      create_stacks(line: line, stack_lines: stack_lines, stacks: stacks)
    end
  end

  stacks.map(&:first).join
end


# Method to create dynamically stacks structure
def create_stacks(line:, stack_lines:, stacks:)
  number_stacks = line.scan(/\d/).last.to_i

  # Create stacks dynamically and fill it whit values.
  stack_lines.each do |stack_line|
    position = 1

    number_stacks.times do |time|
      stacks[time] ||= []
      stacks[time].push(stack_line[position]) if stack_line[position] && !stack_line[position].strip.empty?
      position += 4
    end
  end
end

# Method to process crate movement between stacks
def process_move(stacks:, line:)
  movement   = line.scan(/\d+/)
  from       = stacks[movement[1].to_i - 1]
  to         = stacks[movement[2].to_i - 1]
  num_crates = movement[0].to_i

  num_crates.times do
    crate = from.shift
    to.prepend(crate)
  end
end

# Method to process crate movement between stacks
def process_move_in_block(stacks:, line:)
  movement   = line.scan(/\d+/)
  from       = stacks[movement[1].to_i - 1]
  to         = stacks[movement[2].to_i - 1]
  num_crates = movement[0].to_i

  crate = from.shift(num_crates)
  to.prepend(crate).flatten!
end


# puts rearrangement_crates_one_by_one(file: File.open("../inputs/day_5.txt"))
# puts rearrangement_crates_into_bocks(file: File.open("../inputs/day_5.txt"))
