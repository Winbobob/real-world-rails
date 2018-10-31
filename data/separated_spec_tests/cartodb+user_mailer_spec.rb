# coding: UTF-8

require 'spec_helper_min'

describe UserMailer do

  include Carto::Factories::Visualizations

  describe ".password_reset" do

    before(:all) do
      @user = FactoryGirl.create(:carto_user, email: 'user@example.com', password_reset_token: 'token')
    end

    before(:each) do
      @mailer = UserMailer.password_reset(@user)
    end

    after(:each) do
      ActionMailer::Base.deliveries = []
    end

    after(:all) do
      @user.destroy
    end

    it "delivers the mail" 


    it "delivers with the expected subject" 


    it "delivers to the expected recipients" 


    it "delivers a link with the password reset token" 


  end
end

