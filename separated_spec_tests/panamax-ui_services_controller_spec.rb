require 'spec_helper'

describe ServicesController do
  let(:valid_app) { double(:valid_app) }
  let(:valid_service) { double(:valid_service, id: 3) }
  let(:fake_create_response) { double(:fake_create_response, body: 'test', status: 200) }
  let(:app_services) { double([Service.new]) }

  before do
    allow(App).to receive(:find).and_return(valid_app)
    allow(Service).to receive(:find).and_return(valid_service)
    allow(valid_service).to receive(:categories=)
    allow(valid_service).to receive(:hydrate_linked_services!).and_return(Service.new)
    allow(valid_app).to receive(:services).and_return(app_services)
  end

  describe 'GET #show' do
    it 'uses the application service to retrieve the application' 


    it 'retrieves the service' 


    it 'assigns app' 


    it 'assigns service' 


    it 'hydrates the linked services' 


    context 'when format is JSON' do
      it 'returns the JSON-serialized service' 

    end
  end

  describe 'category param builder' do

    context 'in Uncategorized or Services category' do
      let(:application_params) do
        { category: 'null' }
      end

      it 'does not assign a category' 

    end

    context 'in a defined Category' do
      let(:application_params) do
        { category: 77 }
      end

      it 'puts category information into an array with an id hash' 

    end
  end

  describe 'POST #create' do
    let(:dummy_category) { double(:category) }
    let(:dummy_service) { Service.new(name: 'test', from: 'test:latest') }
    let(:service_form_params) do
      {
        'app' =>
          {
            'category' => '1'
          },
        'name' => 'tutum/wordpress',
        'app_id' => '77',
      }
    end

    before do
      allow(Category).to receive(:find).and_return(dummy_category)
      allow_any_instance_of(Service).to receive(:save)
    end

    it 'creates the service' 


    context 'when the tag is supplied' do
      before do
        service_form_params['app']['tag'] = 'fizzle'
      end

      it 'creates the service with the supplied tag' 


    end

    it 'redirected to application management view when format is html' 


    it 'renders json response when format is json' 

  end

  describe 'PATCH #update' do
    let(:attributes) do
      {
        'name' => 'DB_1',
        'links_attributes' => {
          '0' => {
            'service_id' => '4',
            'alias' => 'database'
          }
        }
      }
    end

    let(:category_attributes) do
      {
        'name' => 'DB_1',
        'links_attributes' => {
          '0' => {
            'service_id' => '4',
            'alias' => 'database'
          }
        },
        'categories' => [
          {
            'id' => '1',
            'position' => nil
          }
        ]
      }
    end

    before do
      allow(valid_service).to receive(:write_attributes)
      allow(valid_service).to receive(:save).and_return(true)
    end

    it 'retrieves the service to be updated' 


    it 'writes the attributes' 


    it 'updates the service categories when present' 


    it 'saves the record' 


    it 'redirects to the show page' 


    context 'when saving fails' do
      before do
        allow(valid_service).to receive(:save).and_return(false)
        allow(valid_service).to receive(:reload).and_return(true)
        allow(valid_service).to receive(:hydrate_linked_services!).and_return(true)
      end

      it 'reloads the service' 


      it 'rehydrates linked services' 


      it 're-renders the show page' 

    end
  end

  describe '#destroy' do
    before do
      allow(valid_service).to receive(:destroy)
    end

    it 'uses the services service to destroy the service' 


    it 'redirects to application management view when format is html' 


    it 'renders json response when format is json' 

  end

  describe '#journal' do
    let(:journal_lines) do
      [
        { date: '1974-02-12', message: 'sparky' },
        { date: '1973-10-25', message: 'katie' }
      ]
    end

    before do
      allow(Service).to receive(:new).and_return(valid_service)
      allow(valid_service).to receive(:get).and_return(journal_lines)
    end

    context 'when the cursor param is nil' do

      it 'retrieves the journal from the API with a nil cursor' 

    end

    context 'when the cursor param is not nil' do

      let(:cursor) { 'cursor1' }

      it 'retrieves the journal from the API with a cursor' 

    end

    it 'returns journal response in JSON format' 

  end

  describe 'GET #index' do
    it 'uses the application service to retrieve the application' 


    context 'when format is JSON' do
      it 'returns the JSON-serialized services for the app' 

    end
  end
end

