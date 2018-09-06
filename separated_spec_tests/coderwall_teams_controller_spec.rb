require 'spec_helper'

RSpec.describe TeamsController, type: :controller do
  let(:current_user) { Fabricate(:user) }
  let(:team) { Fabricate(:team) }

  before { controller.send :sign_in, current_user }

  it 'allows user to follow team' 


  it 'allows user to stop follow team' 


  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' 

  end

  describe 'GET #show' do
    before do
      url = 'http://maps.googleapis.com/maps/api/geocode/json?address=San%20Francisco,%20CA&language=en&sensor=false'
      @body ||= File.read(File.join(Rails.root, 'spec', 'fixtures', 'google_maps.json'))
      stub_request(:get, url).to_return(body: @body)
    end

    it 'responds successfully with an HTTP 200 status code' 


    it 'sets job_page to true if job is found' 


    it 'sets job_page to false if job is not found' 


    context 'when searching by an out of bounds or non-integer id' do
      it 'should render 404' 

    end
  end

  describe '#create' do
    let(:team) { Fabricate.build(:team, name: 'team_name') }

    before do
      allow(Team).to receive(:with_similar_names).and_return([])
    end

    context 'a team is selected from a list of similar teams' do
      it 'renders a template with a choice of tariff plans when user joins and existing team' 


      it 'renders a template with a choice of tariff plans if user picks supplied team name' 

    end

    context 'a team does not exist' do
      let(:response) { post :create, team: { name: 'team_name' }, format: :js }

      before do
        allow(Team).to receive(:new).and_return(team)
        allow(team).to receive(:save).and_return(true)
        allow(team).to receive(:add_user).and_return(true)
      end

      it 'creates a new team' 


      it 'adds current user to the team' 


      it 'records an event "created team"' 


      it 'renders template with option to join' 


      it 'renders failure notice' 

    end

    context 'a team with similar name already exists' do
      before do
        allow(Team).to receive(:new).and_return(team)
        allow(Team).to receive(:with_similar_names).and_return([team])
      end

      it 'renders a template with a list of similar teams' 

    end
  end

end

