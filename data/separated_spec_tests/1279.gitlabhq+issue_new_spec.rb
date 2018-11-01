require 'spec_helper'

describe Gitlab::SlashCommands::IssueNew do
  describe '#execute' do
    let(:project) { create(:project) }
    let(:user) { create(:user) }
    let(:chat_name) { double(:chat_name, user: user) }
    let(:regex_match) { described_class.match("issue create bird is the word") }

    before do
      project.add_maintainer(user)
    end

    subject do
      described_class.new(project, chat_name).execute(regex_match)
    end

    context 'without description' do
      it 'creates the issue' 

    end

    context 'with description' do
      let(:description) { "Surfin bird" }
      let(:regex_match) { described_class.match("issue create bird is the word\n#{description}") }

      it 'creates the issue with description' 

    end

    context "with more newlines between the title and the description" do
      let(:description) { "Surfin bird" }
      let(:regex_match) { described_class.match("issue create bird is the word\n\n#{description}\n") }

      it 'creates the issue' 

    end

    context 'issue cannot be created' do
      let!(:issue)  { create(:issue, project: project, title: 'bird is the word') }
      let(:regex_match) { described_class.match("issue create #{'a' * 512}}") }

      it 'displays the errors' 

    end
  end

  describe '.match' do
    it 'matches the title without description' 


    it 'matches the title with description' 


    it 'matches the alias new' 

  end
end

