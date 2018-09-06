# frozen_string_literal: true

require 'rails_helper'

describe AttachFilesToWorkFailureService do
  let(:depositor) { create(:user) }
  let(:file)      { File.open(File.join(fixture_path, 'world.png')) }
  let(:inbox)     { depositor.mailbox.inbox }

  describe '#call' do
    subject { described_class.new(depositor, file) }

    it 'sends a failure message' 

  end
end
