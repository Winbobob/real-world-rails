require 'rails_helper'

describe PusherCSVExportCompleted do
  describe '#run' do
    let(:client) { double(:client, trigger: true) }

    before do
      allow(Pusher::Client).to receive(:new) { client }
    end

    it 'should create a pusher client and trigger the event' 

  end
end

