require 'spec_helper'
require_relative '../../lib/day_4.rb'
require 'byebug'

RSpec.describe 'Day 4' do
  describe 'count_pairs_contains_other' do
    it 'should return how many assignment pairs does one range fully contain the other' do
      file = File.open(ROOT_PATH.join 'inputs', 'day_4.txt')

      expect(count_pairs_contains_other(file: file)).to eq 3
    end
  end

  describe 'pairs_overlap' do
    it 'should return how many assignment pairs do the ranges overlap' do
      file = File.open(ROOT_PATH.join 'inputs', 'day_4.txt')

      expect(pairs_overlap(file: file)).to eq 5
    end
  end
end