require 'spec_helper'

describe MailScheduler::IssueDueWorker do
  describe '#perform' do
    let(:worker) { described_class.new }
    let(:project) { create(:project) }

    it 'sends emails for open issues due tomorrow in the project specified' 

  end
end

