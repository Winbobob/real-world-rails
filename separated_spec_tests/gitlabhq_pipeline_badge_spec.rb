require 'spec_helper'

feature 'Pipeline Badge' do
  set(:project) { create(:project, :repository, :public) }
  let(:ref) { project.default_branch }

  # this can't be tested in the controller, as it bypasses the rails router
  # and constructs a route based on the controller being tested
  # Keep around until 10.0, see gitlab-org/gitlab-ce#35307
  context 'when the deprecated badge is requested' do
    it 'displays the badge' 

  end

  context 'when the project has a pipeline' do
    let!(:pipeline) { create(:ci_empty_pipeline, project: project, ref: ref, sha: project.commit(ref).sha) }
    let!(:job) { create(:ci_build, pipeline: pipeline) }

    context 'when the pipeline was successfull' do
      it 'displays so on the badge' 

    end

    context 'when the pipeline failed' do
      it 'shows displays so on the badge' 

    end

    context 'when the pipeline is running' do
      it 'shows displays so on the badge' 

    end

    context 'when a new pipeline is created' do
      it 'shows a fresh badge' 

    end

    def expect_badge(status)
      svg = Nokogiri::XML.parse(page.body)
      expect(page.response_headers['Content-Type']).to include('image/svg+xml')
      expect(svg.at(%Q{text:contains("#{status}")})).to be_truthy
    end
  end
end

