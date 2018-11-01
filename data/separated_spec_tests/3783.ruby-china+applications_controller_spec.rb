# frozen_string_literal: true

require "rails_helper"

describe Oauth::ApplicationsController, type: :controller do
  let(:application) { create(:application, owner: user) }
  describe ":index" do
    let(:user) { create :user }
    it "should show register link if user not signed in" 


    it "should have hot topic lists if user is signed in" 


    it "should :new" 


    it "should :edit" 

  end
end

