require 'spec_helper'
require_relative '../../lib/day_1.rb'
require 'byebug'

RSpec.describe 'Day 1' do
  describe 'max_calories' do
    it 'should return total Calories is that Elf carrying' do
      file = File.open(ROOT_PATH.join 'inputs', 'day_1.txt')

      expect(max_calories(file: file)).to eq 24000
    end
  end

  describe 'sum_top_3_calories' do
    it 'should return calories total with the top three Elves' do
      file = File.open(ROOT_PATH.join 'inputs', 'day_1.txt')

      expect(sum_top_3_calories(file: file)).to eq 45000
    end
  end
end