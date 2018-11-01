require 'spec_helper'

describe Gitlab::Ci::Status::External::Factory do
  let(:user) { create(:user) }
  let(:project) { resource.project }
  let(:status) { factory.fabricate! }
  let(:factory) { described_class.new(resource, user) }
  let(:external_url) { 'http://gitlab.com/status' }

  before do
    project.add_developer(user)
  end

  context 'when external status has a simple core status' do
    HasStatus::AVAILABLE_STATUSES.each do |simple_status|
      context "when core status is #{simple_status}" do
        let(:resource) do
          create(:generic_commit_status, status: simple_status,
                                         target_url: external_url)
        end

        let(:expected_status) do
          Gitlab::Ci::Status.const_get(simple_status.capitalize)
        end

        it "fabricates a core status #{simple_status}" 


        it 'extends core status with common methods' 

      end
    end
  end
end

