require 'spec_helper'

describe AppsController do
  let(:dummy_app) do
    App.new
  end

  let(:fake_delete_response) { double(:fake_delete_response, body: 'test', status: 200) }

  before do
    allow(controller).to receive(:show_url)
    allow(App).to receive(:find).and_return(dummy_app)
    allow(dummy_app).to receive(:id).and_return(77)
    allow(dummy_app).to receive(:categories).and_return([
      Category.new(id: 33, name: 'Test3', position: 3),
      Category.new(id: 22, name: 'Test2', position: 2),
      Category.new(id: 11, name: 'Test1', position: 1)
    ])
  end

  describe 'POST #create' do
    before do
      allow(App).to receive(:create).and_return(dummy_app)
    end

    it 'creates an application' 


    it 'assigns app' 


    context 'when the created app is valid' do
      before do
        allow(dummy_app).to receive(:valid?).and_return(true)
      end

      it 'redirects to the show page' 


      it 'shows a success message' 

    end

    context 'when app is not valid' do
      before do
        allow(App).to receive(:create).and_return(false)
      end

      it 'renders the show template' 

    end

    context 'when a compose_yaml_uri is present in the post params (before_filter)' do
      let(:compose_yaml_uri) { 'http://www.example.com' }
      let(:compose_yaml_contents) { '---\n' }

      before do
        allow(Net::HTTP).to receive(:get).with(URI(compose_yaml_uri)).and_return(compose_yaml_contents)
      end

      it 'gets the content of the uri' 


      it 'sets the compose_yaml_file param with a StringIO of the compose yaml contents' 

    end
  end

  describe 'PUT #update' do
    let(:attributes) do
      {
        'name' => 'My App',
        'id' => '77'
      }
    end

    before do
      allow(App).to receive(:find).and_return(dummy_app)
      allow(dummy_app).to receive(:save)
    end

    it 'retrieves the app to be updated' 


    it 'writes the attributes' 


    it 'saves the record' 

  end

  describe '#destroy' do
    before do
      allow(dummy_app).to receive(:destroy)
    end

    it 'uses the applications service to destroy the application' 


    it 'redirects to applications index view when format is html' 


    it 'renders json response when format is json' 

  end

  describe 'GET #index' do
    let(:apps) { [App.new] }
    before do
      allow(App).to receive(:all).and_return(apps)
    end

    it 'retrieves all the applications' 

  end

  describe 'GET #show' do
    it 'retrieves the application' 


    it 'assigns app' 


    it 'sorts the categories by position' 


    it 'returns a 404 if the app is not found' 

  end

  describe 'GET #documentation' do
    it 'renders the apps documentation with the documentation layout' 


    it 'returns 404 if there is no documentation for the app' 

  end

  describe 'GET #relations' do
    it 'renders the partial for the relationship view for the app' 

  end

  describe 'POST #template' do
    let(:template_response) do
      double(:template_response,
             body: '{ "template": "My Template String" }',
             status: 200
            )
    end

    before do
      allow(dummy_app).to receive(:post).and_return(template_response)
    end

    it 'retrieve the template' 


    it 'returns the template string received' 

  end

  describe '#journal' do
    let(:journal_lines) do
      [
        { id: 1, message: 'foo' }
      ]
    end

    before do
      allow(dummy_app).to receive(:get).and_return(journal_lines)
    end

    it 'retrieve the journal' 


    it 'returns the journal lines' 


    it 'returns a 200 status code' 

  end

  describe '#compose_yml' do
    let(:compose) do
      '{"compose_yaml": "---\nWP:\n  image: centurylink/wordpress:3.9.1\n"}'
    end

    before do
      allow(Net::HTTP).to receive(:get).and_return(compose)
    end

    it 'retrieves the compose yaml representation of the app' 


    it 'returns the compose yaml' 


    it 'returns a 200 status code' 

  end

  describe '#compose_download' do
    let(:compose) do
      "---\nWP:\n  image: centurylink/wordpress:3.9.1\n"
    end

    before do
      allow(Net::HTTP).to receive(:get).and_return(compose)
    end

    it 'retrieves the compose yaml representation of the app' 


    it 'sends a file of the compose yaml' 

  end

  describe '#compose_export' do
    let(:gist_response_body) do
      {
        links: {
          gist: {
            html_url: 'html',
            raw_url: 'raw'
          }
        }
      }
    end
    let(:gist_response) { double('gist_response', body: gist_response_body.to_json) }
    before do
      allow(Net::HTTP).to receive(:post_form).and_return(gist_response)
    end

    it 'sends a post request to the API to create the gist from the app' 


    it 'redirects to lorry.io with the gist uri in the query string' 

  end

  describe '#rebuild' do
    it 'rebuilds the application' 


    context 'when successful' do
      before do
        allow(dummy_app).to receive(:put).and_return(true)
      end

      it 'redirects to the applications index view when format is html' 


      it 'sets a flash success message' 


      it 'returns no content for json' 

    end

    context 'when unsuccessful' do
      before do
        allow(dummy_app).to receive(:put).and_return(false)
      end

      it 'returns status 302 when format is html' 


      it 'sets a flash alert' 


      it 'returns status 204 when format is json' 

    end

    context 'when an ActiveResource::ServerError occurs' do
      before do
        allow(dummy_app).to receive(:put).and_raise(
          ActiveResource::ServerError.new(nil, 'oops'))
      end

      context 'when a referer is present' do
        before do
          request.env['HTTP_REFERER'] = '/some/path'
        end

        it 'flashes the error message' 


        it 'redirects to the referer' 

      end

      context 'when a referer is not present' do
        it 'flashes the error message' 


        it 'redirects to the apps_path' 

      end
    end
  end
end

