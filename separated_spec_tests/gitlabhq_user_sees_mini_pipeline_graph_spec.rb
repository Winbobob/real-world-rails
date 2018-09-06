require 'rails_helper'

describe 'Merge request < User sees mini pipeline graph', :js do
  let(:project) { create(:project, :public, :repository) }
  let(:user) { project.creator }
  let(:merge_request) { create(:merge_request, source_project: project, head_pipeline: pipeline) }
  let(:pipeline) { create(:ci_empty_pipeline, project: project, ref: 'master', status: 'running', sha: project.commit.id) }
  let(:build) { create(:ci_build, pipeline: pipeline, stage: 'test', commands: 'test') }

  before do
    build.run
    build.trace.set('hello')
    sign_in(user)
    visit_merge_request
  end

  def visit_merge_request(format: :html, serializer: nil)
    visit project_merge_request_path(project, merge_request, format: format, serializer: serializer)
  end

  it 'displays a mini pipeline graph' 


  context 'as json' do
    let(:artifacts_file1) { fixture_file_upload(Rails.root.join('spec/fixtures/banana_sample.gif'), 'image/gif') }
    let(:artifacts_file2) { fixture_file_upload(Rails.root.join('spec/fixtures/dk.png'), 'image/png') }

    before do
      create(:ci_build, :success, :trace_artifact, pipeline: pipeline, legacy_artifacts_file: artifacts_file1)
      create(:ci_build, :manual, pipeline: pipeline, when: 'manual')
    end

    it 'avoids repeated database queries' 

  end

  describe 'build list toggle' do
    let(:toggle) do
      find('.mini-pipeline-graph-dropdown-toggle')
      first('.mini-pipeline-graph-dropdown-toggle')
    end

    it 'expands when hovered' 


    it 'shows dropdown caret when hovered' 


    it 'shows tooltip when hovered' 

  end

  describe 'builds list menu' do
    let(:toggle) do
      find('.mini-pipeline-graph-dropdown-toggle')
      first('.mini-pipeline-graph-dropdown-toggle')
    end

    before do
      toggle.click
      wait_for_requests
    end

    it 'pens when toggle is clicked' 


    it 'closes when toggle is clicked again' 


    it 'closes when clicking somewhere else' 


    describe 'build list build item' do
      let(:build_item) do
        find('.mini-pipeline-graph-dropdown-item')
        first('.mini-pipeline-graph-dropdown-item')
      end

      it 'visits the build page when clicked' 


      it 'shows tooltip when hovered' 

    end
  end
end

