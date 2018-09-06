require 'spec_helper'

describe Skills::GenerateFromSeeds do
  subject { described_class.call }

  describe '.call' do
    context 'when SKILLS_AND_CATEGORIES is not empty' do
      let(:expected_message) { '2 skills was modificated.' }

      before do
        SKILLS_AND_CATEGORIES = [
          {
            ref_name: 'backend_ruby-on-rails',
            name: 'Ruby on Rails',
            rating: 'int',
            description: 'Rails.',
            category: 'backend'
          },
          {
            ref_name: 'backend_sinatra',
            name: 'Sinatra',
            rating: 'boolean',
            description: 'Sinatra.',
            category: 'backend'
          }
        ]
      end

      it 'creates one new category' 


      it 'creates two new skills' 


      it 'returns correct message' 

    end

    context 'when SKILLS_AND_CATEGORIES is empty' do
      before { SKILLS_AND_CATEGORIES = [] }

      it 'raises error' 

    end
  end
end

