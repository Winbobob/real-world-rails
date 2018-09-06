require 'spec_helper'

describe RolesPriorityUpdater do
  let!(:role_a) { create(:role, priority: 1) }
  let!(:role_b) { create(:role, priority: 2) }

  subject { described_class.new([role_b.id, role_a.id]) }

  describe '#call' do
    before do
      subject.call
      role_a.reload
      role_b.reload
    end

    it 'changes priority' 

  end
end

