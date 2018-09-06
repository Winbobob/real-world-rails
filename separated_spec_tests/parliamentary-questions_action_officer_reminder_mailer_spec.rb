require 'spec_helper'

describe 'ActionOfficerReminderMailer' do
  let(:ao) { create(:action_officer,  name: 'ao name 1', email: 'ao@ao.gov') }
  let(:minister_1) { create(:minister, name: 'Mr Name1 for Test') }

  before(:each) do
    ActionMailer::Base.deliveries = []
    @pq = create(:pq, uin: 'HL789', question: 'test question?', member_name:'Asking MP', minister_id: minister_1.id, house_name: 'House of Lords')
    @ao_pq = ActionOfficersPq.new(action_officer_id: ao.id, pq_id: @pq.id)

  end

  describe 'Accept reminder' do
    describe 'deliver' do
      it 'should include house, member name and uin from PQ and AO name' 

    end
  end

  describe 'draft reminder' do
    describe 'deliver' do
      it 'should have URGENT in the subject' 

      it 'should have the internal deadline in the body' 


    end
  end
end

