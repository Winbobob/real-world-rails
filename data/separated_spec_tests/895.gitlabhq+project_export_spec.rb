require 'spec_helper'

describe API::ProjectExport do
  set(:project) { create(:project) }
  set(:project_none) { create(:project) }
  set(:project_started) { create(:project) }
  let(:project_finished) { create(:project, :with_export) }
  let(:project_after_export) { create(:project, :with_export) }
  set(:user) { create(:user) }
  set(:admin) { create(:admin) }

  let(:path) { "/projects/#{project.id}/export" }
  let(:path_none) { "/projects/#{project_none.id}/export" }
  let(:path_started) { "/projects/#{project_started.id}/export" }
  let(:path_finished) { "/projects/#{project_finished.id}/export" }
  let(:path_after_export) { "/projects/#{project_after_export.id}/export" }

  let(:download_path) { "/projects/#{project.id}/export/download" }
  let(:download_path_none) { "/projects/#{project_none.id}/export/download" }
  let(:download_path_started) { "/projects/#{project_started.id}/export/download" }
  let(:download_path_finished) { "/projects/#{project_finished.id}/export/download" }
  let(:download_path_export_action) { "/projects/#{project_after_export.id}/export/download" }

  let(:export_path) { "#{Dir.tmpdir}/project_export_spec" }

  before do
    allow_any_instance_of(Gitlab::ImportExport).to receive(:storage_path).and_return(export_path)

    # simulate exporting work directory
    FileUtils.mkdir_p File.join(project_started.export_path, 'securerandom-hex')

    # simulate in after export action
    FileUtils.touch Gitlab::ImportExport::AfterExportStrategies::BaseAfterExportStrategy.lock_file_path(project_after_export)
  end

  after do
    FileUtils.rm_rf(export_path, secure: true)
  end

  shared_examples_for 'when project export is disabled' do
    before do
      stub_application_setting(project_export_enabled?: false)
    end

    it_behaves_like '404 response'
  end

  describe 'GET /projects/:project_id/export' do
    shared_examples_for 'get project export status not found' do
      it_behaves_like '404 response' do
        let(:request) { get api(path, user) }
      end
    end

    shared_examples_for 'get project export status denied' do
      it_behaves_like '403 response' do
        let(:request) { get api(path, user) }
      end
    end

    shared_examples_for 'get project export status ok' do
      it 'is none' 


      it 'is started' 


      it 'is after_export' 


      it 'is finished' 

    end

    it_behaves_like 'when project export is disabled' do
      let(:request) { get api(path, admin) }
    end

    context 'when project export is enabled' do
      context 'when user is an admin' do
        let(:user) { admin }

        it_behaves_like 'get project export status ok'
      end

      context 'when user is a maintainer' do
        before do
          project.add_maintainer(user)
          project_none.add_maintainer(user)
          project_started.add_maintainer(user)
          project_finished.add_maintainer(user)
          project_after_export.add_maintainer(user)
        end

        it_behaves_like 'get project export status ok'
      end

      context 'when user is a developer' do
        before do
          project.add_developer(user)
        end

        it_behaves_like 'get project export status denied'
      end

      context 'when user is a reporter' do
        before do
          project.add_reporter(user)
        end

        it_behaves_like 'get project export status denied'
      end

      context 'when user is a guest' do
        before do
          project.add_guest(user)
        end

        it_behaves_like 'get project export status denied'
      end

      context 'when user is not a member' do
        it_behaves_like 'get project export status not found'
      end
    end
  end

  describe 'GET /projects/:project_id/export/download' do
    shared_examples_for 'get project export download not found' do
      it_behaves_like '404 response' do
        let(:request) { get api(download_path, user) }
      end
    end

    shared_examples_for 'get project export download denied' do
      it_behaves_like '403 response' do
        let(:request) { get api(download_path, user) }
      end
    end

    shared_examples_for 'get project export download' do
      it_behaves_like '404 response' do
        let(:request) { get api(download_path_none, user) }
      end

      it_behaves_like '404 response' do
        let(:request) { get api(download_path_started, user) }
      end

      it 'downloads' 

    end

    shared_examples_for 'get project export upload after action' do
      context 'and is uploading' do
        it 'downloads' 

      end

      context 'when upload complete' do
        before do
          project_after_export.remove_exports
        end

        it 'has removed the export' 


        it_behaves_like '404 response' do
          let(:request) { get api(download_path_export_action, user) }
        end
      end
    end

    shared_examples_for 'get project download by strategy' do
      context 'when upload strategy set' do
        it_behaves_like 'get project export upload after action'
      end

      context 'when download strategy set' do
        it_behaves_like 'get project export download'
      end
    end

    it_behaves_like 'when project export is disabled' do
      let(:request) { get api(download_path, admin) }
    end

    context 'when project export is enabled' do
      context 'when user is an admin' do
        let(:user) { admin }

        it_behaves_like 'get project download by strategy'
      end

      context 'when user is a maintainer' do
        before do
          project.add_maintainer(user)
          project_none.add_maintainer(user)
          project_started.add_maintainer(user)
          project_finished.add_maintainer(user)
          project_after_export.add_maintainer(user)
        end

        it_behaves_like 'get project download by strategy'
      end

      context 'when user is a developer' do
        before do
          project.add_developer(user)
        end

        it_behaves_like 'get project export download denied'
      end

      context 'when user is a reporter' do
        before do
          project.add_reporter(user)
        end

        it_behaves_like 'get project export download denied'
      end

      context 'when user is a guest' do
        before do
          project.add_guest(user)
        end

        it_behaves_like 'get project export download denied'
      end

      context 'when user is not a member' do
        it_behaves_like 'get project export download not found'
      end
    end

    context 'when an uploader is used' do
      before do
        stub_uploads_object_storage(ImportExportUploader)

        project.add_maintainer(user)
        project_finished.add_maintainer(user)
        project_after_export.add_maintainer(user)

        upload = ImportExportUpload.new(project: project)
        upload.export_file = fixture_file_upload('spec/fixtures/project_export.tar.gz', "`/tar.gz")
        upload.save!
      end

      it_behaves_like 'get project download by strategy'
    end
  end

  describe 'POST /projects/:project_id/export' do
    shared_examples_for 'post project export start not found' do
      it_behaves_like '404 response' do
        let(:request) { post api(path, user) }
      end
    end

    shared_examples_for 'post project export start denied' do
      it_behaves_like '403 response' do
        let(:request) { post api(path, user) }
      end
    end

    shared_examples_for 'post project export start' do
      context 'with upload strategy' do
        context 'when params invalid' do
          it_behaves_like '400 response' do
            let(:request) { post(api(path, user), 'upload[url]' => 'whatever') }
          end
        end

        it 'starts' 

      end

      context 'with download strategy' do
        it 'starts' 

      end
    end

    it_behaves_like 'when project export is disabled' do
      let(:request) { post api(path, admin) }
    end

    context 'when project export is enabled' do
      context 'when user is an admin' do
        let(:user) { admin }

        it_behaves_like 'post project export start'
      end

      context 'when user is a maintainer' do
        before do
          project.add_maintainer(user)
          project_none.add_maintainer(user)
          project_started.add_maintainer(user)
          project_finished.add_maintainer(user)
          project_after_export.add_maintainer(user)
        end

        it_behaves_like 'post project export start'
      end

      context 'when user is a developer' do
        before do
          project.add_developer(user)
        end

        it_behaves_like 'post project export start denied'
      end

      context 'when user is a reporter' do
        before do
          project.add_reporter(user)
        end

        it_behaves_like 'post project export start denied'
      end

      context 'when user is a guest' do
        before do
          project.add_guest(user)
        end

        it_behaves_like 'post project export start denied'
      end

      context 'when user is not a member' do
        it_behaves_like 'post project export start not found'
      end

      context 'when overriding description' do
        it 'starts' 

      end
    end
  end
end
