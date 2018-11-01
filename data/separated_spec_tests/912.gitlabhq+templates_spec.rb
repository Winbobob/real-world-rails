require 'spec_helper'

describe API::Templates do
  context 'the Template Entity' do
    before do
      get api('/templates/gitignores/Ruby')
    end

    it { expect(json_response['name']).to eq('Ruby') }
    it { expect(json_response['content']).to include('*.gem') }
  end

  context 'the TemplateList Entity' do
    before do
      get api('/templates/gitignores')
    end

    it { expect(json_response.first['name']).not_to be_nil }
    it { expect(json_response.first['content']).to be_nil }
  end

  context 'requesting gitignores' do
    it 'returns a list of available gitignore templates' 

  end

  context 'requesting gitlab-ci-ymls' do
    it 'returns a list of available gitlab_ci_ymls' 

  end

  context 'requesting gitlab-ci-yml for Ruby' do
    it 'adds a disclaimer on the top' 

  end

  context 'the License Template Entity' do
    before do
      get api('/templates/licenses/mit')
    end

    it 'returns a license template' 

  end

  context 'GET templates/licenses' do
    it 'returns a list of available license templates' 


    describe 'the popular parameter' do
      context 'with popular=1' do
        it 'returns a list of available popular license templates' 

      end
    end
  end

  context 'GET templates/licenses/:name' do
    context 'with :project and :fullname given' do
      before do
        get api("/templates/licenses/#{license_type}?project=My+Awesome+Project&fullname=Anton+#{license_type.upcase}")
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
end

