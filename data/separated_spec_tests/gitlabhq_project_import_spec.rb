require 'spec_helper'

describe API::ProjectImport do
  let(:export_path) { "#{Dir.tmpdir}/project_export_spec" }
  let(:user) { create(:user) }
  let(:file) { File.join(Rails.root, 'spec', 'features', 'projects', 'import_export', 'test_project_export.tar.gz') }
  let(:namespace) { create(:group) }
  before do
    allow_any_instance_of(Gitlab::ImportExport).to receive(:storage_path).and_return(export_path)

    namespace.add_owner(user)
  end

  after do
    FileUtils.rm_rf(export_path, secure: true)
  end

  describe 'POST /projects/import' do
    it 'schedules an import using a namespace' 


    it 'schedules an import using the namespace path' 


    it 'schedules an import at the user namespace level' 


    it 'does not shedule an import for a nampespace that does not exist' 


    it 'does not schedule an import if the user has no permission to the namespace' 


    it 'does not schedule an import if the user uploads no valid file' 


    it 'stores params that can be overridden' 


    it 'does not store params that are not allowed' 


    it 'correctly overrides params during the import' 


    context 'when target path already exists in namespace' do
      let(:existing_project) { create(:project, namespace: user.namespace) }

      it 'does not schedule an import' 


      context 'when param overwrite is true' do
        it 'schedules an import' 

      end
    end

    def stub_import(namespace)
      expect_any_instance_of(Project).to receive(:import_schedule)
      expect(::Projects::CreateService).to receive(:new).with(user, hash_including(namespace_id: namespace.id)).and_call_original
    end
  end

  describe 'GET /projects/:id/import' do
    it 'returns the import status' 


    it 'returns the import status and the error if failed' 

  end
end

