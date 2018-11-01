require 'spec_helper'

describe GroupDestroyWorker do
  let(:group) { create(:group) }
  let(:user) { create(:admin) }
  let!(:project) { create(:project, namespace: group) }

  subject { described_class.new }

  describe "#perform" do
    it "deletes the project" 

  end
end

