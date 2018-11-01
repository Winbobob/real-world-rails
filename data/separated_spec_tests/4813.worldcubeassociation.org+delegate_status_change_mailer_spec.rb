# frozen_string_literal: true

require "rails_helper"

RSpec.describe DelegateStatusChangeMailer, type: :mailer do
  describe "notify_board_and_wqac_of_delegate_status_change" do
    let(:senior_delegate1) { FactoryBot.create :senior_delegate, name: "Eddard Stark" }
    let(:senior_delegate2) { FactoryBot.create :senior_delegate, name: "Catelyn Stark" }
    let(:delegate) { FactoryBot.create :delegate, name: "Daenerys Targaryen", delegate_status: "candidate_delegate", senior_delegate: senior_delegate1 }
    let(:user) { FactoryBot.create :user, name: "Jon Snow" }

    it "email headers are correct" 


    it "promoting a registered speedcuber to a delegate" 


    it "promoting a candidate delegate to a delegate" 


    it "demoting a candidate delegate to a registered speedcuber" 


    it "renders a warning if someone other than their senior delegate makes the change" 

  end
end

