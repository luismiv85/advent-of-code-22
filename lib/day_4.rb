def cover?(pair_1:, pair_2:)
  pair_1.cover?(pair_2) || pair_2.cover?(pair_1)
end

def ranges_overlaps?(pair_1:, pair_2:)
  pair_2.begin <= pair_1.end && pair_1.begin <= pair_2.end
end

def calculate_range(pair:)
  start, last = pair.split('-')

  (start.to_i..last.to_i)
end

def count_pairs_contains_other(file:)
  count = 0

  file.readlines.each do |line|
    elf_1, elf_2 = line.chomp.split(',')
    range_elf_1 = calculate_range(pair: elf_1)
    range_elf_2 = calculate_range(pair: elf_2)

    count += 1 if cover?(pair_1: range_elf_1, pair_2: range_elf_2)
  end

  count
end

def pairs_overlap(file:)
  count = 0

  file.readlines.each do |line|
    elf_1, elf_2 = line.chomp.split(',')
    range_elf_1  = calculate_range(pair: elf_1)
    range_elf_2  = calculate_range(pair: elf_2)

    count += 1 if ranges_overlaps?(pair_1: range_elf_1, pair_2: range_elf_2)
  end

  count
end

# puts count_pairs_contains_other(file: File.open("../inputs/day_4.txt"))
# puts pairs_overlap_at_all(file: File.open("../inputs/day_4.txt"))



