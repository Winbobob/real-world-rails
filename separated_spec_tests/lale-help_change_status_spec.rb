require 'rails_helper'

describe Circle::Member::Comments::StatusChange do
  let(:user) { create(:user, first_name: 'Generic', last_name: 'User') }
  let(:circle) { create(:circle) }
  let(:member) { create(:user, first_name: 'John', last_name: 'Doe') }

  context '#execute' do
    it 'creates a comment' 

    it 'fills the comment body with an internationalized message' 

    it 'creates a comment using the lale-bot user' 


  end
end

