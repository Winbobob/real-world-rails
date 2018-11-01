require 'rails_helper'

describe FormHelper, type: :helper do
  let(:user) { FactoryGirl.build(:person, birthday: Date.new(1981, 4, 28), mobile_phone: '9181234567') }

  describe 'date_field and date_field_tag' do
    it 'outputs a text field with placeholder and formatted date' 


    it 'handles nil and empty string' 

  end

  describe 'phone_field' do
    it 'outputs a text field' 

  end
end

