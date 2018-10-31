# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DelegatesPanelController do
  describe "signed in as wrt member" do
    let(:wrt_member) { FactoryBot.create :user, :wrt_member }
    before :each do
      sign_in wrt_member
    end

    it "can edit" 


    it "can view" 

  end

  describe "signed in as delegate" do
    let(:delegate) { FactoryBot.create :delegate }
    before :each do
      sign_in delegate
    end

    it "can't edit" 


    it "can view" 

  end
end

