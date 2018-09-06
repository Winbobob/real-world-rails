require 'spec_helper'

describe HooksHelper do
  let(:project) { create(:project) }
  let(:project_hook) { create(:project_hook, project: project) }
  let(:system_hook) { create(:system_hook) }
  let(:trigger) { 'push_events' }

  describe '#link_to_test_hook' do
    it 'returns project namespaced link' 


    it 'returns admin namespaced link' 

  end
end

