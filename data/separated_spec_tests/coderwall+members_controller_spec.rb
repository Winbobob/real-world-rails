require 'spec_helper'

RSpec.describe MembersController, type: :controller, skip: true do
  let(:current_user) { Fabricate(:user) }
  let(:invitee) { Fabricate(:user) }
  let(:team) { Fabricate(:team) }
  before { controller.send :sign_in, current_user }

  describe 'DELETE #destroy' do
    it 'should remove the team member from the current users team' 


    it 'redirects back to leader board when you remove yourself' 

  end
end

