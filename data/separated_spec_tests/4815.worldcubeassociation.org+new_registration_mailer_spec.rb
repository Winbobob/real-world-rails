# frozen_string_literal: true

require "rails_helper"

RSpec.describe NewRegistrationMailer, type: :mailer do
  describe "send registration mail to new users" do
    let(:user) { FactoryBot.create :user }
    let(:mail) { NewRegistrationMailer.send_registration_mail(user) }

    it "renders the headers" 


    it "renders the body" 

  end
end

