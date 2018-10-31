require 'rails_helper'

describe ImportHelper do
  describe '#import_project_target' do
    let(:user) { create(:user) }

    before do
      allow(helper).to receive(:current_user).and_return(user)
    end

    context 'when current user can create namespaces' do
      it 'returns project namespace' 

    end

    context 'when current user can not create namespaces' do
      it "takes the current user's namespace" 

    end
  end

  describe '#provider_project_link' do
    context 'when provider is "github"' do
      let(:github_server_url) { nil }
      let(:provider) { OpenStruct.new(name: 'github', url: github_server_url) }

      before do
        stub_omniauth_setting(providers: [provider])
      end

      context 'when provider does not specify a custom URL' do
        it 'uses default GitHub URL' 

      end

      context 'when provider specify a custom URL' do
        let(:github_server_url) { 'https://github.company.com' }

        it 'uses custom URL' 

      end

      context "when custom URL contains a '/' char at the end" do
        let(:github_server_url) { 'https://github.company.com/' }

        it "doesn't render double slash" 

      end

      context 'when provider is missing' do
        it 'uses the default URL' 

      end
    end

    context 'when provider is "gitea"' do
      before do
        assign(:gitea_host_url, 'https://try.gitea.io/')
      end

      it 'uses given host' 

    end
  end
end

