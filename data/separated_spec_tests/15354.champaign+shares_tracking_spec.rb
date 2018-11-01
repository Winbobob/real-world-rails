# frozen_string_literal: true

require 'rails_helper'

describe 'tracking clicks and conversions on whatsapp shares' do
  let(:page) { create(:page, id: 123) }
  let(:button) { create(:share_button) }
  let!(:share) { create(:share_whatsapp, id: 1, conversion_count: 0, click_count: 0, page: page, button: button) }

  context 'tracking clicks - in api/shares/track' do
    it 'increments click count on the record' 

  end

  describe 'tracking conversions - in pages/show' do
    it 'checks for share variant id and source and increments conversion count' 


    it 'returns 200 even if variant ID in the parameters doesnt find a match' 

  end
end

