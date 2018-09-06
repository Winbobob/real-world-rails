require 'admin_confirmation'
require 'rails_helper'

describe AdminConfirmation do

  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }

  describe "create_confirmation" do
    it "raises an error for non-admins" 

  end

  describe "email_confirmed!" do
    before do
      ac = AdminConfirmation.new(user, admin)
      ac.create_confirmation
      @token = ac.token
    end

    it "cannot confirm if the user loses admin access" 


    it "can confirm admin accounts" 


  end

end

