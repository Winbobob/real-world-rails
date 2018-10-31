require 'rails_helper'

describe Chapters::LeadersController do
  let(:admin) { create(:user, admin: true, first_name: 'Admin', last_name: 'User') }
  let(:chapter) { create :chapter }

  describe "potential leaders" do
    before do
      sign_in admin
    end

    it "includes all users not currently assigned as leaders" 

  end

  describe "#destroy" do
    before do
      sign_in admin
    end

    it "removes a chapter leader" 

  end

end

