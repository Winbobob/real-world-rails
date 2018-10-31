# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V0::ApiController do
  describe 'GET #competitions_search' do
    let!(:comp) { FactoryBot.create(:competition, :confirmed, :visible, name: "Jfly's Competition 2015") }

    it 'requires query parameter' 


    it "finds competition" 


    it "works well with multiple parts" 

  end

  describe 'GET #posts_search' do
    let!(:post) { FactoryBot.create(:post, title: "post title", body: "post body") }

    it 'requires query parameter' 


    it "finds post" 


    it "does not find non world readable post" 

  end

  describe 'GET #users_search' do
    let(:person) { FactoryBot.create(:person, name: "Jeremy", wca_id: "2005FLEI01") }
    let!(:user) { FactoryBot.create(:user, person: person) }

    it 'requires query parameter' 


    it 'finds Jeremy' 


    it 'does not find dummy accounts' 


    it 'can find dummy accounts' 


    it 'can find by wca_id' 


    context 'Person without User' do
      let!(:userless_person) { FactoryBot.create(:person, name: "Bob") }

      it "can find by wca_id" 


      it "can find by name" 

    end

    it 'does not find unconfirmed accounts' 


    it 'can only find delegates' 

  end

  describe 'GET #omni_search' do
    let!(:user) { FactoryBot.create(:user_with_wca_id, name: "Jeremy Fleischman") }
    let!(:comp) { FactoryBot.create(:competition, :confirmed, :visible, name: "jeremy Jfly's Competition 2015", delegates: [user]) }
    let!(:post) { FactoryBot.create(:post, title: "jeremy post title", body: "post body", author: user) }

    it 'requires query parameter' 


    it "finds all the things!" 


    it "works well when parts of the name are given" 

  end

  describe 'show_user_*' do
    it 'can query by id' 


    it 'can query by wca id' 


    it '404s nicely' 

  end

  describe 'GET #delegates' do
    it 'includes emails and regions' 


    it 'paginates' 

  end

  describe 'GET #scramble_program' do
    it 'works' 

  end

  describe 'GET #me' do
    context 'not signed in' do
      it 'returns 401' 

    end

    context 'signed in as board member' do
      before :each do
        api_sign_in_as(FactoryBot.create(:user, :board_member))
      end

      it 'has correct team membership' 

    end

    context 'signed in as senior delegate' do
      before :each do
        api_sign_in_as(FactoryBot.create(:senior_delegate))
      end

      it 'has correct delegate_status' 

    end

    context 'signed in as candidate delegate' do
      before :each do
        api_sign_in_as(FactoryBot.create(:candidate_delegate))
      end

      it 'has correct delegate_status' 

    end

    context 'signed in as delegate' do
      before :each do
        api_sign_in_as(FactoryBot.create(:delegate))
      end

      it 'has correct delegate_status' 

    end

    context 'signed in as a member of some teams and a leader of others' do
      before :each do
        user = FactoryBot.create :user

        wrc_team = Team.wrc
        FactoryBot.create(:team_member, team_id: wrc_team.id, user_id: user.id)

        results_team = Team.wrt
        FactoryBot.create(:team_member, team_id: results_team.id, user_id: user.id, team_leader: true)

        api_sign_in_as(user)
      end

      it 'has correct team membership' 

    end

    context 'signed in with valid wca id' do
      let(:person) do
        FactoryBot.create(
          :person,
          countryId: "USA",
          gender: "m",
          year: 1987,
          month: 12,
          day: 4,
        )
      end
      let(:user) do
        FactoryBot.create(
          :user,
          avatar: File.open(Rails.root.join("spec/support/logo.jpg")),
          wca_id: person.wca_id,
        )
      end
      let(:scopes) { Doorkeeper::OAuth::Scopes.new }
      before :each do
        api_sign_in_as(user, scopes: scopes)
      end

      it 'works' 


      it 'can request dob scope' 


      it 'can request email scope' 


      it 'can request email and dob scope' 

    end

    context 'signed in with invalid wca id' do
      let(:user) do
        u = FactoryBot.create :user, country_iso2: "US"
        u.update_column(:wca_id, "fooooo")
        u
      end
      let(:scopes) { Doorkeeper::OAuth::Scopes.new }
      let(:token) { double acceptable?: true, resource_owner_id: user.id, scopes: scopes }
      before :each do
        allow(controller).to receive(:doorkeeper_token) { token }
      end

      it 'works' 

    end

    context 'signed in without wca id' do
      let(:user) { FactoryBot.create :user, country_iso2: "US" }
      let(:scopes) { Doorkeeper::OAuth::Scopes.new }
      let(:token) { double acceptable?: true, resource_owner_id: user.id, scopes: scopes }
      before :each do
        allow(controller).to receive(:doorkeeper_token) { token }
      end

      it 'works' 

    end
  end
end

