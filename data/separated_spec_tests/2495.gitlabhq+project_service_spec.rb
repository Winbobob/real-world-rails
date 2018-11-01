require 'spec_helper'

describe TestHooks::ProjectService do
  let(:current_user) { create(:user) }

  describe '#execute' do
    let(:project) { create(:project, :repository) }
    let(:hook)    { create(:project_hook, project: project) }
    let(:trigger) { 'not_implemented_events' }
    let(:service) { described_class.new(hook, current_user, trigger) }
    let(:sample_data) { { data: 'sample' } }
    let(:success_result) { { status: :success, http_status: 200, message: 'ok' } }

    it 'allows to set a custom project' 


    context 'hook with not implemented test' do
      it 'returns error message' 

    end

    context 'push_events' do
      let(:trigger) { 'push_events' }
      let(:trigger_key) { :push_hooks }

      it 'returns error message if not enough data' 


      it 'executes hook' 

    end

    context 'tag_push_events' do
      let(:trigger) { 'tag_push_events' }
      let(:trigger_key) { :tag_push_hooks }

      it 'returns error message if not enough data' 


      it 'executes hook' 

    end

    context 'note_events' do
      let(:trigger) { 'note_events' }
      let(:trigger_key) { :note_hooks }

      it 'returns error message if not enough data' 


      it 'executes hook' 

    end

    context 'issues_events' do
      let(:trigger) { 'issues_events' }
      let(:trigger_key) { :issue_hooks }
      let(:issue) { build(:issue) }

      it 'returns error message if not enough data' 


      it 'executes hook' 

    end

    context 'confidential_issues_events' do
      let(:trigger) { 'confidential_issues_events' }
      let(:trigger_key) { :confidential_issue_hooks }
      let(:issue) { build(:issue) }

      it 'returns error message if not enough data' 


      it 'executes hook' 

    end

    context 'merge_requests_events' do
      let(:trigger) { 'merge_requests_events' }
      let(:trigger_key) { :merge_request_hooks }

      it 'returns error message if not enough data' 


      it 'executes hook' 

    end

    context 'job_events' do
      let(:trigger) { 'job_events' }
      let(:trigger_key) { :job_hooks }

      it 'returns error message if not enough data' 


      it 'executes hook' 

    end

    context 'pipeline_events' do
      let(:trigger) { 'pipeline_events' }
      let(:trigger_key) { :pipeline_hooks }

      it 'returns error message if not enough data' 


      it 'executes hook' 

    end

    context 'wiki_page_events' do
      let(:project) { create(:project, :wiki_repo) }
      let(:trigger) { 'wiki_page_events' }
      let(:trigger_key) { :wiki_page_hooks }

      it 'returns error message if wiki disabled' 


      it 'returns error message if not enough data' 


      it 'executes hook' 

    end
  end
end

