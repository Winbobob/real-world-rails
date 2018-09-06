require 'spec_helper'

describe TestHooks::SystemService do
  let(:current_user) { create(:user) }

  describe '#execute' do
    let(:project) { create(:project, :repository) }
    let(:hook)    { create(:system_hook) }
    let(:service) { described_class.new(hook, current_user, trigger) }
    let(:success_result) { { status: :success, http_status: 200, message: 'ok' } }

    before do
      allow(Project).to receive(:first).and_return(project)
    end

    context 'hook with not implemented test' do
      let(:trigger) { 'not_implemented_events' }

      it 'returns error message' 

    end

    context 'push_events' do
      let(:trigger) { 'push_events' }
      let(:trigger_key) { :push_hooks }

      it 'executes hook' 

    end

    context 'tag_push_events' do
      let(:trigger) { 'tag_push_events' }
      let(:trigger_key) { :tag_push_hooks }

      it 'executes hook' 

    end

    context 'repository_update_events' do
      let(:trigger) { 'repository_update_events' }
      let(:trigger_key) { :repository_update_hooks }

      it 'executes hook' 

    end

    context 'merge_requests_events' do
      let(:trigger) { 'merge_requests_events' }

      it 'returns error message if the user does not have any repository with a merge request' 


      it 'executes hook' 

    end
  end
end

