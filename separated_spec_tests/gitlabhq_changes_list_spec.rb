require "spec_helper"

describe Gitlab::ChangesList do
  let(:valid_changes_string) { "\n000000 570e7b2 refs/heads/my_branch\nd14d6c 6fd24d refs/heads/master" }
  let(:invalid_changes) { 1 }

  context 'when changes is a valid string' do
    let(:changes_list) { described_class.new(valid_changes_string) }

    it 'splits elements by newline character' 


    it 'behaves like a list' 

  end
end

