# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AlaveteliPro::EmbargoMailer do
  let(:pro_user) { FactoryGirl.create(:pro_user) }
  let(:pro_user_2) { FactoryGirl.create(:pro_user) }
  let(:embargo_extension) { FactoryGirl.create(:embargo_extension) }

  let!(:expiring_1) do
    FactoryGirl.create(:embargo_expiring_request, user: pro_user)
  end
  let!(:expiring_2) do
    FactoryGirl.create(:embargo_expiring_request, user: pro_user)
  end
  let!(:expiring_3) do
    FactoryGirl.create(:embargo_expiring_request, user: pro_user_2)
  end

  let!(:expired_1) do
    FactoryGirl.create(:embargo_expired_request, user: pro_user)
  end
  let!(:expired_2) do
    FactoryGirl.create(:embargo_expired_request, user: pro_user)
  end
  let!(:expired_3) do
    FactoryGirl.create(:embargo_expired_request, user: pro_user_2)
  end

  let!(:embargoed) { FactoryGirl.create(:embargoed_request) }
  let!(:not_embargoed) { FactoryGirl.create(:info_request) }

  describe '.alert_expiring' do
    it 'only sends one email per user' 


    it 'only sends an alert about an expiring embargo once' 


    it 'sends an alert about an expiring embargo extension' 


    it 'creates UserInfoRequestSentAlert records for each expiring request' 


    it "doesn't include requests with use_notifications: true" 

  end

  describe '#expiring_alert' do
    context "when there's just one embargo" do
      before do
        @message = AlaveteliPro::EmbargoMailer.
                    expiring_alert(pro_user, [expiring_1]).
                      message
      end

      it 'sets the subject correctly for a single embargo' 


      it "sends the email to the user" 


      it "sends the email from the pro contact address" 

    end

    context "when there are multiple embargoes" do
      before do
        @message = AlaveteliPro::EmbargoMailer.
                     expiring_alert(pro_user, [expiring_1, expiring_2]).
                       message
      end

      it 'sets the subject correctly' 


      it "sends the email to the user" 


      it "sends the email from the pro contact address" 

    end

    it "Doesn't escape characters in the site name in the subject line" 

  end

  describe '.alert_expired' do

    it 'only sends one email per user' 


    it 'only sends an alert about an expired embargo once' 


    it 'creates UserInfoRequestSentAlert records for each expired request' 


    it "doesn't include requests with use_notifications: true" 

  end

  describe '#expired_alert' do

    context "when there's just one embargo" do
      before do
        @message = AlaveteliPro::EmbargoMailer.
                    expired_alert(pro_user, [expired_1]).
                      message
      end

      it 'sets the subject correctly for a single embargo' 


      it "sends the email to the user" 


      it "sends the email from the pro contact address" 


    end

    context "when there are multiple embargoes" do

      before do
        @message = AlaveteliPro::EmbargoMailer.
                     expired_alert(pro_user, [expired_1, expired_2]).
                       message
      end

      it 'sets the subject correctly' 


      it "sends the email to the user" 


      it "sends the email from the pro contact address" 


    end

  end

end

