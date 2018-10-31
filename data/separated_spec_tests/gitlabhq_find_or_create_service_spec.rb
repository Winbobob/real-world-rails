require 'spec_helper'

describe Labels::FindOrCreateService do
  describe '#execute' do
    let(:group)   { create(:group) }
    let(:project) { create(:project, namespace: group) }

    let(:params) do
      {
        title: 'Security',
        description: 'Security related stuff.',
        color: '#FF0000'
      }
    end

    context 'when acting on behalf of a specific user' do
      let(:user) { create(:user) }

      context 'when finding labels on project level' do
        subject(:service) { described_class.new(user, project, params) }

        before do
          project.add_developer(user)
        end

        context 'when label does not exist at group level' do
          it 'creates a new label at project level' 

        end

        context 'when label exists at group level' do
          it 'returns the group label' 

        end

        context 'when label exists at project level' do
          it 'returns the project label' 

        end
      end

      context 'when finding labels on group level' do
        subject(:service) { described_class.new(user, group, params) }

        before do
          group.add_developer(user)
        end

        context 'when label does not exist at group level' do
          it 'creates a new label at group level' 

        end

        context 'when label exists at group level' do
          it 'returns the group label' 

        end
      end
    end

    context 'when authorization is not required' do
      context 'when finding labels on project level' do
        subject(:service) { described_class.new(nil, project, params) }

        it 'returns the project label' 

      end

      context 'when finding labels on group level' do
        subject(:service) { described_class.new(nil, group, params) }

        it 'returns the group label' 

      end
    end
  end
end

