require 'spec_helper'

describe GithubReadmeFilesJob do
  describe '.replace_relative_links_with_absolute' do
    let(:project) { FactoryBot.create(:project, pitch: nil) }
    let(:project_readme_content) { '<a href="hello">hello</a><a href="http://example.com/hello">hello</a><a href="#hello">hello</a>' }

    before do
      project.source_repositories.create(url: 'https://github.com/AgileVentures/LocalSupport')
      @converted_text = subject.replace_relative_links_with_absolute(project_readme_content, project)
    end

    it 'converts all relative urls in text to absolute with full host prefix' 


    it 'does not change absolute links' 


    it 'does not change anchor links' 

  end

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

