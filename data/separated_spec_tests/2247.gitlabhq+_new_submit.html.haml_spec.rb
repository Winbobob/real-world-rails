require 'spec_helper'

describe 'projects/merge_requests/creations/_new_submit.html.haml' do
  let(:merge_request) { create(:merge_request) }
  let!(:pipeline) { create(:ci_empty_pipeline) }

  before do
    controller.prepend_view_path('app/views/projects')

    assign(:merge_request, merge_request)
    assign(:commits, merge_request.commits)
    assign(:hidden_commit_count, 0)
    assign(:total_commit_count, merge_request.commits.count)
    assign(:project, merge_request.target_project)
    assign(:mr_presenter, merge_request.present(current_user: merge_request.author))

    allow(view).to receive(:can?).and_return(true)
    allow(view).to receive(:url_for).and_return('#')
    allow(view).to receive(:current_user).and_return(merge_request.author)
    allow(view).to receive(:current_application_settings).and_return(Gitlab::CurrentSettings.current_application_settings)
  end

  context 'when there are pipelines for merge request but no pipeline for last commit' do
    before do
      assign(:pipelines, Ci::Pipeline.all)
      assign(:pipeline, nil)
    end

    it 'shows <<Pipelines>> tab and hides <<Builds>> tab' 

  end

  context 'when there are hidden commits' do
    before do
      assign(:pipelines, Ci::Pipeline.none)
      assign(:hidden_commit_count, 2)
    end

    it 'shows notice about omitted commits' 

  end
end

