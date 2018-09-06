require 'spec_helper'

describe Admin::UsersController do
  let(:user) { create(:user, name: 'hello', admin: true, email: 'lol@biz.info') }

  before :each do
    sign_in user
  end

  describe "#index" do
    it "gets all users" 


    it "assigns @users" 


    it "responds to html" 


    it "responds to json" 

  end

  describe "#show" do
    let(:mock_user) { User.new }
    before do
      allow(User).to receive(:find).and_return(mock_user)
    end
    it "gets the user by id" 

    it "assigns @user" 


    it "responds to html" 


    it "responds to json" 


  end

  describe "#update" do
    let(:mock_user) { double('user', update_attributes: success) }
    before do
      allow(User).to receive(:find).and_return(mock_user)
    end
    context "with valid params" do
      let(:success) { true }
      let(:params) do
        {
          id: 123,
          user: { name: 'user name' }
        }
      end

      it "updates the User" 


      it "redirects to the individual user path" 

    end

    context "with invalid params" do
      let(:success) { false }
      let(:params) do
        {
          id: 123,
          user: { name: '' }
        }
      end

      it "does not update a new User" 


      it "re-renders the edit template" 

    end
  end

  describe "#destroy" do
    let(:mock_user) { double('user', destroy: success) }
    let(:success) { true }
    let(:params) { { id: 123 } }

    before do
      allow(User).to receive(:find).and_return(mock_user)
    end
    it "tries to destroy the User" 


    context "when it successfully destroys the user" do
      let(:success) { true }

      it "redirects to the index" 

    end

    context "when it cannot destroy the user" do
      let(:success) { false }
      it 'flashes an error' 


      it "redirects to the index" 

    end

  end
end

