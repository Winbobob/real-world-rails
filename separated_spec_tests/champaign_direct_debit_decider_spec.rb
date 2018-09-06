# frozen_string_literal: true
require 'rails_helper'

describe DirectDebitDecider do
  describe 'decide' do
    [:only_recurring, :recurring, :one_off, :garbage_value].each do |recurring_default|
      recurring = (recurring_default == :only_recurring || recurring_default == :recurring)
      context "recurring is '#{recurring_default}'" do
        it 'returns true when country list is just DE' 


        it 'returns true when country list is just AT' 


        it 'returns true when country list is just ES' 


        it 'returns true when country list is DE and GB' 


        it 'returns true when country list is DE and several others' 


        it 'returns true when DE is a lowercase symbol' 


        it 'returns true when DE is a lowercase string' 


        it 'returns true when DE is an uppercase symbol' 


        it 'returns true when DE is an uppercase string' 


        it "returns #{recurring} when country list is GB" 


        it "returns #{recurring} when country list is GB and others" 


        it "returns #{recurring} when country list is NL" 


        it 'returns false when country list is empty' 


        it 'returns false when country is unknown' 


        it 'returns false when country list has no direct debit countries' 

      end
    end
  end
end

