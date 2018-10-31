require 'spec_helper'

describe TodosFinder do
  describe '#execute' do
    let(:user) { create(:user) }
    let(:group) { create(:group) }
    let(:project) { create(:project, namespace: group) }
    let(:finder) { described_class }

    before do
      group.add_developer(user)
    end

    describe '#sort' do
      context 'by date' do
        let!(:todo1) { create(:todo, user: user, project: project) }
        let!(:todo2) { create(:todo, user: user, project: project) }
        let!(:todo3) { create(:todo, user: user, project: project) }

        it 'sorts with oldest created first' 


        it 'sorts with newest created first' 

      end

      it "sorts by priority" 

    end
  end
end

