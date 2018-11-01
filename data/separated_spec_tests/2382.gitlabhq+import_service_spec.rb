require 'spec_helper'

describe Projects::ImportService do
  let!(:project) { create(:project) }
  let(:user) { project.creator }
  let(:import_url) { 'http://www.gitlab.com/demo/repo.git' }
  let(:oid_download_links) { { 'oid1' => "#{import_url}/gitlab-lfs/objects/oid1", 'oid2' => "#{import_url}/gitlab-lfs/objects/oid2" } }

  subject { described_class.new(project, user) }

  before do
    allow(project).to receive(:lfs_enabled?).and_return(true)
    allow_any_instance_of(Projects::LfsPointers::LfsDownloadService).to receive(:execute)
    allow_any_instance_of(Projects::LfsPointers::LfsImportService).to receive(:execute).and_return(oid_download_links)
  end

  describe '#async?' do
    it 'returns true for an asynchronous importer' 


    it 'returns false for a regular importer' 


    it 'returns false when the importer does not define #async?' 


    it 'returns false when the importer does not exist' 

  end

  describe '#execute' do
    context 'with unknown url' do
      before do
        project.import_url = Project::UNKNOWN_IMPORT_URL
      end

      it 'succeeds if repository is created successfully' 


      it 'fails if repository creation fails' 


      context 'when repository creation succeeds' do
        it 'does not download lfs files' 

      end
    end

    context 'with known url' do
      before do
        project.import_url = 'https://github.com/vim/vim.git'
        project.import_type = 'github'
      end

      context 'with a Github repository' do
        it 'succeeds if repository import was scheduled' 


        it 'fails if repository import was not scheduled' 


        context 'when repository import scheduled' do
          it 'does not download lfs objects' 

        end
      end

      context 'with a non Github repository' do
        before do
          project.import_url = 'https://bitbucket.org/vim/vim.git'
          project.import_type = 'bitbucket'
        end

        it 'succeeds if repository import is successfull' 


        it 'fails if repository import fails' 


        context 'when repository import scheduled' do
          before do
            allow_any_instance_of(Gitlab::Shell).to receive(:import_repository).and_return(true)
            allow(subject).to receive(:import_data)
          end

          it 'downloads lfs objects if lfs_enabled is enabled for project' 


          it 'does not download lfs objects if lfs_enabled is not enabled for project' 

        end
      end
    end

    context 'with valid importer' do
      before do
        stub_github_omniauth_provider

        project.import_url = 'https://github.com/vim/vim.git'
        project.import_type = 'github'

        allow(project).to receive(:import_data).and_return(double.as_null_object)
      end

      it 'succeeds if importer succeeds' 


      it 'fails if importer fails' 


      context 'when importer' do
        it 'has a custom repository importer it does not download lfs objects' 


        it 'does not have a custom repository importer downloads lfs objects' 

      end
    end

    context 'with blocked import_URL' do
      it 'fails with localhost' 


      it 'fails with port 25' 

    end

    def stub_github_omniauth_provider
      provider = OpenStruct.new(
        'name' => 'github',
        'app_id' => 'asd123',
        'app_secret' => 'asd123',
        'args' => {
          'client_options' => {
            'site' => 'https://github.com/api/v3',
            'authorize_url' => 'https://github.com/login/oauth/authorize',
            'token_url' => 'https://github.com/login/oauth/access_token'
          }
        }
      )

      stub_omniauth_setting(providers: [provider])
    end
  end
end

