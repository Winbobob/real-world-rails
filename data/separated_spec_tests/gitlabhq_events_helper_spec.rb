require 'spec_helper'

describe EventsHelper do
  describe '#event_commit_title' do
    let(:message) { "foo & bar " + "A" * 70 + "\n" + "B" * 80 }
    subject { helper.event_commit_title(message) }

    it "returns the first line, truncated to 70 chars" 


    it "is not html-safe" 


    it "handles empty strings" 


    it 'handles nil values' 


    it 'does not escape HTML entities' 

  end
end

