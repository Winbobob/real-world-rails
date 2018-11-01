require 'spec_helper'

describe Gitlab::GitlabImport::Client do
  include ImportSpecHelper

  let(:token) { '123456' }
  let(:client) { described_class.new(token) }

  before do
    stub_omniauth_provider('gitlab')
  end

  it 'all OAuth2 client options are symbols' 


  it 'uses membership and simple flags' 


  shared_examples 'pagination params' do
    before do
      allow_any_instance_of(OAuth2::Response).to receive(:parsed).and_return([])
    end

    it 'allows page_limit param' 


    it 'allows per_page param' 


    it 'allows starting_page param' 

  end

  describe '#projects' do
    subject(:method) { :projects }
    let(:args) { [] }
    let(:element_list) { build_list(:project, 2) }

    before do
      stub_request('/api/v4/projects?membership=true&page=1&per_page=1&simple=true')
      stub_request('/api/v4/projects?membership=true&page=2&per_page=1&simple=true')
      stub_request('/api/v4/projects?membership=true&page=1&per_page=2&simple=true')
      stub_request('/api/v4/projects?membership=true&page=3&per_page=100&simple=true')
    end

    it_behaves_like 'pagination params'
  end

  describe '#issues' do
    subject(:method) { :issues }
    let(:args) { [1] }
    let(:element_list) { build_list(:issue, 2) }

    before do
      stub_request('/api/v4/projects/1/issues?page=1&per_page=1')
      stub_request('/api/v4/projects/1/issues?page=2&per_page=1')
      stub_request('/api/v4/projects/1/issues?page=1&per_page=2')
      stub_request('/api/v4/projects/1/issues?page=3&per_page=100')
    end

    it_behaves_like 'pagination params'
  end

  describe '#issue_comments' do
    subject(:method) { :issue_comments }
    let(:args) { [1, 1] }
    let(:element_list) { build_list(:note_on_issue, 2) }

    before do
      stub_request('/api/v4/projects/1/issues/1/notes?page=1&per_page=1')
      stub_request('/api/v4/projects/1/issues/1/notes?page=2&per_page=1')
      stub_request('/api/v4/projects/1/issues/1/notes?page=1&per_page=2')
      stub_request('/api/v4/projects/1/issues/1/notes?page=3&per_page=100')
    end

    it_behaves_like 'pagination params'
  end

  def stub_request(path)
    WebMock.stub_request(:get, "https://gitlab.com#{path}")
      .to_return(status: 200)
  end
end

