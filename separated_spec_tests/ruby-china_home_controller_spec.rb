# frozen_string_literal: true

require "rails_helper"

describe Admin::HomeController, type: :controller do
  let(:user) { create :user }
  let(:admin) { create :admin }
  describe "Admin requirement" do
    it "should open with admin user" 


    it "should 404 with non admin user" 

  end
end

