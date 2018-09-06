require 'spec_helper'

describe ProjectsRepository do
  subject { described_class }

  describe '#ending_in_a_week' do
    subject { described_class.new.ending_in_a_week }

    let(:project) { create(:project, end_at: 1.week.from_now.midnight) }
    let(:project_ending_late) { create(:project, end_at: 2.weeks.from_now) }
    let(:inactive_project) { create(:project, end_at: 1.week.from_now, archived: true) }

    it 'returns projects ending in a week' 


    it 'does not return projects ending later' 


    it 'returns only active projects' 

  end

  describe '#find_or_create_by_name' do
    context 'project already exists' do
      let(:project) { create(:project) }

      it 'finds existing project' 

    end

    context 'project does not exist' do
      it 'creates a new project with given name' 


      it 'sets project type to regular' 

    end
  end

  describe '#to_synchronize' do
    subject { described_class.new.to_synchronize }

    let!(:project) { create(:project) }
    let!(:not_synchronized_project) { create(:project, synchronize: false) }

    it 'return only one project' 


    it 'return project which should be synchronized' 


    it 'does not return project which should not be synchronized' 

  end

  context 'project statuses' do
    let(:active_project) { create(:project) }
    let(:potential_project) { create(:project, potential: true) }
    let(:archived_project) { create(:project, archived: true) }
    let(:archived_potential_project) { create(:project, archived: true, potential: true) }

    describe '#active_with_memberships' do
      subject { described_class.new.active_with_memberships }

      it 'returns active projects' 


      it 'does not return potential projects' 


      it 'does not return archived projects' 


      it 'does not return archived potential projects' 

    end

    describe '#active' do
      subject { described_class.new.active }

      it 'returns active projects' 


      it 'does not return potential projects' 


      it 'does not return archived projects' 


      it 'does not return archived potential projects' 

    end

    describe '#potential' do
      subject { described_class.new.potential }

      it 'does not return active projects' 


      it 'returns potential projects' 


      it 'does not return archived projects' 


      it 'does not return archived potential projects' 

    end

    describe '#not_potential' do
      subject { described_class.new.not_potential }

      it 'returns active projects' 


      it 'does not return potential projects' 


      it 'returns archived projects' 


      it 'does not return archived potential projects' 

    end

    describe '#archived' do
      subject { described_class.new.archived }

      it 'does not return active projects' 


      it 'does not return potential projects' 


      it 'returns archived projects' 


      it 'returns archived potential projects' 

    end
  end
end

