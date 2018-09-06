require 'rails_helper'

feature 'Claimant page' do
  include FormMethods

  let(:claim) { Claim.create password: 'lollolol' }

  let(:attributes) do
    {
      'First name' => 'Persephone',
      'Last name'  => 'Lollington',
      'Building number or name' => '1',
      'Street'    => 'High street',
      'Town/city' => 'Anytown',
      'County'    => 'Anyfordshire',
      'Postcode'  => 'AT1 4PQ'
    }
  end

  let(:secondary_attributes) do
    attributes.update 'First name' => 'Pegasus'
  end

  before do
    visit new_user_session_path
    fill_in_return_form claim.reference, 'lollolol'
  end

  describe 'adding claimant that is 16 or more years older' do
    before do
      visit claim_claimant_url

      select 'Mrs', from: 'Title'

      attributes.each do |field, value|
        fill_in field, with: value
      end
    end

    it "displays DOB validation above dob field" 


    it "displays no validation if older then 16" 


    it "displays validation if no DOB is present" 

  end
end

