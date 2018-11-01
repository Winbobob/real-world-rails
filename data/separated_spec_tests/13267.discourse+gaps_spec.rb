require 'rails_helper'
require 'cache'

describe Gaps do

  it 'returns no gaps for empty data' 


  it 'returns no gaps with one element' 


  it 'returns no gaps when all elements are present' 


  context "single element gap" do
    let(:gap) { Gaps.new([1, 3], [1, 2, 3]) }

    it 'has a gap for post 3' 

  end

  context "larger gap" do
    let(:gap) { Gaps.new([1, 2, 3, 6, 7], [1, 2, 3, 4, 5, 6, 7]) }

    it 'has a gap for post 6' 

  end

  context "multiple gaps" do
    let(:gap) { Gaps.new([1, 5, 6, 7, 10], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) }

    it 'has both gaps' 

  end

  context "a gap in the beginning" do
    let(:gap) { Gaps.new([2, 3, 4], [1, 2, 3, 4]) }

    it 'has the gap' 

  end

  context "a gap in the ending" do
    let(:gap) { Gaps.new([1, 2, 3], [1, 2, 3, 4]) }

    it 'has the gap' 

  end

  context "a large gap in the ending" do
    let(:gap) { Gaps.new([1, 2, 3], [1, 2, 3, 4, 5, 6]) }

    it 'has the gap' 

  end

end

