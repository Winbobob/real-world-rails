require 'spec_helper'

describe SubmoduleHelper do
  include RepoHelpers

  describe 'submodule links' do
    let(:submodule_item) { double(id: 'hash', path: 'rack') }
    let(:config) { Gitlab.config.gitlab }
    let(:repo) { double() }

    before do
      self.instance_variable_set(:@repository, repo)
    end

    context 'submodule on self' do
      before do
        allow(Gitlab.config.gitlab).to receive(:protocol).and_return('http') # set this just to be sure
      end

      it 'detects ssh on standard port' 


      it 'detects ssh on non-standard port' 


      it 'detects http on standard port' 


      it 'detects http on non-standard port' 


      it 'works with relative_url_root' 


      it 'works with subgroups' 

    end

    context 'submodule on github.com' do
      it 'detects ssh' 


      it 'detects http' 


      it 'detects https' 


      it 'handles urls with no .git on the end' 


      it 'returns original with non-standard url' 

    end

    context 'in-repository submodule' do
      let(:group) { create(:group, name: "Master Project", path: "master-project") }
      let(:project) { create(:project, group: group) }
      before do
        self.instance_variable_set(:@project, project)
      end

      it 'in-repository' 

    end

    context 'submodule on gitlab.com' do
      it 'detects ssh' 


      it 'detects http' 


      it 'detects https' 


      it 'handles urls with no .git on the end' 


      it 'handles urls with trailing whitespace' 


      it 'returns original with non-standard url' 

    end

    context 'submodule on unsupported' do
      it 'sanitizes unsupported protocols' 


      it 'sanitizes unsupported protocols disguised as a repository URL' 


      it 'sanitizes invalid URL with extended ASCII' 


      it 'returns original' 

    end

    context 'submodules with relative links' do
      let(:group) { create(:group, name: "Master Project", path: "master-project") }
      let(:project) { create(:project, group: group) }
      let(:commit_id) { sample_commit[:id] }

      before do
        self.instance_variable_set(:@project, project)
      end

      it 'one level down' 


      it 'with trailing whitespace' 


      it 'two levels down' 


      it 'one level down with namespace and repo' 


      it 'two levels down with namespace and repo' 


      context 'personal project' do
        let(:user) { create(:user) }
        let(:project) { create(:project, namespace: user.namespace) }

        it 'one level down with personal project' 

      end
    end
  end

  def stub_url(url)
    allow(repo).to receive(:submodule_url_for).and_return(url)
  end
end

