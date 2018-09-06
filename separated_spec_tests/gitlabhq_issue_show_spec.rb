require 'spec_helper'

describe Gitlab::SlashCommands::IssueShow do
  describe '#execute' do
    let(:issue) { create(:issue, project: project) }
    let(:project) { create(:project) }
    let(:user) { issue.author }
    let(:chat_name) { double(:chat_name, user: user) }
    let(:regex_match) { described_class.match("issue show #{issue.iid}") }

    before do
      project.add_master(user)
    end

    subject do
      described_class.new(project, chat_name).execute(regex_match)
    end

    context 'the issue exists' do
      let(:title) { subject[:attachments].first[:title] }

      it 'returns the issue' 


      context 'when its reference is given' do
        let(:regex_match) { described_class.match("issue show #{issue.to_reference}") }

        it 'shows the issue' 

      end
    end

    context 'the issue does not exist' do
      let(:regex_match) { described_class.match("issue show 2343242") }

      it "returns not found" 

    end
  end

  describe '.match' do
    it 'matches the iid' 


    it 'accepts a reference' 

  end
end

