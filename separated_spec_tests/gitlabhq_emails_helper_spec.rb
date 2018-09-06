require 'spec_helper'

describe EmailsHelper do
  describe 'password_reset_token_valid_time' do
    def validate_time_string(time_limit, expected_string)
      Devise.reset_password_within = time_limit
      expect(password_reset_token_valid_time).to eq(expected_string)
    end

    context 'when time limit is less than 2 hours' do
      it 'displays the time in hours using a singular unit' 

    end

    context 'when time limit is 2 or more hours' do
      it 'displays the time in hours using a plural unit' 

    end

    context 'when time limit contains fractions of an hour' do
      it 'rounds down to the nearest hour' 

    end

    context 'when time limit is 24 or more hours' do
      it 'displays the time in days using a singular unit' 

    end

    context 'when time limit is 2 or more days' do
      it 'displays the time in days using a plural unit' 

    end

    context 'when time limit contains fractions of a day' do
      it 'rounds down to the nearest day' 

    end
  end

  describe '#header_logo' do
    context 'there is a brand item with a logo' do
      it 'returns the brand header logo' 

    end

    context 'there is a brand item without a logo' do
      it 'returns the default header logo' 

    end

    context 'there is no brand item' do
      it 'returns the default header logo' 

    end
  end
end

