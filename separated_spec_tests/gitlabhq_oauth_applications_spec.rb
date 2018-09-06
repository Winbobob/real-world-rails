require 'spec_helper'

describe 'Profile > Applications' do
  let(:user) { create(:user) }
  let(:application) { create(:oauth_application, owner: user) }

  before do
    sign_in(user)
  end

  describe 'User manages applications', :js do
    it 'views an application' 


    it 'deletes an application' 


    it 'deletes an authorized application' 

  end
end

