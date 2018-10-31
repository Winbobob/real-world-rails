require 'rails_helper'

describe ProjectOperations do
  let(:user)           { create(:user) }
  let(:project_params) { { name: 'Foo bar', start_date: Date.current } }
  let(:project) { user.projects.build(project_params) }

  describe 'Create' do
    context 'with valid params' do
      subject { -> { ProjectOperations::Create.call(project, user) } }

      it { expect { subject.call }.to change { Project.count } }
      it { expect(subject.call).to be_eql Project.last }
    end

    context 'with invalid params' do
      before { project.name = nil }

      subject { -> { ProjectOperations::Create.call(project, user) } }

      it { is_expected.to_not change { Project.count } }
      it { expect(subject.call).to be_falsy }
    end
  end

  describe 'Update' do
    before { project.save! }

    context 'with valid params' do
      subject { -> { ProjectOperations::Update.call(project, { name: 'Hello World' }, user) } }

      it { expect { subject.call }.to_not change { Project.count } }
      it { expect(subject.call.name).to be_eql 'Hello World' }
    end

    context 'with invalid params' do
      before { project.name = nil }

      subject { -> { ProjectOperations::Update.call(project, { name: nil }, user) } }

      it { expect(subject.call).to be_falsy }
    end
  end

  describe 'Destroy' do
    before { project.save! }

    subject { -> { ProjectOperations::Destroy.call(project, user) } }

    it { expect { subject.call }.to change { Project.count }.by(-1) }
  end

  describe '::ActivityRecording' do
    context 'Create' do
      subject { -> { ProjectOperations::Create.call(project, user) } }

      it 'must record an activity' 

    end

    context 'Update' do
      before { project.save! }

      subject do
        lambda do
          ProjectOperations::Update.call(
            project,
            { name: 'Hello World', point_scale: 'linear', iteration_start_day: 4 },
            user
          )
        end
      end

      it 'must record an activity' 

    end

    context 'Destroy' do
      before { project.save! }

      subject { -> { ProjectOperations::Destroy.call(project, user) } }

      it 'must record an activity' 

    end
  end
end

