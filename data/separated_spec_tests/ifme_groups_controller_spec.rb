RSpec.describe GroupsController, :type => :controller do
  include StubCurrentUserHelper

  describe "GET #index" do
    it "assigns groups to the groups that the user belongs to" 


    context "when user isn't signed in" do
      it "redirects to the sign in page" 

    end
  end

  describe "GET #show" do
    context "when the group exists" do
      let(:group) { create :group }

      it "sets the group" 


      context "when user is member of the group" do
        it "sets @meetings to the group's meetings" 

      end
    end

    context "when group doesn't exist" do
      it "redirects to the index" 

    end

    context "when user isn't signed in" do
      it "redirects to sign in" 

    end
  end

  describe 'GET #edit' do
    it 'redirects to groups path when current_user is not a leader' 

  end

  describe "GET #leave" do
    context "when current_user is the only leader of the group" do
      it "redirects to groups_path with alert message" 

    end
  end

  describe 'GET #update' do
    it 'updates leader' 

  end
end

