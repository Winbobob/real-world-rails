require 'spec_helper'

describe CommitEntity do
  let(:entity) do
    described_class.new(commit, request: request)
  end

  let(:request) { double('request') }
  let(:project) { create(:project, :repository) }
  let(:commit) { project.commit }

  subject { entity.as_json }

  before do
    allow(request).to receive(:project).and_return(project)
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

end

