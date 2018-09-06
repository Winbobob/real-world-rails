require 'policy_helper'

describe UserPolicy do
  subject { UserPolicy }
  let(:user) { FactoryGirl.create(:user) }
  let(:rep) { FactoryGirl.create(:rep).user }
  let(:rep2) { FactoryGirl.create(:rep).user }
  let(:admin) { FactoryGirl.create(:user, is_admin: true) }

  permissions :edit? do
    it 'does not permit visitor to edit a users profile' 

    it 'permits user to edit only their own profile' 

    it 'permits rep to select only their profile' 

    it 'permits admin to edit anyones profile' 

  end

  permissions :upload_avatar? do
    it 'does not permit visitor to upload a photo for a user' 


    it 'permits admin to upload a photo for anyone' 


    it "does not permit user to upload a photo" 


    it 'permits rep to upload photo only for themselves' 

  end
end

