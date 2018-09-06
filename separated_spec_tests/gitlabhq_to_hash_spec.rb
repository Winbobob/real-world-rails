require 'spec_helper'

describe Gitlab::GithubImport::Representation::ToHash do
  describe '#to_hash' do
    let(:user) { double(:user, attributes: { login: 'alice' }) }

    let(:issue) do
      double(
        :issue,
        attributes: { user: user, assignees: [user], number: 42 }
      )
    end

    let(:issue_hash) { issue.to_hash }

    before do
      user.extend(described_class)
      issue.extend(described_class)
    end

    it 'converts an object to a Hash' 


    it 'converts nested objects to Hashes' 


    it 'converts Array values to Hashes' 


    it 'keeps values as-is if they do not respond to #to_hash' 

  end
end

