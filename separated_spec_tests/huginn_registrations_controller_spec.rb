require 'rails_helper'

module Users
  describe RegistrationsController do
    describe "POST create" do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
      end

      context 'with valid params' do
        it "imports the default scenario for the new user" 

      end

      context 'with invalid params' do
        it "does not import the default scenario" 


        it 'does not allow to set the admin flag' 

      end
    end
  end
end

