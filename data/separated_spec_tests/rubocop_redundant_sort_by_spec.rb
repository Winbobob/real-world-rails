# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::RedundantSortBy do
  subject(:cop) { described_class.new }

  it 'autocorrects array.sort_by { |x| x }' 


  it 'autocorrects array.sort_by { |y| y }' 


  it 'autocorrects array.sort_by do |x| x end' 


  it 'formats the error message correctly for array.sort_by { |x| x }' 

end

