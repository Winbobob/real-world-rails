require 'rails_helper'

describe Admin::UserFieldsController do

  it "is a subclass of AdminController" 


  context "when logged in" do
    let!(:user) { log_in(:admin) }

    context '.create' do
      it "creates a user field" 


      it "creates a user field with options" 

    end

    context '.index' do
      let!(:user_field) { Fabricate(:user_field) }

      it "returns a list of user fields" 

    end

    context '.destroy' do
      let!(:user_field) { Fabricate(:user_field) }

      it "deletes the user field" 

    end

    context '.update' do
      let!(:user_field) { Fabricate(:user_field) }

      it "updates the user field" 


      it "updates the user field options" 


      it "keeps options when updating the user field" 

    end
  end

end

