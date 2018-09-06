require 'spec_helper'

describe DocumentsController do
  let(:user) { @user }
  let(:document) { @document }
  let(:valid_attributes) { {
      'title' => 'MyString',
      'body' => 'MyText',
      'user_id' => "#{user.id}"
  } }
  let(:valid_session) { {} }
  let(:categories) do 
    [
    FactoryBot.create(:document, id: 555, project_id: document.project_id, parent_id: nil, title: "Title-1"),
    FactoryBot.create(:document, id: 556, project_id: document.project_id, parent_id: nil, title: "Title-2")
    ]
  end
  let(:params) { {:id => categories.first.to_param, project_id: document.project.friendly_id, categories: 'true'} }

  before(:each) do
    @user = FactoryBot.create(:user)
    request.env['warden'].stub :authenticate! => user
    controller.stub :current_user => user
    @document = FactoryBot.create(:document)
    allow(@document).to receive(:create_activity)
  end

  it 'should raise an error if no project was found' 


  describe 'GET show' do

    context 'with a single project' do
      before(:each) do
        get :show, params: {:id => document.to_param, project_id: document.project.friendly_id}.merge(valid_session)
      end

      it 'assigns the requested document as @document' 


      it 'renders the show template' 

    end

    context 'with more than one project' do
      before(:each) do
        @document_2 = FactoryBot.create(:document)
      end

      it 'should not mistakenly render the document under the wrong project' 

    end
  end

  describe 'get_doc_categories' do
    context 'it has categories to show' do
      it 'renders the categories partial' 


      it 'assigns the available categories to @categories' 

    end
  end

  describe 'PUT update_document_parent_id/' do
    let(:do_post) { post :update_parent_id, params: params.merge({ new_parent_id: parent_id }) }
    let(:current_document) { Document.find_by_id(categories.first.id) }

    context 'with a valid parent id' do
      let(:parent) { Document.find_by_id(categories.last.id) }
      let(:parent_id) { parent.id.to_s }

      it 'changes the document parent id' 


      it 'assigns flash message after changing parent_id' 

    end

    context 'with an invalid parent id' do
      let(:parent_id) { 'invalid_id' }

      it 'does not change the document parent id' 


      it 'renders a flash error message' 

    end
  end

  describe 'GET new' do
    before(:each) { get :new, params: { project_id: document.project.friendly_id}.merge(valid_session) }

    it 'assigns a new document as @document' 


    it 'renders the new template' 


  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Document' 


      it 'assigns a newly created document as @document' 


      it 'redirects to the created document' 


      it 'creates a document create activity' 

    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved document as @document' 


      it 're-renders the new template' 

    end
  end

  describe 'DELETE destroy' do
    before(:each) { @document = FactoryBot.create(:document) }

    it 'destroys the requested document' 


    it 'redirects to the documents list' 

  end

  describe 'POST mercury_update' do
    before(:each) do
      Document.stub_chain(:friendly, :find)
        .with(@document.friendly_id).and_return(document)
    end

    context 'with valid params' do
      let(:params) do
        {
          project_id: @document.project.friendly_id,
          document_id: @document.friendly_id,
          content: {
            document_title: { value: 'my title' },
            document_body: { value: 'document body' }
          }
        }
      end

      before(:each) do
        allow(document).to receive(:create_activity)
        allow(document).to receive(:update_attributes)
          .and_return(true)
      end

      it 'should render an empty string' 


      it 'should update the document with the new title and body' 


      it 'should create a document update activity' 

    end
  end
end

