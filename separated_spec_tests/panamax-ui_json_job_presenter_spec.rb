require 'spec_helper'

describe JsonJobPresenter do

  let(:view_context) { ActionView::Base.new }

  subject(:presenter) { described_class.new(view_context) }

  describe '#title' do
    subject { presenter.title }

    it { should eq '{{name}}' }
  end

  describe '#destroy_path' do
    before do
      allow(view_context).to receive(:jobs_path).and_return('/destroy/path')
    end
    it 'returns the job_path' 

  end

  describe '#status' do
    subject { presenter.status }

    it { should eq '{{status}}' }
  end

  describe '#dom_id' do
    subject { presenter.dom_id }

    it { should eq 'job_{{id}}' }
  end

  describe '#message' do
    its(:message) do
      should eq '{{#if success}}' +
        I18n.t('jobs.completion.success_async') +
        '{{else}}' +
        '{{#if failure}}' +
        I18n.t('jobs.completion.failure') +
        '{{/if}}' +
        '{{/if}}'
    end
  end

  describe '#steps' do
    it 'wraps the injected template with the handlebar tags' 

  end
end

