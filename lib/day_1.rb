require 'byebug'

def max_calories(file:)
  max = 0
  counter = 0

  file.readlines.each do |line|
    calorie = line.chomp

    if calorie.empty?
      max = counter if counter > max
      counter = 0
    else
      counter += calorie.to_i
    end
  end

  # Last lines
  max = counter if counter > max

  max
end

def sum_top_3_calories(file:)
  array = []
  counter = 0

  file.readlines.each do |line|
    calorie = line.chomp

    if calorie.empty?
      array << counter
      counter = 0
    else
      counter += calorie.to_i
    end
  end

  # Last lines
  array << counter if counter > 0

  array.sort.reverse.take(3).sum
end

# puts part1(file: File.open("../inputs/day_1.txt"))
# puts part2(file: File.open("../inputs/day_1.txt"))
