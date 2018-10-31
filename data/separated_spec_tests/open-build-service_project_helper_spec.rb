require 'rails_helper'

RSpec.describe Webui::ProjectHelper, type: :helper do
  describe '#show_status_comment' do
    skip
  end

  describe '#project_bread_crumb' do
    let(:project) { create(:project_with_package) }

    before do
      @project = project.name
    end

    it 'creates a list with a link to projects list' 


    context "when it's called with a parameter" do
      it 'adds the content of the parameter to the list' 

    end

    context 'when the project has parent projects' do
      let(:child_project) { create(:project_with_package, name: "#{project}:child") }

      before do
        @project = child_project
        @package = project.packages.first.name
      end

      it 'adds a link to the parent projects to the list' 

    end

    context 'when @spider_bot is true' do
      before do
        @spider_bot = true
      end

      it { expect(project_bread_crumb).to be nil }
    end
  end

  describe '#format_seconds' do
    it 'shows a zero for the hour if under 3600 seconds' 


    it 'shows hours and seconds properly' 

  end

  describe '#rebuild_time_col' do
    skip
  end

  describe '#short_incident_name' do
    skip
  end

  describe '#patchinfo_rating_color' do
    it 'returns the right color' 


    it 'returns no color for an inexistent rating' 

  end

  describe '#patchinfo_category_color' do
    it 'returns the right color' 


    it 'returns no color for an inexistent category' 

  end

  describe '#incident_issue_color' do
    it 'returns red if there are no patchinfo issues' 


    it 'returns green if package and patchinfo have the same amount of issues' 


    it 'returns olive if there are more package issues than patchinfo issues' 


    it 'returns red if there are more patchinfo issues than package issues' 

  end

  describe '#map_request_state_to_flag' do
    it 'returns the right flag' 


    it 'returns no flag if passed nothing' 

  end

  describe '#escape_list' do
    it 'html escapes an array of strings' 

  end
end

