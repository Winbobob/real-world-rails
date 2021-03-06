require 'rails_helper'

RSpec.describe CaseWorkers::ClaimsController, type: :controller do
  before do
    @case_worker = create(:case_worker)
    sign_in @case_worker.user
  end

  describe 'GET index'do
    let(:claims_service) { double Claims::CaseWorkerClaims }
    let(:page_of_claims) { double('Page of claims', map: [1, 2, 3]) }
    let(:claims_collection) { double('Claims Collection', remote?: true, first: page_of_claims) }
    let(:params) do
      {
      'tab' => 'current',
      'controller' => 'case_workers/claims',
      'action' => 'index'
    }
    end

    let(:criteria) do
      {
        sorting: 'last_submitted_at',
        direction: 'asc',
        page: 0,
        limit: 10,
        search: nil
      }
    end

    context 'no search terms present' do
      it 'calls case worker claims service with appropriate params' 

    end

    context 'search terms present' do
      it 'calls case worker claims service with search criteria' 

    end
  end

  describe 'GET download_zip' do
    let(:claim) { create :claim }

    before(:each) { get :download_zip, params: { id: claim } }

    it 'responds with an http success' 


    it 'returns a zip file' 


    it 'returns a correctly named file' 

  end

  describe  'GET show' do
    let(:claim) { create :claim }

    before(:each) { get :show, params: { id: claim } }

    it 'responds with an http success' 


    it 'populates instance variables' 


    it 'renders show' 

  end

  describe 'GET messages' do
    let(:claim) { create :claim }

    it 'renders the messages partial' 

  end

  describe 'PATCH #update' do

    let(:claim) {create :allocated_claim }
    let(:updater) { double Claims::CaseWorkerClaimUpdater }
    let(:params) { strong_params('additional_information' => 'foo bar', 'current_user'=> @case_worker.user) }

    before(:each) do
      expect(updater).to receive(:update!).and_return(updater)
      expect(updater).to receive(:claim).and_return(claim)
      expect(Claims::CaseWorkerClaimUpdater).to receive(:new).with(claim.id.to_s, params).and_return(updater)
    end

    it 'should call updater service with params' 


    it 'should redirect if updater service responded :ok' 


    it 'should render show if updater service responds :error' 

  end

  context 'GET #archived' do
    before(:all) do
      @case_worker = create(:case_worker)
      advocate = create :external_user, :advocate
      create_claims(3, :allocated, 'Joex Bloggs', advocate)
      create_claims(1, :allocated, 'Fred Bloggs', advocate)
      create_claims(2, :authorised, 'Joex Bloggs', advocate)
      create_claims(3, :authorised, 'Fred Bloggs', advocate)
      create_claims(1, :part_authorised, 'Fred Bloggs', advocate)
      create_claims(2, :part_authorised, 'Someone Else', advocate)
    end

    after(:all) do
      clean_database
    end

    describe '#archived with no filtering', vcr: {cassette_name: 'spec/case_workers/claims/archived'} do
      before(:each) do
        get :archived, params: { 'tab' => 'archived' }
      end

      xit 'returns all in authorised and part authorised status, with default ordering based on last submitted date, oldest first' do
        expect(assigns(:claims).size).to eq 8
        expect(assigns(:claims).map(&:last_submitted_at)).to eq(assigns(:claims).sort_by(&:last_submitted_at).map(&:last_submitted_at))
      end
    end

    describe '#archived with filtering by defendant name', vcr: {cassette_name: 'spec/case_workers/claims/archived_search_by_defendant'} do
      search_terms = {
        'Joex Bloggs' => 2,
        'Fred Bloggs' => 4,
        'Bloggs'      => 6
      }
      search_terms.each do |search_term, expected_number_of_results|
        xit 'returns only the claims where the defendant is is in the search terms' do
          get :archived, params: { 'tab' => 'archived', 'search' => search_term }
          expect(assigns(:claims).size).to eq expected_number_of_results
        end
      end
    end

    def create_claims(qty, status, defendant_name, advocate)
      factory_name = "#{status}_claim".to_sym
      claims = create_list(factory_name, qty, external_user: advocate)
      claims.each do |claim|
        claim.case_workers << @case_worker
        create(:defendant, claim: claim, first_name: defendant_name.split.first, last_name: defendant_name.split.last)
      end
    end
  end
end

