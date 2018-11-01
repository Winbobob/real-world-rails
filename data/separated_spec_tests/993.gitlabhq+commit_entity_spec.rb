require 'spec_helper'

describe CommitEntity do
  SIGNATURE_HTML = 'TEST'.freeze

  let(:entity) do
    described_class.new(commit, request: request)
  end
  let(:request) { double('request') }
  let(:project) { create(:project, :repository) }
  let(:commit) { project.commit }

  subject { entity.as_json }

  before do
    render = double('render')
    allow(render).to receive(:call).and_return(SIGNATURE_HTML)

    allow(request).to receive(:project).and_return(project)
    allow(request).to receive(:render).and_return(render)
  end

  context 'when commit author is a user' do
    before do
      create(:user, email: commit.author_email)
    end

    it 'contains information about user' 

  end

  context 'when commit author is not a user' do
    it 'does not contain author details' 

  end

  it 'contains path to commit' 


  it 'contains URL to commit' 


  it 'needs to receive project in the request' 


  it 'exposes gravatar url that belongs to author' 


  context 'when type is not set' do
    it 'does not expose extra properties' 

  end

  context 'when type is "full"' do
    let(:entity) do
      described_class.new(commit, request: request, type: :full, pipeline_ref: project.default_branch, pipeline_project: project)
    end

    it 'exposes extra properties' 


    context 'when commit has signature' do
      let(:commit) { project.commit(TestEnv::BRANCH_SHA['signed-commits']) }

      it 'exposes "signature_html"' 

    end

    context 'when commit has pipeline' do
      before do
        create(:ci_pipeline, project: project, sha: commit.id)
      end

      it 'exposes "pipeline_status_path"' 

    end
  end

  context 'when commit_url_params is set' do
    let(:entity) do
      params = { merge_request_iid: 3 }

      described_class.new(commit, request: request, commit_url_params: params)
    end

    it 'adds commit_url_params to url and path' 

  end
end

