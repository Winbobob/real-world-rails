require 'spec_helper'

describe ContainerRegistry::Path do
  subject { described_class.new(path) }

  describe '#components' do
    let(:path) { 'path/to/some/project' }

    it 'splits components by a forward slash' 

  end

  describe '#nodes' do
    context 'when repository path is valid' do
      let(:path) { 'path/to/some/project' }

      it 'return all project path like node in reverse order' 

    end

    context 'when repository path is invalid' do
      let(:path) { '' }

      it 'rasises en error' 

    end
  end

  describe '#to_s' do
    context 'when path does not have uppercase characters' do
      let(:path) { 'some/image' }

      it 'return a string with a repository path' 

    end

    context 'when path has uppercase characters' do
      let(:path) { 'SoMe/ImAgE' }

      it 'return a string with a repository path' 

    end
  end

  describe '#valid?' do
    context 'when path has less than two components' do
      let(:path) { 'something/' }

      it { is_expected.not_to be_valid }
    end

    context 'when path has more than allowed number of components' do
      let(:path) { 'a/b/c/d/e/f/g/h/i/j/k/l/m/n/o/p/r/s/t/u/w/y/z' }

      it { is_expected.not_to be_valid }
    end

    context 'when path has invalid characters' do
      let(:path) { 'some\path' }

      it { is_expected.not_to be_valid }
    end

    context 'when path has two or more components' do
      let(:path) { 'some/path' }

      it { is_expected.to be_valid }
    end

    context 'when path is related to multi-level image' do
      let(:path) { 'some/path/my/image' }

      it { is_expected.to be_valid }
    end

    context 'when path contains uppercase letters' do
      let(:path) { 'Some/Registry' }

      it { is_expected.to be_valid }
    end

    context 'when path contains double underscore' do
      let(:path) { 'my/repository__name' }

      it { is_expected.to be_valid }
    end

    context 'when path contains invalid separator with dot' do
      let(:path) { 'some/registry-.name' }

      it { is_expected.not_to be_valid }
    end

    context 'when path contains invalid separator with underscore' do
      let(:path) { 'some/registry._name' }

      it { is_expected.not_to be_valid }
    end
  end

  describe '#has_repository?' do
    context 'when project exists' do
      let(:project) { create(:project) }
      let(:path) { "#{project.full_path}/my/image" }

      context 'when path already has matching repository' do
        before do
          create(:container_repository, project: project, name: 'my/image')
        end

        it { is_expected.to have_repository }
        it { is_expected.to have_project }
      end

      context 'when path does not have matching repository' do
        it { is_expected.not_to have_repository }
        it { is_expected.to have_project }
      end
    end

    context 'when project does not exist' do
      let(:path) { 'some/project/my/image' }

      it { is_expected.not_to have_repository }
      it { is_expected.not_to have_project }
    end
  end

  describe '#repository_project' do
    let(:group) { create(:group, path: 'some_group') }

    context 'when project for given path exists' do
      let(:path) { 'some_group/some_project' }

      before do
        create(:project, group: group, name: 'some_project')
        create(:project, name: 'some_project')
      end

      it 'returns a correct project' 

    end

    context 'when project for given path does not exist' do
      let(:path) { 'not/matching' }

      it 'returns nil' 

    end

    context 'when matching multi-level path' do
      let(:project) do
        create(:project, group: group, name: 'some_project')
      end

      context 'when using the zero-level path' do
        let(:path) { project.full_path }

        it 'supports zero-level path' 

      end

      context 'when using first-level path' do
        let(:path) { "#{project.full_path}/repository" }

        it 'supports first-level path' 

      end

      context 'when using second-level path' do
        let(:path) { "#{project.full_path}/repository/name" }

        it 'supports second-level path' 

      end

      context 'when using too deep nesting in the path' do
        let(:path) { "#{project.full_path}/repository/name/invalid" }

        it 'does not support three-levels of nesting' 

      end
    end
  end

  describe '#repository_name' do
    context 'when project does not exist' do
      let(:path) { 'some/name' }

      it 'returns nil' 

    end

    context 'when project exists' do
      let(:group) { create(:group, path: 'Some_Group') }

      before do
        create(:project, group: group, name: 'some_project')
      end

      context 'when project path equal repository path' do
        let(:path) { 'some_group/some_project' }

        it 'returns an empty string' 

      end

      context 'when repository path has one additional level' do
        let(:path) { 'some_group/some_project/repository' }

        it 'returns a correct repository name' 

      end

      context 'when repository path has two additional levels' do
        let(:path) { 'some_group/some_project/repository/image' }

        it 'returns a correct repository name' 

      end
    end
  end

  describe '#project_path' do
    context 'when project does not exist' do
      let(:path) { 'some/name' }

      it 'returns nil' 

    end

    context 'when project with uppercase characters in path exists' do
      let(:path) { 'somegroup/myproject/my/image' }
      let(:group) { create(:group, path: 'SomeGroup') }

      before do
        create(:project, group: group, name: 'MyProject')
      end

      it 'returns downcased project path' 

    end
  end
end

