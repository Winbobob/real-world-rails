require 'spec_helper'

describe Gitlab::HookData::IssuableBuilder do
  set(:user) { create(:user) }

  # This shared example requires a `builder` and `user` variable
  shared_examples 'issuable hook data' do |kind|
    let(:data) { builder.build(user: user) }

    include_examples 'project hook data' do
      let(:project) { builder.issuable.project }
    end
    include_examples 'deprecated repository hook data'

    context "with a #{kind}" do
      it 'contains issuable data' 


      it 'does not contain certain keys' 


      describe 'changes are given' do
        let(:changes) do
          {
            cached_markdown_version: %w[foo bar],
            description: ['A description', 'A cool description'],
            description_html: %w[foo bar],
            in_progress_merge_commit_sha: %w[foo bar],
            lock_version: %w[foo bar],
            merge_jid: %w[foo bar],
            title: ['A title', 'Hello World'],
            title_html: %w[foo bar],
            labels: [
              [{ id: 1, title: 'foo' }],
              [{ id: 1, title: 'foo' }, { id: 2, title: 'bar' }]
            ],
            total_time_spent: [1, 2]
          }
        end
        let(:data) { builder.build(user: user, changes: changes) }

        it 'populates the :changes hash' 


        it 'does not contain certain keys' 

      end
    end
  end

  describe '#build' do
    it_behaves_like 'issuable hook data', 'issue' do
      let(:issuable) { create(:issue, description: 'A description') }
      let(:builder) { described_class.new(issuable) }
    end

    it_behaves_like 'issuable hook data', 'merge_request' do
      let(:issuable) { create(:merge_request, description: 'A description') }
      let(:builder) { described_class.new(issuable) }
    end

    context 'issue is assigned' do
      let(:issue) { create(:issue, assignees: [user]) }
      let(:data) { described_class.new(issue).build(user: user) }

      it 'returns correct hook data' 

    end

    context 'merge_request is assigned' do
      let(:merge_request) { create(:merge_request, assignee: user) }
      let(:data) { described_class.new(merge_request).build(user: user) }

      it 'returns correct hook data' 

    end
  end
end

