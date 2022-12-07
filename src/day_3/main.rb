require "byebug"
require "set"

def is_upcase?(character:)
  character.upcase == character
end

def calculate_priority(character:)
  priority = character.downcase.ord - 96 # position of letter in the alphabet
  priority += 26 if is_upcase?(character: character)

  priority
end

def find_a_common_character(array)
  union = array[0]

  array.each do |arr|
    union = union & arr
  end

  union.join
end

def part1
  file           = File.open("../../inputs/03/input.txt")
  sum_priorities = 0

  file.readlines.each do |line|
    priority = 0
    length   = line.length
    first    = line[0..(length/2)-1]
    second   = line[length/2..length-1]

    common_letter = (first.split('') & second.split('')).join
    priority      = calculate_priority(character: common_letter)

    sum_priorities += priority
  end

  sum_priorities
end

def part2
  file            = File.open("../../inputs/03/input.txt")
  sum_priorities  = 0
  group           = 1
  group_rucksacks = []

  file.readlines.each do |line|
    group_rucksacks << line.strip.split('')

    if group.modulo(3) == 0
      common_letter = find_a_common_character(group_rucksacks)
      priority      = calculate_priority(character: common_letter)

      sum_priorities  += priority
      group_rucksacks = []
    end

    group += 1
  end

  sum_priorities
end

puts part1
puts part2