require 'spec_helper'

describe PublicEventsController do
  before do
    event.update_attributes(external_applications: true)
  end

  let(:event) { events(:top_event) }
  let(:group) { event.groups.first }

  context 'GET show' do
    context 'as logged in user' do
      before { sign_in(people(:top_leader)) }
      it 'displays event page' 

    end

    context 'as external user' do
      it 'displays public event page' 


      it 'redirect to login if external application isnt possible' 

    end
  end
end

