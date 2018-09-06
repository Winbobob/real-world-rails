require 'spec_helper'

describe AuthorizedProjectsWorker do
  describe '#perform' do
    let(:user) { create(:user) }

    subject(:job) { described_class.new }

    it "refreshes user's authorized projects" 


    context "when the user is not found" do
      it "does nothing" 

    end
  end
end

