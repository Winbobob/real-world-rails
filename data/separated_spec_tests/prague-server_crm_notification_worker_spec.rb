require 'spec_helper'

describe CrmNotificationWorker do

  let(:customer) { create(:customer) }
  let(:organization) { create(:organization) }
  let(:crm) { create(:crm, organization: organization) }
  let(:charge) { create(:charge, customer: customer, organization: organization) }

  describe '#perform' do
    describe 'without a crm' do
      let(:crm) { nil }
      it 'should log and return' 

    end

    describe 'actionkit' do
      let!(:crm) { create(:crm, platform: 'actionkit', organization: organization) }

      specify 'should notify ActionKit' do
        expect_any_instance_of(ActionKitNotifier).to receive(:process).with(charge)
        CrmNotificationWorker.new.perform(charge.id)
      end
    end

    describe 'bluestate' do
      let!(:crm) { create(:crm, platform: 'bluestate', organization: organization) }

      it 'should notify bsd' 

    end
  end
end

