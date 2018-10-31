require 'spec_helper'

describe SearchService do
  let(:user) { create(:user) }

  let(:accessible_group) { create(:group, :private) }
  let(:inaccessible_group) { create(:group, :private) }
  let!(:group_member) { create(:group_member, group: accessible_group, user: user) }

  let!(:accessible_project) { create(:project, :private, name: 'accessible_project') }
  let!(:inaccessible_project) { create(:project, :private, name: 'inaccessible_project') }
  let(:note) { create(:note_on_issue, project: accessible_project) }

  let(:snippet) { create(:snippet, author: user) }
  let(:group_project) { create(:project, group: accessible_group, name: 'group_project') }
  let(:public_project) { create(:project, :public, name: 'public_project') }

  before do
    accessible_project.add_maintainer(user)
  end

  describe '#project' do
    context 'when the project is accessible' do
      it 'returns the project' 


      it 'returns the project for guests' 

    end

    context 'when the project is not accessible' do
      it 'returns nil' 

    end

    context 'when there is no project_id' do
      it 'returns nil' 

    end
  end

  describe '#group' do
    context 'when the group is accessible' do
      it 'returns the group' 

    end

    context 'when the group is not accessible' do
      it 'returns nil' 

    end

    context 'when there is no group_id' do
      it 'returns nil' 

    end
  end

  describe '#show_snippets?' do
    context 'when :snippets is \'true\'' do
      it 'returns true' 

    end

    context 'when :snippets is not \'true\'' do
      it 'returns false' 

    end

    context 'when :snippets is missing' do
      it 'returns false' 

    end
  end

  describe '#scope' do
    context 'with accessible project_id' do
      context 'and allowed scope' do
        it 'returns the specified scope' 

      end

      context 'and disallowed scope' do
        it 'returns the default scope' 

      end

      context 'and no scope' do
        it 'returns the default scope' 

      end
    end

    context 'with \'true\' snippets' do
      context 'and allowed scope' do
        it 'returns the specified scope' 

      end

      context 'and disallowed scope' do
        it 'returns the default scope' 

      end

      context 'and no scope' do
        it 'returns the default scope' 

      end
    end

    context 'with no project_id, no snippets' do
      context 'and allowed scope' do
        it 'returns the specified scope' 

      end

      context 'and disallowed scope' do
        it 'returns the default scope' 

      end

      context 'and no scope' do
        it 'returns the default scope' 

      end
    end
  end

  describe '#search_results' do
    context 'with accessible project_id' do
      it 'returns an instance of Gitlab::ProjectSearchResults' 

    end

    context 'with accessible project_id and \'true\' snippets' do
      it 'returns an instance of Gitlab::ProjectSearchResults' 

    end

    context 'with \'true\' snippets' do
      it 'returns an instance of Gitlab::SnippetSearchResults' 

    end

    context 'with no project_id and no snippets' do
      it 'returns an instance of Gitlab::SearchResults' 

    end
  end

  describe '#search_objects' do
    context 'with accessible project_id' do
      it 'returns objects in the project' 

    end

    context 'with accessible project_id and \'true\' snippets' do
      it 'returns objects in the project' 

    end

    context 'with \'true\' snippets' do
      it 'returns objects in snippets' 

    end

    context 'with accessible group_id' do
      it 'returns objects in the group' 

    end

    context 'with no project_id, group_id or snippets' do
      it 'returns objects in global' 

    end
  end
end

