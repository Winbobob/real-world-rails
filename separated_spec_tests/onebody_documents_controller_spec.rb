require 'rails_helper'

describe DocumentsController, type: :controller do
  let(:user)        { FactoryGirl.create(:person) }
  let(:file_path)   { Rails.root.join('spec/fixtures/files/attachment.pdf') }
  let(:file_path2)  { Rails.root.join('spec/fixtures/files/image.bmp') }
  let(:file_path3)  { Rails.root.join('spec/fixtures/files/people.csv') }
  let(:file)        { Rack::Test::UploadedFile.new(file_path, 'application/pdf', true) }
  let(:file2)       { Rack::Test::UploadedFile.new(file_path2, 'image/x-ms-bmp', true) }
  let(:file3)       { Rack::Test::UploadedFile.new(file_path3, 'text/plain', true) }

  before do
    Setting.set(:features, :documents, true)
  end

  describe '#index' do
    let!(:top_folder)          { FactoryGirl.create(:document_folder) }
    let!(:top_folder_hidden)   { FactoryGirl.create(:document_folder, hidden: true) }
    let!(:top_document)        { FactoryGirl.create(:document, :with_fake_file) }
    let!(:child_folder)        { FactoryGirl.create(:document_folder, folder_id: top_folder.id) }
    let!(:child_folder_hidden) { FactoryGirl.create(:document_folder, folder_id: top_folder.id, hidden: true) }
    let!(:child_document)      { FactoryGirl.create(:document, :with_fake_file, folder_id: top_folder.id) }

    context 'user is not an admin' do
      context 'at top level' do
        before do
          get :index,
              session: { logged_in_id: user.id }
        end

        it 'lists active (not hidden) folders' 


        it 'lists documents' 

      end

      context 'at top level with a group-only folder' do
        let!(:group)            { FactoryGirl.create(:group) }
        let!(:folder_for_group) { FactoryGirl.create(:document_folder, group_ids: [group.id]) }

        context 'user is not a member of the group' do
          before do
            get :index,
                session: { logged_in_id: user.id }
          end

          it 'does not list the folder' 

        end

        context 'user is a member of the group' do
          let!(:membership) { group.memberships.create!(person: user) }

          before do
            get :index,
                params: { restricted_folders: 'true' },
                session: { logged_in_id: user.id }
          end

          it 'lists the folder' 

        end
      end

      context 'viewing a folder' do
        before do
          get :index,
              params: { folder_id: top_folder.id },
              session: { logged_in_id: user.id }
        end

        it 'lists active (not hidden) folders' 


        it 'lists documents' 

      end

      context 'viewing a hidden folder' do
        it 'returns a 404' 

      end

      context 'viewing a folder for a group the user is not a member of' do
        let!(:group)            { FactoryGirl.create(:group) }
        let!(:folder_for_group) { FactoryGirl.create(:document_folder, group_ids: [group.id]) }

        it 'returns a 404' 

      end

      context 'viewing a folder for a group the user is a member of' do
        let!(:group)            { FactoryGirl.create(:group) }
        let!(:folder_for_group) { FactoryGirl.create(:document_folder, group_ids: [group.id]) }
        let!(:membership)       { group.memberships.create!(person: user) }

        it 'returns 200 and shows the template' 

      end
    end

    context 'user is an admin' do
      before do
        user.admin = Admin.create(manage_documents: true)
        user.save!
      end

      context 'at top level' do
        before do
          get :index,
              params: { hidden_folders: 'true' },
              session: { logged_in_id: user.id }
        end

        it 'lists all folders' 

      end

      context 'viewing a folder' do
        before do
          get :index,
              params: { folder_id: top_folder.id, hidden_folders: 'true' },
              session: { logged_in_id: user.id }
        end

        it 'lists all folders' 

      end
    end
  end

  describe '#show' do
    let(:document) { FactoryGirl.create(:document, :with_fake_file) }

    context 'user is not an admin' do
      context 'document is not in a hidden folder' do
        before do
          get :show,
              params: { id: document.id },
              session: { logged_in_id: user.id }
        end

        it 'gets the document' 


        it 'renders the show template' 

      end

      context 'document is in a hidden folder' do
        before do
          document.folder = FactoryGirl.create(:document_folder, hidden: true)
          document.save!
        end

        it 'returns a 404' 

      end

      context 'document is in a folder for a group' do
        let!(:group)            { FactoryGirl.create(:group) }
        let!(:folder_for_group) { FactoryGirl.create(:document_folder, group_ids: [group.id]) }

        before do
          document.folder = folder_for_group
          document.save!
        end

        context 'user is not a member of the group' do
          it 'returns a 404' 

        end

        context 'user is a member of the group' do
          let!(:membership) { group.memberships.create!(person: user) }

          it 'returns a 200 and renders the page' 

        end
      end
    end

    context 'user an admin' do
      before do
        user.admin = Admin.create(manage_documents: true)
        user.save!
      end

      context 'document is not in a hidden folder' do
        before do
          get :show,
              params: { id: document.id },
              session: { logged_in_id: user.id }
        end

        it 'gets the document' 


        it 'renders the show template' 

      end

      context 'document is in a hidden folder' do
        before do
          document.folder = FactoryGirl.create(:document_folder, hidden: true)
          document.save!
          get :show,
              params: { id: document.id },
              session: { logged_in_id: user.id }
        end

        it 'gets the document' 


        it 'renders the show template' 

      end
    end
  end

  describe '#new' do
    context 'user is an admin' do
      before do
        user.admin = Admin.create(manage_documents: true)
        user.save!
      end

      context 'new folder' do
        context 'at top level' do
          before do
            get :new,
                params: { folder: true },
                session: { logged_in_id: user.id }
          end

          it 'builds a new folder' 


          it 'renders new_folder template' 

        end

        context 'inside a folder' do
          let(:top_folder) { FactoryGirl.create(:document_folder) }

          before do
            get :new,
                params: { folder: true, folder_id: top_folder.id },
                session: { logged_in_id: user.id }
          end

          it 'associates the folder with the parent folder' 

        end
      end

      context 'new document' do
        context 'at top level' do
          before do
            get :new,
                session: { logged_in_id: user.id }
          end

          it 'builds a new document' 


          it 'renders new template' 

        end

        context 'inside a folder' do
          let(:top_folder) { FactoryGirl.create(:document_folder) }

          before do
            get :new,
                params: { folder_id: top_folder.id },
                session: { logged_in_id: user.id }
          end

          it 'associates the document with the parent folder' 

        end

        context 'multiple documents' do
          before do
            get :new,
                params: { multiple_documents: true },
                session: { logged_in_id: user.id }
          end

          it 'builds a new document' 


          it 'renders new template' 

        end
      end
    end
  end

  describe '#create' do
    context 'user is an admin' do
      before do
        user.admin = Admin.create(manage_documents: true)
        user.save!
      end

      context 'new folder' do
        context 'at top level' do
          context 'given proper params' do
            before do
              post :create,
                   params: {
                     folder: {
                       name: 'Test Folder',
                       description: 'description of folder'
                     }
                   },
                   session: { logged_in_id: user.id }
            end

            it 'creates a new folder' 


            it 'redirects to the folder' 


            it 'sets a flash notice' 

          end

          context 'given missing params' do
            render_views

            before do
              post :create,
                   params: { folder: { description: 'description of folder' } },
                   session: { logged_in_id: user.id }
            end

            it 'renders the new_folder template, showing the errors' 

          end
        end

        context 'inside a folder' do
          let(:top_folder) { FactoryGirl.create(:document_folder) }

          context 'given proper params' do
            before do
              post :create,
                   params: {
                     folder: {
                       folder_id: top_folder.id,
                       name: 'Child Folder',
                       description: 'description of folder'
                     }
                   },
                   session: { logged_in_id: user.id }
            end

            it 'associates parent folder' 

          end
        end

        context 'given group_ids param' do
          let(:group) { FactoryGirl.create(:group) }

          before do
            post :create,
                 params: {
                   folder: {
                     name: 'Test Folder',
                     description: 'description of folder',
                     group_ids: [group.id]
                   }
                 },
                 session: { logged_in_id: user.id }
            @folder = DocumentFolder.last
          end

          it 'creates associated DocumentFolderGroup records' 

        end
      end

      context 'new documents' do
        context 'given proper params' do
          before do
            post :create,
                 params: {
                   document: {
                     name:        ['Test Document', 'Test Presentation', 'Test Program'],
                     description: ['description of document', 'description of presentation', 'description of virus'],
                     file:        [file, file2, file3]
                   }
                 },
                 session: { logged_in_id: user.id }
          end

          it 'creates a new document' 


          it 'attaches the files' 


          it 'redirects to the documents folder' 


          it 'sets a flash notice' 

        end
      end
    end
  end

  describe '#edit' do
    context 'user is an admin' do
      before do
        user.admin = Admin.create(manage_documents: true)
        user.save!
      end

      context 'document' do
        before do
          @document = FactoryGirl.create(:document, :with_fake_file)
          get :edit,
              params: { id: @document.id },
              session: { logged_in_id: user.id }
        end

        it 'renders the edit template' 

      end

      context 'folder' do
        before do
          @folder = FactoryGirl.create(:document_folder)
          get :edit,
              params: { id: @folder.id, folder: true },
              session: { logged_in_id: user.id }
        end

        it 'renders the edit_folder template' 

      end
    end
  end

  describe '#update' do
    context 'user is an admin' do
      before do
        user.admin = Admin.create(manage_documents: true)
        user.save!
      end

      context 'document' do
        before do
          @document = FactoryGirl.create(:document, :with_fake_file)
        end

        context 'updating name' do
          before do
            put :update,
                params: { id: @document.id, document: { name: 'New Name' } },
                session: { logged_in_id: user.id }
          end

          it 'updates the document' 


          it 'redirects to the document' 

        end

        context 'changing parent folder' do
          before do
            @folder = FactoryGirl.create(:document_folder)
            put :update,
                params: { id: @document.id, document: { folder_id: @folder.id } },
                session: { logged_in_id: user.id }
          end

          it 'updates the document folder' 


          it 'redirects to the document' 

        end
      end

      context 'folder' do
        before do
          @folder = FactoryGirl.create(:document_folder)
        end

        context 'given proper params' do
          before do
            put :update,
                params: { id: @folder.id, folder: { name: 'New Name' } },
                session: { logged_in_id: user.id }
          end

          it 'updates the folder' 


          it 'redirects to the parent folder with a notice' 

        end

        context 'given invalid params' do
          render_views

          before do
            put :update,
                params: { id: @folder.id, folder: { name: 'x' * 500 } },
                session: { logged_in_id: user.id }
          end

          it 'renders the edit_folder template' 


          it 'shows errors' 

        end

        context 'given group_ids param' do
          let(:group) { FactoryGirl.create(:group) }

          before do
            put :update,
                params: {
                  id: @folder.id,
                  folder: {
                    name: 'Foo',
                    group_ids: [group.id]
                  }
                },
                session: { logged_in_id: user.id }
          end

          it 'creates associated DocumentFolderGroup records' 

        end
      end
    end
  end

  describe '#destroy' do
    context 'user is an admin' do
      before do
        user.admin = Admin.create(manage_documents: true)
        user.save!
      end

      context 'document' do
        let(:document) { FactoryGirl.create(:document, :with_fake_file) }

        before do
          delete :destroy,
                 params: { id: document.id },
                 session: { logged_in_id: user.id }
        end

        it 'deletes the document' 


        it 'redirects to the parent folder with a notice' 

      end

      context 'folder' do
        let!(:folder)         { FactoryGirl.create(:document_folder) }
        let!(:child_folder)   { FactoryGirl.create(:document_folder, folder_id: folder.id) }
        let!(:child_document) { FactoryGirl.create(:document, :with_fake_file, folder_id: folder.id) }

        before do
          delete :destroy,
                 params: { id: folder.id, folder: true },
                 session: { logged_in_id: user.id }
        end

        it 'deletes the folder' 


        it 'deletes all children' 


        it 'redirects to the parent folder with a notice' 

      end
    end
  end

  describe '#download' do
    let(:document) { FactoryGirl.create(:document, :with_fake_file) }

    before do
      document.file = file
      document.save
    end

    context 'user is not an admin' do
      context 'document is not in a hidden folder' do
        before do
          get :download,
              params: { id: document.id },
              session: { logged_in_id: user.id }
        end

        it 'returns the file data' 


        it 'sets the content type' 


        it 'sets the download filename' 

      end

      context 'document is in a hidden folder' do
        before do
          document.folder = FactoryGirl.create(:document_folder, hidden: true)
          document.save!
        end

        it 'returns a 404' 

      end

      context 'document is in a folder for a group' do
        let!(:group)            { FactoryGirl.create(:group) }
        let!(:folder_for_group) { FactoryGirl.create(:document_folder, group_ids: [group.id]) }

        before do
          document.folder = folder_for_group
          document.save!
        end

        context 'user is not a member of the group' do
          it 'returns a 404' 

        end

        context 'user is a member of the group' do
          let!(:membership) { group.memberships.create!(person: user) }

          it 'returns a 200' 

        end
      end
    end

    context 'user is an admin' do
      before do
        user.admin = Admin.create(manage_documents: true)
        user.save!
      end

      context 'document is not in a hidden folder' do
        before do
          get :download,
              params: { id: document.id },
              session: { logged_in_id: user.id }
        end

        it 'returns the file data' 

      end

      context 'document is in a hidden folder' do
        before do
          document.folder = FactoryGirl.create(:document_folder, hidden: true)
          document.save!
          get :download,
              params: { id: document.id },
              session: { logged_in_id: user.id }
        end

        it 'returns the file data' 

      end
    end
  end
end

