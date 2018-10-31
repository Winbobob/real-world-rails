# frozen_string_literal: true

describe ViewersHelper do
  describe 'viewers_hover' do
    let(:element) { '<a href="/categories/test-category">Test Category</a>' }
    before(:each) do
      allow(self).to receive(:react_component).and_return(nil)
    end

    it 'displays only you when there are no viewers with link' 


    it 'displays list of viewers with link' 

  end

  describe 'get_viewers_for' do
    it 'returns empty array for invalid input' 


    it 'returns array of size 1 for valid input of data type category' 


    it 'returns array of size 2 for valid input of data type category' 


    it 'returns array of size 1 for valid input of data type mood' 


    it 'returns array of size 2 for valid input of data type mood' 


    it 'returns array of size 1 for valid input of data type strategy' 


    it 'returns array of size 2 for valid input of data type strategy' 

  end
end

