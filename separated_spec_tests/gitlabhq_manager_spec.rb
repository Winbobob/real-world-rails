require 'spec_helper'

describe Gitlab::SidekiqVersioning::Manager do
  before do
    Sidekiq::Manager.prepend described_class
  end

  describe '#initialize' do
    it 'listens on all expanded queues' 

  end
end

