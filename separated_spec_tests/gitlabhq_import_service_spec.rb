require 'spec_helper'

describe Projects::ImportService do
  let!(:project) { create(:project) }
  let(:user) { project.creator }

  subject { described_class.new(project, user) }

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

    end

    context 'with known url' do
      before do
        project.import_url = 'https://github.com/vim/vim.git'
        project.import_type = 'github'
      end

      context 'with a Github repository' do
        it 'succeeds if repository import was scheduled' 


        it 'fails if repository import was not scheduled' 

      end

      context 'with a non Github repository' do
        before do
          project.import_url = 'https://bitbucket.org/vim/vim.git'
          project.import_type = 'bitbucket'
        end

        it 'succeeds if repository import is successfully' 


        it 'fails if repository import fails' 

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

