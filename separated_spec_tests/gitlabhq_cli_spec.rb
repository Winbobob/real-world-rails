require 'spec_helper'

describe Gitlab::StorageCheck::CLI do
  let(:options) { Gitlab::StorageCheck::Options.new('unix://tmp/socket.sock', nil, 1, false) }
  subject(:runner) { described_class.new(options) }

  describe '#update_settings' do
    it 'updates the interval when changed in a valid response and logs the change' 

  end
end

