require "rails_helper"

RSpec.describe UsersController, type: :request do
  fixtures :users

  before :each do
    create_user_session(users(:sudara))
  end

  context "GET show" do
    it "displays user info route v1" 


    it "displays user info route v2" 

  end

  context "POST create" do
    let(:params) do
      {
        user: {
          login: 'quire',
          email: 'quire@example.com',
          password: 'quire12345',
          password_confirmation: 'quire12345'
        }
      }
    end

    it "should create a user and redirect" 


    it "should raise an error if user is invalid" 

  end
end

