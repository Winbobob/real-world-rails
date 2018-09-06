require 'spec_helper'

describe SystemHookPushWorker do
  include RepoHelpers

  subject { described_class.new }

  describe '#perform' do
    it 'executes SystemHooksService with expected values' 

  end
end

