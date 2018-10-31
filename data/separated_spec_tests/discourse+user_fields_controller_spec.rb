require 'rails_helper'

describe Admin::UserFieldsController do
  it "is a subclass of AdminController" 


  context "when logged in" do
    let(:admin) { Fabricate(:admin) }

    before do
      sign_in(admin)
    end

    describe '#create' do
      it "creates a user field" 


      it "creates a user field with options" 

    end

    describe '#index' do
      let!(:user_field) { Fabricate(:user_field) }

      it "returns a list of user fields" 

    end

    describe '#destroy' do
      let!(:user_field) { Fabricate(:user_field) }

      it "deletes the user field" 

    end

    describe '#update' do
      let!(:user_field) { Fabricate(:user_field) }

      it "updates the user field" 


      it "updates the user field options" 


      it "keeps options when updating the user field" 

    end
  end
end

