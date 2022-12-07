def part1
  file = File.open("../../inputs/01/input.txt")

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

  puts max
end

def part2
  file = File.open("../../inputs/01/input.txt")

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

  array.sort.reverse.take(3).sum
end

puts part1
puts part2
