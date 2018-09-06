# frozen_string_literal: true

require "rails_helper"

RSpec.feature "edit user" do
  context "editing own profile" do
    let(:admin) { FactoryBot.create :admin, :wca_id }

    before :each do
      sign_in admin
    end

    it "can clear wca id" 

  end
end

