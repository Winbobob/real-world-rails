require 'rails_helper'

describe Administration::ImportsController, type: :controller do
  let(:admin) { FactoryGirl.create(:person, :admin_import_data) }

  describe '#index' do
    let!(:import) { FactoryGirl.create(:import, person: admin) }

    before do
      get :index,
          session: { logged_in_id: admin.id }
    end

    it 'renders the index template' 

  end

  describe '#show' do
    let(:import) { FactoryGirl.create(:import, person: admin) }

    before do
      get :show,
          params: { id: import.id },
          session: { logged_in_id: admin.id }
    end

    it 'renders the show template' 

  end

  describe '#new' do
    before do
      get :new,
          session: { logged_in_id: admin.id }
    end

    it 'renders the new template' 

  end

  describe '#create' do
    let(:file) { fixture_file_upload('files/people.csv', 'text/csv') }

    let!(:previous_import) { FactoryGirl.create(:import, match_strategy: :by_name, mappings: { 'foo' => 'bar' }) }

    before do
      allow_any_instance_of(Import).to receive(:parse_async)
      post :create,
           params: { file: file },
           session: { logged_in_id: admin.id }
    end

    it 'creates a new Import and redirects to it' 


    it 'assigns a filename to the new import' 


    it 'uses the mappings from the previous import' 


    it 'uses the match_strategy from the previous import' 

  end

  describe '#edit' do
    let(:import) { FactoryGirl.create(:import, person: admin) }

    context 'import is pending' do
      before do
        get :edit,
            params: { id: import.id },
            session: { logged_in_id: admin.id }
      end

      it 'renders the edit template' 

    end

    context 'import is parsed' do
      before do
        import.update_attribute(:status, :parsed)
        get :edit,
            params: { id: import.id },
            session: { logged_in_id: admin.id }
      end

      it 'renders the edit template' 

    end
  end

  describe '#update' do
    let(:import) { FactoryGirl.create(:import, person: admin) }

    context do
      before do
        patch :update,
              params: {
                id: import.id,
                import: {
                  match_strategy: 'by_name',
                  mappings: {
                    'foo' => 'bar'
                  },
                  dont_preview: '0'
                }
              },
              session: { logged_in_id: admin.id }
      end

      it 'updates the import settings and redirects to the show page' 

    end

    context 'given dont_preview=1' do
      before do
        allow(Import).to receive(:find).with(import.id.to_s).and_return(import)
        allow(import).to receive(:reset_and_execute_async)
        patch :update,
              params: {
                id: import.id,
                import: {
                  match_strategy: 'by_name',
                  mappings: {
                    'foo' => 'bar'
                  }
                },
                dont_preview: '1'
              },
              session: { logged_in_id: admin.id }
      end

      it 'calls execute_async and redirects to the show page' 

    end
  end

  describe '#destroy' do
    let(:import) { FactoryGirl.create(:import, person: admin) }

    before do
      delete :destroy,
             params: { id: import.id },
             session: { logged_in_id: admin.id }
    end

    it 'destroys the import' 


    it 'redirects to the index' 

  end

  describe '#execute' do
    let(:import) { FactoryGirl.create(:import, person: admin) }

    before do
      allow(Import).to receive(:find).with(import.id.to_s).and_return(import)
      allow(import).to receive(:execute_async)
      patch :execute,
            params: { id: import.id },
            session: { logged_in_id: admin.id }
    end

    it 'executes the import and redirects to the show page' 

  end
end

