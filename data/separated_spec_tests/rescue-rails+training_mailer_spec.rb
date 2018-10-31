require 'rails_helper'

describe TrainingMailer, type: :mailer do
  include ActiveJob::TestHelper

  describe "Training Coupon Email" do
    let(:adopter) { create(:adopter, :with_app) }

    it 'job is created' 


    it 'welcome_email is sent' 


    it 'welcome_email is sent to the right user' 

  end
end

