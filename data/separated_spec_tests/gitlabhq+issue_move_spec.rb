require 'spec_helper'

describe Gitlab::SlashCommands::IssueMove, service: true do
  describe '#match' do
    shared_examples_for 'move command' do |text_command|
      it 'can be parsed to extract the needed fields' 

    end

    it_behaves_like 'move command', 'issue move #123456 to gitlab/gitlab-ci'
    it_behaves_like 'move command', 'issue move #123456 gitlab/gitlab-ci'
    it_behaves_like 'move command', 'issue move #123456 gitlab/gitlab-ci '
    it_behaves_like 'move command', 'issue move 123456 to gitlab/gitlab-ci'
    it_behaves_like 'move command', 'issue move 123456 gitlab/gitlab-ci'
    it_behaves_like 'move command', 'issue move 123456 gitlab/gitlab-ci '
  end

  describe '#execute' do
    set(:user) { create(:user) }
    set(:issue) { create(:issue) }
    set(:chat_name) { create(:chat_name, user: user) }
    set(:project) { issue.project }
    set(:other_project) { create(:project, namespace: project.namespace) }

    before do
      [project, other_project].each { |prj| prj.add_maintainer(user) }
    end

    subject { described_class.new(project, chat_name) }

    def process_message(message)
      subject.execute(described_class.match(message))
    end

    context 'when the user can move the issue' do
      context 'when the move fails' do
        it 'returns the error message' 

      end

      context 'when the move succeeds' do
        let(:message) { "issue move #{issue.iid} #{other_project.full_path}" }

        it 'moves the issue to the new destination' 


        it 'returns the new issue' 


        it 'mentions the old issue' 

      end
    end

    context 'when the issue does not exist' do
      it 'returns not found' 

    end

    context 'when the target project does not exist' do
      it 'returns not found' 

    end

    context 'when the user cannot see the target project' do
      it 'returns not found' 

    end

    context 'when the user does not have the required permissions on the target project' do
      it 'returns the error message' 

    end
  end
end

