require 'spec_helper'

describe AfterBranchDeleteService do
  let(:project) { create(:project, :repository) }
  let(:user) { create(:user) }
  let(:service) { described_class.new(project, user) }

  describe '#execute' do
    it 'stops environments attached to branch' 

  end
end

