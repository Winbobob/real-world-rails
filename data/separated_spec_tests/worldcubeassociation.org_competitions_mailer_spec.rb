# frozen_string_literal: true

require "rails_helper"

RSpec.describe CompetitionsMailer, type: :mailer do
  describe "notify_board_of_confirmed_competition" do
    let(:senior_delegate) { FactoryBot.create :senior_delegate }
    let(:delegate) { FactoryBot.create :delegate, senior_delegate: senior_delegate }
    let(:second_delegate) { FactoryBot.create :delegate, senior_delegate: senior_delegate }
    let(:third_delegate) { FactoryBot.create :delegate }
    let(:competition) { FactoryBot.create :competition, :with_competitor_limit, championship_types: %w(world greater_china), delegates: [delegate, second_delegate, third_delegate], registration_requirements: "Some requirements" }
    let(:mail) { CompetitionsMailer.notify_board_of_confirmed_competition(delegate, competition) }

    it "renders" 

  end

  describe "notify_users_of_results_presence" do
    let(:competition) { FactoryBot.create :competition, :with_delegate }
    let(:competitor_user) { FactoryBot.create :user, :wca_id }
    let(:mail) { CompetitionsMailer.notify_users_of_results_presence(competitor_user, competition) }

    it "renders the headers" 


    it "renders the body" 

  end

  describe "notify_users_of_id_claim_possibility" do
    let(:competition) { FactoryBot.create :competition }
    let(:newcomer_user) { FactoryBot.create :user }
    let(:mail) { CompetitionsMailer.notify_users_of_id_claim_possibility(newcomer_user, competition) }

    it "renders the headers" 


    it "renders the body" 

  end

  describe "submit_results_nag" do
    let(:senior) { FactoryBot.create(:senior_delegate) }
    let(:delegate) { FactoryBot.create(:delegate, senior_delegate_id: senior.id) }
    let(:competition) do
      FactoryBot.create(:competition, name: "Comp of the Future 2016", delegates: [delegate])
    end
    let(:mail) { CompetitionsMailer.submit_results_nag(competition) }

    it "renders the headers" 


    it "renders the body" 

  end

  describe "submit_report_nag" do
    let(:senior) { FactoryBot.create(:senior_delegate) }
    let(:delegate) { FactoryBot.create(:delegate, senior_delegate_id: senior.id) }
    let(:competition) { FactoryBot.create(:competition, name: "Peculiar Comp 2016", delegates: [delegate], starts: 5.days.ago, ends: 3.days.ago) }
    let(:mail) { CompetitionsMailer.submit_report_nag(competition) }

    it "renders the headers" 


    it "renders the body" 

  end

  describe "notify_of_delegate_report_submission" do
    let(:competition) do
      competition = FactoryBot.create(:competition, :with_delegate_report, countryId: "Australia", name: "Comp of the Future 2016", starts: Date.new(2016, 2, 1), ends: Date.new(2016, 2, 2))
      competition.delegate_report.update_attributes!(remarks: "This was a great competition")
      competition
    end
    let(:mail) do
      # Let's pick a foreign locale to make sure it's not localized
      I18n.locale = :fr
      CompetitionsMailer.notify_of_delegate_report_submission(competition)
    end

    it "renders the headers" 


    it "renders the body" 


    it "is sent in English" 

  end

  describe "results_submitted" do
    let(:delegates) { FactoryBot.create_list(:delegate, 3) }
    let(:competition) { FactoryBot.create(:competition, name: "Comp of the future 2017", id: "CompFut2017", delegates: delegates) }
    let(:file_contents) { '{ "results": "good" }' }
    let(:mail) { CompetitionsMailer.results_submitted(competition, "Hello, here are the results", "John Doe", file_contents) }
    let(:utc_now) { Time.utc(2018, 2, 23, 22, 3, 32) }

    before(:each) do
      allow(Time).to receive(:now).and_return(utc_now)
    end

    it "renders the headers" 


    it "renders the body" 


    it "attaches the expected file" 

  end
end

