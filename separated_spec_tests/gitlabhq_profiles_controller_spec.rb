require('spec_helper')

describe ProfilesController, :request_store do
  let(:user) { create(:user) }

  describe 'PUT update' do
    it 'allows an email update from a user without an external email address' 


    it "allows an email update without confirmation if existing verified email" 


    it 'ignores an email update from a user with an external email address' 


    it 'ignores an email and name update but allows a location update from a user with external email and name, but not external location' 

  end

  describe 'PUT update_username' do
    let(:namespace) { user.namespace }
    let(:gitlab_shell) { Gitlab::Shell.new }
    let(:new_username) { generate(:username) }

    it 'allows username change' 


    it 'updates a username using JSON request' 


    it 'renders an error message when the username was not updated' 


    it 'raises a correct error when the username is missing' 


    context 'with legacy storage' do
      it 'moves dependent projects to new namespace' 

    end

    context 'with hashed storage' do
      it 'keeps repository location unchanged on disk' 

    end
  end
end

