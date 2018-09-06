require 'spec_helper'

describe 'expect_json_types options' do
  describe 'match_expected', match_expected: true, match_actual: false do
    it 'should require all expected properties' 


    it 'should not require the actual properties' 

  end

  describe 'match_actual', match_expected: false, match_actual: true do
    it 'should require all actual properties' 


    it 'should not require the expected properties' 

  end

  describe 'match_both', match_expected: true, match_actual: true do
    it 'should require all actual properties' 


    it 'should require all expected properties' 

  end

  describe 'match_none', match_expected: false, match_actual: false do
    it 'should not require the actual properties' 


    it 'should not require the expected properties' 

  end
end

