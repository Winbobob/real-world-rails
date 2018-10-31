require "rails_helper"

describe SourcerankHelper do
  describe "#source_rank_badge_class" do
    it "returns 'alert-success' for value > 0" 


    it "returns 'alert-danger' for value < 0" 


    it "returns 'alert-warning' for value == 0" 

  end

  describe '#source_rank_titles' do
    it 'returns a hash' 

  end

  describe '#source_rank_explainations' do
    it 'returns a hash' 

  end

  describe '#negative_factors' do
    it 'returns a hash' 

  end

  describe '#skip_showing_if_zero?' do
    it 'returns false for positive factors' 


    it 'returns true if value is zero' 


    it 'returns true if key is a negative_factor and value is not zero' 

  end
end

