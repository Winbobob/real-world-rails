# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V0::CompetitionsController do
  def get_wcif_and_compare_persons_to(id, expected)
    get :show_wcif, params: { competition_id: id }
    parsed_body = JSON.parse(response.body)
    person_arrays = parsed_body["persons"].map do |p|
      [p["wcaUserId"], p["registrantId"]]
    end
    expect(person_arrays).to eq expected
  end

  describe 'GET #show' do
    let(:competition) {
      FactoryBot.create(
        :competition,
        :with_delegate,
        id: "TestComp2014",
        start_date: "2014-02-03",
        end_date: "2014-02-05",
        external_website: "http://example.com",
        showAtAll: true,
      )
    }

    it '404s on invalid competition' 


    it '404s on hidden competition' 


    it 'finds competition' 

  end

  describe 'GET #index' do
    it 'sorts newest to oldest' 


    it 'can query by country_iso2' 


    context 'managed_by' do
      let(:delegate1) { FactoryBot.create(:delegate) }
      let(:delegate2) { FactoryBot.create(:delegate) }
      let(:organizer1) { FactoryBot.create(:user) }
      let(:organizer2) { FactoryBot.create(:user) }
      let!(:competition) {
        FactoryBot.create(:competition, :confirmed, delegates: [delegate1, delegate2], organizers: [organizer1, organizer2])
      }
      let!(:other_comp) { FactoryBot.create(:competition) }

      it 'managed_by includes delegate' 


      it 'managed_by includes organizer' 

    end

    it 'can do a plaintext query' 


    it 'validates start' 


    it 'validates end' 


    it 'validates country_iso2' 


    it 'can query by date' 


    it 'can query by announced_after' 


    it 'paginates' 

  end

  describe 'wcif' do
    let!(:competition) {
      FactoryBot.create(
        :competition,
        :with_delegate,
        :registration_open,
        id: "TestComp2014",
        name: "Test Comp 2014",
        start_date: "2014-02-03",
        end_date: "2014-02-05",
        external_website: "http://example.com",
        showAtAll: true,
        event_ids: %w(333 444),
      )
    }

    let(:hidden_competition) {
      FactoryBot.create(
        :competition,
        :not_visible,
        id: "HiddenComp2014",
        delegates: competition.delegates,
      )
    }

    it '404s on invalid competition' 


    it '404s on hidden competition' 


    context 'signed in without manage_competitions scope' do
      let(:delegate) { competition.delegates.first }

      before :each do
        api_sign_in_as(delegate)
      end

      it '404s on hidden competition' 


      it 'get wcif' 

    end

    context 'signed in as delegate' do
      let(:delegate) { competition.delegates.first }

      before :each do
        scopes = Doorkeeper::OAuth::Scopes.new
        scopes.add("manage_competitions")
        api_sign_in_as(delegate, scopes: scopes)
      end

      it 'does not 404 on their own hidden competition' 


      it 'get wcif' 


      it 'gets wcif with consistent competitor_id' 

    end
  end
end

