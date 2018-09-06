require 'spec_helper'

describe EnterpriseMailer do
  let!(:enterprise) { create(:enterprise) }
  let!(:user) { create(:user) }

  before do
    ActionMailer::Base.deliveries = []
    Spree::MailMethod.create!(environment: 'test')
  end

  describe "#welcome" do
    it "sends a welcome email when given an enterprise" 

  end

  describe "#manager_invitation" do
    it "should send a manager invitation email when given an enterprise and user" 

  end
end

