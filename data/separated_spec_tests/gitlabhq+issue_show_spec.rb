require 'spec_helper'

describe Gitlab::SlashCommands::Presenters::IssueShow do
  let(:project) { create(:project) }
  let(:issue) { create(:issue, project: project) }
  let(:attachment) { subject[:attachments].first }

  subject { described_class.new(issue).present }

  it { is_expected.to be_a(Hash) }

  it 'shows the issue' 


  context 'with upvotes' do
    before do
      create(:award_emoji, :upvote, awardable: issue)
    end

    it 'shows the upvote count' 

  end

  context 'with labels' do
    let(:label) { create(:label, project: project, title: 'mep') }
    let(:label1) { create(:label, project: project, title: 'mop') }

    before do
      issue.labels << [label, label1]
    end

    it 'shows the labels' 

  end

  context 'confidential issue' do
    let(:issue) { create(:issue, project: project) }

    it 'shows an ephemeral response' 

  end
end

