# frozen_string_literal: true

require "rails_helper"

RSpec.describe AvatarsMailer, type: :mailer do
  describe "notify_user_of_avatar_rejection" do
    let(:user) { FactoryBot.create :user, name: "Sherlock Holmes" }
    let(:rejection_reason) { "The avatar must not include texts other than regular background texts." }
    let(:mail) { AvatarsMailer.notify_user_of_avatar_rejection(user, rejection_reason) }

    it "renders the headers" 


    it "renders the body" 

  end
end

