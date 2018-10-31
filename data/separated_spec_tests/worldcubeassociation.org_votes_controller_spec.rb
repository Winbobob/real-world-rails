# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VotesController do
  let(:poll) { FactoryBot.create(:poll, :confirmed) }

  context "not logged in" do
    it "redirects to sign in" 

  end

  context "logged in as a regular user" do
    sign_in { FactoryBot.create(:user) }
    it "redirects to home page" 

  end

  context "logged in as delegate" do
    let(:delegate) { FactoryBot.create :delegate }
    before :each do
      sign_in delegate
    end

    describe "POST #create" do
      it "creates and updates a vote" 


      it "creates and updates multiple votes" 

    end
  end
end

