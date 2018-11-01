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
      let(:group) { create(:group, name: "top group", path: "top-group") }
      let(:project) { create(:project, group: group) }
      let(:repo) { double(:repo, project: project) }

      def expect_relative_link_to_resolve_to(relative_path, expected_path)
        allow(repo).to receive(:submodule_url_for).and_return(relative_path)

        result = submodule_links(submodule_item)

        expect(result).to eq([expected_path, "#{expected_path}/tree/#{submodule_item.id}"])
      end

      it 'handles project under same group' 


      it 'handles trailing whitespace' 


      it 'handles project under another top group' 


      context 'repo path resolves to be located at root (namespace absent)' do
        it 'returns nil' 

      end

      context 'repo path resolves to be located underneath current project path' do
        it 'returns nil because it is not possible to have repo nested under another repo' 

      end

      context 'subgroup' do
        let(:sub_group) { create(:group, parent: group, name: "sub group", path: "sub-group") }
        let(:sub_project) { create(:project, group: sub_group) }

        context 'project in sub group' do
          let(:project) { sub_project }

          it "handles referencing ancestor group's project" 

        end

        it "handles referencing descendent group's project" 


        it "handles referencing another top group's project" 

      end

      context 'personal project' do
        let(:user) { create(:user) }
        let(:project) { create(:project, namespace: user.namespace) }

        it 'handles referencing another personal project' 

      end
    end
  end

  def stub_url(url)
    allow(repo).to receive(:submodule_url_for).and_return(url)
  end
end

