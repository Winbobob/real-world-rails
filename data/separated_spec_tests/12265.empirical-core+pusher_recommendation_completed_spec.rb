require 'rails_helper'

describe PusherRecommendationCompleted do
  describe '#run' do
   let(:client) { double(:client, trigger: true) }
   let(:classroom) { double(:classroom, id: "some_id", name: "some_name") }

    before do
      allow(Pusher::Client).to receive(:new) { client }
    end
   
    context 'when lesson is given' do
      it 'should send the unit template assigned event' 

    end

    context 'when lesson is not given' do
      it 'should send the personalized recommendations assigned' 

    end
  end
end

