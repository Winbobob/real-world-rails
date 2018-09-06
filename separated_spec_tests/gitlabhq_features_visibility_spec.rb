require 'spec_helper'

describe 'Edit Project Settings' do
  let(:member) { create(:user) }
  let!(:project) { create(:project, :public, :repository) }
  let!(:issue) { create(:issue, project: project) }
  let(:non_member) { create(:user) }

  describe 'project features visibility selectors', :js do
    before do
      project.add_master(member)
      sign_in(member)
    end

    tools = { builds: "pipelines", issues: "issues", wiki: "wiki", snippets: "snippets", merge_requests: "merge_requests" }

    tools.each do |tool_name, shortcut_name|
      describe "feature #{tool_name}" do
        it 'toggles visibility' 

      end
    end

    context 'When external issue tracker is enabled and issues enabled on project settings' do
      it 'does not hide issues tab' 

    end

    context 'When external issue tracker is enabled and issues disabled on project settings' do
      it 'hides issues tab' 

    end

    context "pipelines subtabs" do
      it "shows builds when enabled" 


      it "hides builds when disabled" 

    end
  end

  describe 'project features visibility pages' do
    let(:pipeline) { create(:ci_empty_pipeline, project: project) }
    let(:job) { create(:ci_build, pipeline: pipeline) }

    let(:tools) do
      {
        builds: project_job_path(project, job),
        issues: project_issues_path(project),
        wiki: project_wiki_path(project, :home),
        snippets: project_snippets_path(project),
        merge_requests: project_merge_requests_path(project)
      }
    end

    context 'normal user' do
      before do
        sign_in(member)
      end

      it 'renders 200 if tool is enabled' 


      it 'renders 404 if feature is disabled' 


      it 'renders 404 if feature is enabled only for team members' 


      it 'renders 200 if user is member of group' 

    end

    context 'admin user' do
      before do
        non_member.update_attribute(:admin, true)
        sign_in(non_member)
      end

      it 'renders 404 if feature is disabled' 


      it 'renders 200 if feature is enabled only for team members' 

    end
  end

  describe 'repository visibility', :js do
    before do
      project.add_master(member)
      sign_in(member)
      visit edit_project_path(project)
    end

    it "disables repository related features" 


    it "shows empty features project homepage" 


    it "hides project activity tabs" 


    # Regression spec for https://gitlab.com/gitlab-org/gitlab-ce/issues/25272
    it "hides comments activity tab only on disabled issues, merge requests and repository" 


    def save_changes_and_check_activity_tab
      page.within('.sharing-permissions') do
        click_button "Save changes"
      end
      wait_for_requests

      visit activity_project_path(project)

      page.within(".event-filter") do
        yield
      end
    end
  end

  # Regression spec for https://gitlab.com/gitlab-org/gitlab-ce/issues/24056
  describe 'project statistic visibility' do
    let!(:project) { create(:project, :private) }

    before do
      project.add_guest(member)
      sign_in(member)
      visit project_path(project)
    end

    it "does not show project statistic for guest" 

  end

  def toggle_feature_off(feature_name)
    find(".project-feature-controls[data-for=\"#{feature_name}\"] .project-feature-toggle.is-checked").click
  end

  def toggle_feature_on(feature_name)
    find(".project-feature-controls[data-for=\"#{feature_name}\"] .project-feature-toggle:not(.is-checked)").click
  end
end
