require 'byebug'

POINTS = {
  'X' => 1,
  'Y' => 2,
  'Z' => 3,
  win: 6,
  draw: 3,
  lose: 0
}

GAME_RULES_WIN = {
  'A' => 'Y',
  'B' => 'Z',
  'C' => 'X',
}

GAME_RULES_DRAW = {
  'A' => 'X',
  'B' => 'Y',
  'C' => 'Z'
}

GAME_RULES_LOSE = {
  'A' => 'Z',
  'B' => 'X',
  'C' => 'Y'
}

def evaluate_point_shape_selected(shape_selected:)
  POINTS[shape_selected]
end

def evaluate_result_game(x:, y:)
  if GAME_RULES_WIN[x] == y
    POINTS[:win]
  elsif GAME_RULES_DRAW[x] == y
    POINTS[:draw]
  else
    POINTS[:lose]
  end
end

def part1
  file         = File.open("../../inputs/02/input.txt")
  total_points = 0

  file.readlines.each do |line|
    player_1_choosen, my_choice = line.split(" ")

    points_game           = evaluate_result_game(x: player_1_choosen, y: my_choice)
    points_shape_selected = evaluate_point_shape_selected(shape_selected: my_choice)

    total_points += points_game + points_shape_selected
  end

  total_points
end

# X means you need to lose,
# Y means you need to end the round in a draw, and
# Z means you need to win
def part2
  file         = File.open("../../inputs/02/input.txt")
  total_points = 0

  file.readlines.each do |line|
    player_1_choosen, strategy = line.split(" ")

    my_choice =
      if strategy == 'X'
        GAME_RULES_LOSE[player_1_choosen]
      elsif strategy == 'Y'
        GAME_RULES_DRAW[player_1_choosen]
      elsif strategy == 'Z'
        GAME_RULES_WIN[player_1_choosen]
      end

    points_game           = evaluate_result_game(x: player_1_choosen, y: my_choice)
    points_shape_selected = evaluate_point_shape_selected(shape_selected: my_choice)

    total_points += points_game + points_shape_selected
  end

  total_points
end

puts part1
puts part2