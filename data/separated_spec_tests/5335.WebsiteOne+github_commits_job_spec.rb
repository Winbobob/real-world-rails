require 'spec_helper'

describe GithubCommitsJob do
  vcr_index = { cassette_name: 'github_commit_count/websiteone_stats' }

  describe '.job', vcr: vcr_index do
    context 'when no empty repo present' do
      let(:project) { @project.reload }
      let(:project_without_url) { @project_without_url.reload }
      before do
        @project = FactoryBot.create(:project)
        @project_without_url = FactoryBot.create(:project)
        @project.source_repositories.create(url: 'https://github.com/AgileVentures/WebsiteOne')
        @users_with_github_profile_urls = [
          FactoryBot.create(:user, github_profile_url: 'https://github.com/tochman'),
        ]
        @users_without_github_profile_urls = [
          FactoryBot.create(:user, github_profile_url: nil)
        ]
        @users = @users_with_github_profile_urls + @users_without_github_profile_urls
        GithubCommitsJob.run
      end
  
      it 'stores commit counts only for projects that have a github_url' 

  
      it 'stores total commit count only for projects that have a github_url' 

  
      it 'stores commit counts only for users that have a github_profile_url' 

  
      it 'stores correct commit counts by user and project' 

  
      it 'stores correct total commit count for projects' 

  
      it 'stores last_commit_at only for projects that have a github_url' 

  
      it 'executes user_commits method even if total_commits dies for project' 

    end
    
    context 'when empty project is present' do
      let(:project_with_empty_repo) { @project_with_empty_repo.reload }
      
      before do
        @project_with_empty_repo = FactoryBot.create(:project, github_url: 'https://github.com/AgileVentures/empty_project')
        GithubCommitsJob.run
      end
      
      it 'stores commit count for project with epmty repo' 

      
      it 'stores total commit count for project with epmty repo' 

    end
  end
end

