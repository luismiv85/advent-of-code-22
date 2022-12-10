require 'spec_helper'
require_relative '../../lib/day_5.rb'
require 'byebug'

RSpec.describe 'Day 5' do
  describe 'rearrangement_crates_one_by_one' do
    it 'the CrateMover has put the crates in this order' do
      file = File.open(ROOT_PATH.join 'inputs', 'day_5.txt')

      expect(rearrangement_crates_one_by_one(file: file)).to eq 'CMZ'
    end
  end

  describe 'rearrangement_crates_into_bocks' do
    it 'the CrateMover has put the crates in this order' do
      file = File.open(ROOT_PATH.join 'inputs', 'day_5.txt')

      expect(rearrangement_crates_into_bocks(file: file)).to eq 'MCD'
    end
  end
end