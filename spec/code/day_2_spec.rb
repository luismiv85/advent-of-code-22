require 'spec_helper'
require_relative '../../lib/day_2.rb'
require 'byebug'

RSpec.describe 'Day 2' do
  describe 'total_score' do
    it 'should return total score according the strategy guide' do
      file = File.open(ROOT_PATH.join 'inputs', 'day_2.txt')

      expect(total_score(file: file)).to eq 15
    end
  end

  describe 'total_score_new_logic' do
    it 'should return total score according the strategy guide' do
      file = File.open(ROOT_PATH.join 'inputs', 'day_2.txt')

      expect(total_score_new_logic(file: file)).to eq 12
    end
  end
end