require 'spec_helper'

describe Gitlab::ManifestImport::ProjectCreator, :postgresql do
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let(:repository) do
    {
      path: 'device/common',
      url: 'https://android-review.googlesource.com/device/common'
    }
  end

  before do
    group.add_owner(user)
  end

  subject { described_class.new(repository, group, user) }

  describe '#execute' do
    it { expect(subject.execute).to be_a(Project) }
    it { expect { subject.execute }.to change { Project.count }.by(1) }
    it { expect { subject.execute }.to change { Group.count }.by(1) }

    it 'creates project with valid full path and import url' 

  end
end

