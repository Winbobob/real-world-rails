# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ReservationsHelper, type: :helper do
  describe '.manage_reservations_btn' do
    let!(:reservation) { create(:valid_reservation) }

    context 'when reservation is a request' do
      before { reservation.update!(status: 'requested') }

      context 'and can manage requests' do
        before do
          allow(helper).to receive(:can?)
            .with(:override, :reservation_errors)
            .and_return(true)
        end

        it 'returns a link to review request' 

        it 'links to the right url' 

      end

      context 'cannot manage requests' do
        before do
          allow(helper).to receive(:can?)
            .with(:override, :reservation_errors)
            .and_return(false)
        end

        it 'returns nil' 

      end
    end

    context 'when reservation is reserved' do
      it 'returns a link to check out the reservation' 

      it 'links to the right url' 

    end

    context 'when reservation is checked out' do
      before do
        item = reservation.equipment_model.equipment_items.first
        params = ActionController::Parameters.new
        reservation.checkout(item.id, reservation.reserver, params, '').save!
      end

      it 'returns a link to check in the reservation' 

      it 'links to the right url' 

    end

    context 'when reservation is checked in' do
      it 'returns nil' 

    end
  end
end

