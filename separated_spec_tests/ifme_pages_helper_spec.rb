RSpec.describe PagesHelper, type: :helper do
  describe '#print_contributors' do
    it 'returns empty result for empty array' 


    it 'returns empty result for malformed array' 


    it 'returns correct result for one link' 


    it 'returns correct result for two links' 


    it 'returns correct result for a sentence of links' 

  end

  describe '#print_partners' do
    it 'returns empty result for empty array' 


    it 'returns empty result for malformed array' 


    it 'returns correct result for one link' 


    it 'returns correct result for two links' 

  end

  describe '#print_resources' do
    it 'returns empty result for nil resource type and empty array' 


    it 'returns empty result for malformed array' 


    it 'returns correct result for one link with invalid tag and language' 


    it 'returns correct result for one link with valid tag and language' 


    it 'returns correct result for two links' 

  end
end

