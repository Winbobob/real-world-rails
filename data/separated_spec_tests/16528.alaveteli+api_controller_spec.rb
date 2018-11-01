# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApiController, "when using the API" do

  describe 'checking API keys' do
    before do
      @number_of_requests = InfoRequest.count
      @request_data = {
        'title' => 'Tell me about your chickens',
        'body' => "Dear Sir,\n\nI should like to know about your chickens.\n\nYours in faith,\nBob\n",
        'external_url' => 'http://www.example.gov.uk/foi/chickens_23',
        'external_user_name' => 'Bob Smith'
      }
    end

    it 'should check that an API key is given as a param' 


    it 'should check the API key' 

  end

  def _create_request
    post :create_request,
      :k => public_bodies(:geraldine_public_body).api_key,
    :request_json => {
      'title' => 'Tell me about your chickens',
      'body' => "Dear Sir,\n\nI should like to know about your chickens.\n\nYours in faith,\nBob\n",
      'external_url' => 'http://www.example.gov.uk/foi/chickens_23',
      'external_user_name' => 'Bob Smith'
    }.to_json
    expect(response.content_type).to eq('application/json')
    ActiveSupport::JSON.decode(response.body)['id']
  end

  # POST /api/v2/request.json
  describe 'creating a request' do
    it 'should create a new request from a POST' 

  end

  # POST /api/v2/request/:id/add_correspondence.json
  describe 'adding correspondence to a request' do
    it 'should add a response to a request' 


    it 'should add a followup to a request' 


    it 'should update the status if a valid state is supplied' 


    it 'should raise a JSON 500 error if an invalid state is supplied' 


    it 'should not allow internal requests to be updated' 


    it 'should not allow other people\'s requests to be updated' 


    it 'should return a JSON 404 error for non-existent requests' 


    it 'should return a JSON 403 error if we try to add correspondence to a request we don\'t own' 


    it 'should not allow files to be attached to a followup' 


    it 'should allow files to be attached to a response' 

  end

  # POST /api/v2/request/:id/update.json
  describe 'updating a request\'s status' do
    it 'should update the status' 


    it 'should return a JSON 500 error if an invalid state is sent' 


    it 'should return a JSON 404 error for non-existent requests' 


    it 'should return a JSON 403 error if we try to add correspondence to a request we don\'t own' 

  end

  # GET /api/v2/request/:id.json
  describe 'showing request info' do
    it 'should show information about a request' 


    it 'should show information about an external request' 

  end

  # GET /api/v2/body/:id/request_events.:feed_type
  describe 'showing public body info' do
    it 'should show an Atom feed of new request events' 


    it 'should show a JSON feed of new request events' 


    it 'should honour the since_event_id parameter' 


    it 'should honour the since_date parameter' 

  end

  # GET /api/v2/body/:id/request_events.:feed_type
  describe 'showing public body info - with rendered views' do
    render_views

    context 'with info request events' do
      before do
        get :body_request_events,
            :id => public_bodies(:humpadink_public_body).id,
            :k => public_bodies(:humpadink_public_body).api_key,
            :feed_type => 'atom'
      end

      it 'returns last event created_at as feed updated timestamp' 

    end

    context 'without info request events' do
      before do
        # since_date params is greater than any InfoRequestEvent#created_at
        # from the fixtures
        get :body_request_events,
            :id => public_bodies(:humpadink_public_body).id,
            :k => public_bodies(:humpadink_public_body).api_key,
            :since_date => '2018-01-01',
            :feed_type => 'atom'
      end

      it 'returns public body created_at as feed updated timestamp' 

    end
  end
end

