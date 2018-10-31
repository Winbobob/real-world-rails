require 'spec_helper'

module Spree
  describe Api::V1::StatesController, type: :controller do
    render_views

    let!(:state) { create(:state, name: 'Victoria') }
    let(:attributes) { [:id, :name, :abbr, :country_id] }

    before do
      stub_authentication!
    end

    it 'gets all states' 


    it 'gets all the states for a particular country' 


    context 'pagination' do
      let(:scope) { double('scope') }

      before do
        expect(scope).to receive_messages(last: state)
        expect(State).to receive_messages(accessible_by: scope)
        expect(scope).to receive_messages(order: scope)
        allow(scope).to receive_message_chain(:ransack, :result, :includes).and_return(scope)
      end

      it 'does not paginate states results when asked not to do so' 


      it 'paginates when page parameter is passed through' 


      it 'paginates when per_page parameter is passed through' 

    end

    context 'with two states' do
      before { create(:state, name: 'New South Wales') }

      it 'gets all states for a country' 


      it 'can view all states' 


      it 'can query the results through a paramter' 

    end

    it 'can view a state' 

  end
end

