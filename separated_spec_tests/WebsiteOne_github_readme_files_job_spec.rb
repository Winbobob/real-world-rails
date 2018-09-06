require 'spec_helper'

describe GithubReadmeFilesJob do
  vcr_index = { cassette_name: 'github_readme_pitch/github_readme_pitch' }

  describe '.job using readme', vcr: vcr_index do
    context 'Update pitch on project using the README.md file' do
      before do
        @project = FactoryBot.create(:project, pitch: nil)
        @project.source_repositories.create(url: 'https://github.com/AgileVentures/LocalSupport')
        @projects = Project.with_github_url
      end

      it 'should have no pitch' 


      it 'should have pitch setup with README.md since PITCH.md is not present' 


      it 'should log the error if the repository does NOT exists' 

    end

    context 'Update pitch on project using the PITCH.md file' do
      before do
        @project = FactoryBot.create(:project, pitch: nil)
        @project.source_repositories.create(url: 'https://github.com/nisevi/nisevi')
        @projects = Project.with_github_url
      end

      it 'should have no pitch' 


      it 'should have pitch setup with PITCH.md' 

    end
  end
end

