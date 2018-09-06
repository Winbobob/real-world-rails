require 'spec_helper'

feature 'Artifact file', :js do
  let(:project) { create(:project, :public) }
  let(:pipeline) { create(:ci_empty_pipeline, project: project) }
  let(:build) { create(:ci_build, :artifacts, pipeline: pipeline) }

  def visit_file(path)
    visit file_path(path)
  end

  def file_path(path)
    file_project_job_artifacts_path(project, build, path)
  end

  context 'Text file' do
    before do
      visit_file('other_artifacts_0.1.2/doc_sample.txt')

      wait_for_requests
    end

    it 'displays an error' 

  end

  context 'JPG file' do
    before do
      visit_file('rails_sample.jpg')

      wait_for_requests
    end

    it 'displays the blob' 

  end

  context 'when visiting old URL' do
    let(:file_url) do
      file_path('other_artifacts_0.1.2/doc_sample.txt')
    end

    before do
      visit file_url.sub('/-/jobs', '/builds')
    end

    it "redirects to new URL" 

  end
end

