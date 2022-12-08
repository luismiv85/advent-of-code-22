require 'spec_helper'
require_relative '../../lib/day_3.rb'
require 'byebug'

RSpec.describe 'Day 3' do
  describe 'sum_priorities_item_types' do
    it 'should return sum of priorities of item types' do
      file = File.open(ROOT_PATH.join 'inputs', 'day_3.txt')

      expect(sum_priorities_item_types(file: file)).to eq 157
    end
  end

  describe 'total_score_new_logic' do
    it 'should return sum of group priorities of item types' do
      file = File.open(ROOT_PATH.join 'inputs', 'day_3.txt')

      expect(sum_group_priorities_item_types(file: file)).to eq 70
    end
  end
end