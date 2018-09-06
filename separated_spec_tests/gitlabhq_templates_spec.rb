require 'spec_helper'

describe API::V3::Templates do
  shared_examples_for 'the Template Entity' do |path|
    before { get v3_api(path) }

    it { expect(json_response['name']).to eq('Ruby') }
    it { expect(json_response['content']).to include('*.gem') }
  end

  shared_examples_for 'the TemplateList Entity' do |path|
    before { get v3_api(path) }

    it { expect(json_response.first['name']).not_to be_nil }
    it { expect(json_response.first['content']).to be_nil }
  end

  shared_examples_for 'requesting gitignores' do |path|
    it 'returns a list of available gitignore templates' 

  end

  shared_examples_for 'requesting gitlab-ci-ymls' do |path|
    it 'returns a list of available gitlab_ci_ymls' 

  end

  shared_examples_for 'requesting gitlab-ci-yml for Ruby' do |path|
    it 'adds a disclaimer on the top' 

  end

  shared_examples_for 'the License Template Entity' do |path|
    before { get v3_api(path) }

    it 'returns a license template' 

  end

  shared_examples_for 'GET licenses' do |path|
    it 'returns a list of available license templates' 


    describe 'the popular parameter' do
      context 'with popular=1' do
        it 'returns a list of available popular license templates' 

      end
    end
  end

  shared_examples_for 'GET licenses/:name' do |path|
    context 'with :project and :fullname given' do
      before do
        get v3_api("#{path}/#{license_type}?project=My+Awesome+Project&fullname=Anton+#{license_type.upcase}")
      end

      context 'for the mit license' do
        let(:license_type) { 'mit' }

        it 'returns the license text' 


        it 'replaces placeholder values' 

      end

      context 'for the agpl-3.0 license' do
        let(:license_type) { 'agpl-3.0' }

        it 'returns the license text' 


        it 'replaces placeholder values' 

      end

      context 'for the gpl-3.0 license' do
        let(:license_type) { 'gpl-3.0' }

        it 'returns the license text' 


        it 'replaces placeholder values' 

      end

      context 'for the gpl-2.0 license' do
        let(:license_type) { 'gpl-2.0' }

        it 'returns the license text' 


        it 'replaces placeholder values' 

      end

      context 'for the apache-2.0 license' do
        let(:license_type) { 'apache-2.0' }

        it 'returns the license text' 


        it 'replaces placeholder values' 

      end

      context 'for an uknown license' do
        let(:license_type) { 'muth-over9000' }

        it 'returns a 404' 

      end
    end

    context 'with no :fullname given' do
      context 'with an authenticated user' do
        let(:user) { create(:user) }

        it 'replaces the copyright owner placeholder with the name of the current user' 

      end
    end
  end

  describe 'with /templates namespace' do
    it_behaves_like 'the Template Entity', '/templates/gitignores/Ruby'
    it_behaves_like 'the TemplateList Entity', '/templates/gitignores'
    it_behaves_like 'requesting gitignores', '/templates/gitignores'
    it_behaves_like 'requesting gitlab-ci-ymls', '/templates/gitlab_ci_ymls'
    it_behaves_like 'requesting gitlab-ci-yml for Ruby', '/templates/gitlab_ci_ymls/Ruby'
    it_behaves_like 'the License Template Entity', '/templates/licenses/mit'
    it_behaves_like 'GET licenses', '/templates/licenses'
    it_behaves_like 'GET licenses/:name', '/templates/licenses'
  end

  describe 'without /templates namespace' do
    it_behaves_like 'the Template Entity', '/gitignores/Ruby'
    it_behaves_like 'the TemplateList Entity', '/gitignores'
    it_behaves_like 'requesting gitignores', '/gitignores'
    it_behaves_like 'requesting gitlab-ci-ymls', '/gitlab_ci_ymls'
    it_behaves_like 'requesting gitlab-ci-yml for Ruby', '/gitlab_ci_ymls/Ruby'
    it_behaves_like 'the License Template Entity', '/licenses/mit'
    it_behaves_like 'GET licenses', '/licenses'
    it_behaves_like 'GET licenses/:name', '/licenses'
  end
end

