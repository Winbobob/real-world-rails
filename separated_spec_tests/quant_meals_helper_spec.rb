require 'spec_helper'

describe MealsHelper do
  # helper MealsHelper

  let(:meals) {
    3.times do
      Fabricate(:meal)
    end
    Meal.all
  }

  describe '.macro_percent_for_meals' do
    it 'returns correct carb percentage for an array of meals' 


    it 'returns correct protein percentage for an array of meals' 


    it 'returns correct fat percentage for an array of meals' 

  end
end

