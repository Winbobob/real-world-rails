require 'rails_helper'

describe NewAdopterMailer, type: :mailer do
  include ActiveJob::TestHelper

  describe "PLEASE REPLY Application Email" do
    let(:adopter) { create(:adopter, :with_app) }

    it 'job is created' 


    it 'welcome_email is sent' 


    it 'welcome_email is sent to the right user' 

  end
end

