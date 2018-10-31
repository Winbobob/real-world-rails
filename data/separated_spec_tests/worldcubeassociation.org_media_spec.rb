# frozen_string_literal: true

require "rails_helper"

RSpec.shared_examples "only WCT" do |action, expect_success|
  context "when not signed in" do
    it "redirects to sign in page" 

  end

  context "when signed in as regular user" do
    sign_in { FactoryBot.create :user }

    it "redirects to home page" 

  end

  context "when signed in as a WCT member" do
    before :each do
      sign_in FactoryBot.create :user, :wct_member
    end

    it 'can perform action' 

  end
end

RSpec.shared_examples "must sign in" do |action, expect_success|
  context "when not signed in" do
    it "redirects to sign in page" 

  end

  context "when signed in as regular user" do
    let(:user) { FactoryBot.create :user }

    before :each do
      sign_in user
    end

    it 'can perform action' 

  end
end

RSpec.describe "media" do
  let(:competition_2013) { FactoryBot.create(:competition, :with_delegate, :visible, starts: Date.new(2013, 4, 4)) }
  let!(:medium_2013) { FactoryBot.create(:competition_medium, :pending, competition: competition_2013, text: "i am from 2013 and pending") }
  let!(:accepted_medium_2013) { FactoryBot.create(:competition_medium, :accepted, competition: competition_2013, text: "i am from 2013 and accepted") }

  let(:competition) { FactoryBot.create(:competition, :with_delegate, :visible, countryId: "United Kingdom", starts: Date.today) }
  let!(:medium) { FactoryBot.create(:competition_medium, :pending, competition: competition, text: "i am pending") }
  let!(:accepted_medium) { FactoryBot.create(:competition_medium, :accepted, competition: competition, text: "i am accepted") }

  describe 'GET #new' do
    it_should_behave_like 'must sign in',
                          lambda { get new_medium_path },
                          lambda { |current_user| expect(response).to be_success }
  end

  describe 'POST #create' do
    it_should_behave_like(
      'must sign in',
      lambda do
        post media_path, params: {
          'competition_medium[status]': "accepted", # This should get ignored and set to 'pending'

          # These should get ignored and set to the current user's information.
          'competition_medium[submitterName]': "Jeremy",
          'competition_medium[submitterEmail]': "jeremy@jflei.com",

          'competition_medium[competitionId]': competition_2013.id,
          'competition_medium[type]': 'report',
          'competition_medium[text]': 'i was just created',
          'competition_medium[link]': "https://www.jflei.com",
          'competition_medium[submitterComment]': "this is a comment",
        }
      end,
      lambda do |current_user|
        medium = CompetitionMedium.find_by_text!("i was just created")
        expect(medium.status).to eq "pending"
        expect(medium.submitterName).to eq current_user.name
        expect(medium.submitterEmail).to eq current_user.email
      end,
    )
  end

  describe 'GET #index' do
    it "shows accepted media for current year" 


    describe "filter by year" do
      it "all years" 


      it "2013" 

    end

    describe "filter by region" do
      let!(:competition_us) { FactoryBot.create(:competition, :with_delegate, :visible, countryId: "USA", starts: Date.today) }
      let!(:medium_us) { FactoryBot.create(:competition_medium, :accepted, competition: competition_us, text: "i am in the us and accepted") }

      it "filters by country" 


      it "filters by continent" 

    end
  end

  describe 'GET #validate' do
    it_should_behave_like 'only WCT',
                          lambda { get validate_media_path },
                          lambda { expect(response).to be_success }

    context "signed in as WCT member" do
      before :each do
        sign_in FactoryBot.create :user, :wct_member
      end

      it "default shows only pending media for all years" 


      it "can show accepted media" 

    end
  end

  describe "GET #edit" do
    it_should_behave_like 'only WCT',
                          lambda { get edit_medium_path(medium) },
                          lambda { expect(response).to be_success }
  end

  describe "PATCH #update" do
    let(:patch_medium) do
      lambda do |attributes|
        patch medium_path(medium), params: (attributes.map do |key, value|
          ["competition_medium[#{key}]", value]
        end.to_h)
      end
    end

    it_should_behave_like 'only WCT',
                          lambda { patch_medium.call(text: 'new text') },
                          lambda { expect(response).to redirect_to edit_medium_path(medium) }

    context "signed in as WCT member" do
      before :each do
        sign_in FactoryBot.create :user, :wct_member
      end

      it "can accept medium" 


      it "can edit medium" 

    end
  end

  describe "DELETE #destroy" do
    let(:destroy_medium) { lambda { delete medium_path(medium) } }

    it_should_behave_like 'only WCT',
                          lambda { destroy_medium.call },
                          lambda {
                            expect(response).to redirect_to validate_media_path
                            expect(CompetitionMedium.find_by_id(medium.id)).to be_nil
                          }
  end
end

