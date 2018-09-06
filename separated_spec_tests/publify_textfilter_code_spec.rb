require 'rails_helper'
# require 'text_filter_textile'
require 'publify_textfilter_markdown'

describe 'With the list of available filters', type: :model do
  describe '#filter_text' do
    def filter_text(text, filters)
      TextFilter.filter_text(text, filters)
    end

    describe 'specific publify tags' do
      describe 'code' do
        describe 'single line' do
          it 'should made nothin if no args' 


          it 'should parse ruby lang' 


          it 'should parse ruby and xml in same sentence but not in same place' 

        end
        describe 'multiline' do
          it 'should render ruby' 

        end
      end
    end

    it 'test_code_plus_markup_chain' 

  end
end
