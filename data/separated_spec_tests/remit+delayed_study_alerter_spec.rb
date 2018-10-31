require "rails_helper"
require "delayed_study_alerter"

RSpec.shared_examples_for("delayed study alerter") do
  context "when no-ones been alerted before" do
    it "sends emails to the right people" 


    it "records who it's sent emails to" 

  end

  context "when everyone's been alerted before" do
    it "doesn't send any more alerts" 

  end

  context "when some people have been alerted" do
    it "only alerts those that haven't" 

  end

  context "when an admin is also a pi" do
    it "doesn't send them an email twice" 

  end
end

RSpec.describe DelayedStudyAlerter, type: :mailer do
  let!(:pi) { FactoryGirl.create(:user) }
  let!(:rm) { FactoryGirl.create(:user) }
  let!(:admin1) { FactoryGirl.create(:admin_user) }
  let!(:admin2) { FactoryGirl.create(:admin_user) }

  before do
    # Creating users sends emails, so clear those out first
    ActionMailer::Base.deliveries = []
  end

  describe "#alert_delayed_completing" do
    let!(:study) do
      FactoryGirl.create(
        :study,
        principal_investigator: pi,
        research_manager: rm,
        expected_completion_date: Time.zone.today - 1.day)
    end
    let(:alert_type) { SentAlert::DELAYED_COMPLETING }
    let(:action) { :alert_delayed_completing }

    it_behaves_like "delayed study alerter"
  end

  describe "#alert_approval_expiring" do
    let(:accept) { FactoryGirl.create(:accept) }
    let!(:study) do
      FactoryGirl.create(
        :study,
        principal_investigator: pi,
        research_manager: rm,
        study_stage: :delivery,
        erb_status: accept,
        erb_approval_expiry: Time.zone.today - 1.day)
    end
    let(:alert_type) { SentAlert::APPROVAL_EXPIRING }
    let(:action) { :alert_approval_expiring }

    it_behaves_like "delayed study alerter"
  end

  describe "#alert_response_overdue" do
    let(:submitted) { ErbStatus.find_by_name("Submitted") }
    let!(:study) do
      FactoryGirl.create(
        :study,
        principal_investigator: pi,
        research_manager: rm,
        erb_status: submitted,
        erb_submitted: Time.zone.today - 4.months)
    end
    let(:alert_type) { SentAlert::RESPONSE_OVERDUE }
    let(:action) { :alert_response_overdue }

    it_behaves_like "delayed study alerter"
  end
end

